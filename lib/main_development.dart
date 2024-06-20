import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_banking/app.dart';
import 'package:mobile_banking/common/localization/constant.dart';
import 'package:mobile_banking/common/util/notification_utility.dart';
import 'package:mobile_banking/config/config.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  final devAppConfig = FlavorConfig(
    appName: 'Mobile Banking PAC DEV',
    flavor: FlavorType.development,
  );
  await dotenv.load(fileName: '.dev.env');
  await Injections().initialize();
  await NotificationUtility.initNotification();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  Widget app =
      await getLocale().then((value) => initializeApp(devAppConfig, value));
  runApp(app);
  // NetworkUtility.instance.getConnectivity();
}
