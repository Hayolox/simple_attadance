import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_banking/common/localization/constant.dart';
import 'package:mobile_banking/common/localization/delegation.dart';
import 'package:mobile_banking/common/navigation/navigation.dart';
import 'package:mobile_banking/common/navigation/router/app_router.dart';
import 'package:mobile_banking/common/style/style.dart';
import 'package:mobile_banking/common/util/util.dart';
import 'package:mobile_banking/component/component.dart';
import 'package:mobile_banking/config/config.dart';
import 'package:mobile_banking/data/model/global/global_model.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

import 'data/datasource/local/preferences/preferences.dart';

Future<Widget> initializeApp(FlavorConfig appConfig, Locale locale) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return App(
    config: appConfig,
    locale: locale,
  );
}

class App extends StatefulWidget {
  const App({
    super.key,
    required this.config,
    required this.locale,
  });

  final FlavorConfig config;
  final Locale locale;

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_AppState>();
    state!.setLocale(newLocale);
  }

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  final router = sl<AppRouter>();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<void> _setupRemoteConfig() async {
    await Firebase.initializeApp();
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
    await remoteConfig.fetchAndActivate();

    sl<Global>().remoteConfig = remoteConfig;

    //decompose
    var map = json.decode(remoteConfig.getString('sslValue'));
    map.values.forEach((e) {
      sl<Global>().rawData.add(e);
    });
  }

  Future<void> _initPlatformState() async {
    try {
      if (Platform.isAndroid) {
        _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      log('Missing platform devices');
    }
  }

  _readAndroidBuildData(AndroidDeviceInfo androidDeviceInfo) async {
    Prefs.setDeviceId(androidDeviceInfo.id);
  }

  _readIosDeviceInfo(IosDeviceInfo iosDeviceInfo) async {
    Prefs.setDeviceId('${iosDeviceInfo.identifierForVendor}');
  }

  @override
  void initState() {
    _setupRemoteConfig();
    _initPlatformState();
    FcmUtility.registerNotification();
    FcmUtility.newFirebaseSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,

          locale: _locale,
          supportedLocales: const [
            Locale('id', ''),
            Locale('en', ''),
            Locale('ja', '')
          ],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          theme: themeData(
            context: context,
            // colorSchemePrimary: state.colorSchemePrimary.data,
            // colorSchemeSecondary: state.colorSchemeSecondary.data,
          ),
          navigatorKey: NavigationHelperImpl.navigatorKey,
          onGenerateRoute: (settings) {
            return AppRouter.generateRoute(settings);
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (_) => const Scaffold(),
            );
          },
          builder: (context, child) {
            return FutureBuilder<String>(
              future: getAppVersion(),
              builder: (context, snapshot) {
                return EnvBanner(
                  location: EnvBannerLocation.topEnd,
                  primary: getFlavorText(widget.config.flavor),
                  secondary: snapshot.data,
                  child: EasyLoading.init()(context, child),
                );
              },
            );
          },
          navigatorObservers: <NavigatorObserver>[App.observer],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
