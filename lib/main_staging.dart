import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_banking/app.dart';
import 'package:mobile_banking/common/localization/constant.dart';
import 'package:mobile_banking/common/util/util.dart';
import 'package:mobile_banking/config/config.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  final stgAppConfig = FlavorConfig(
    appName: '',
    flavor: FlavorType.staging,
  );
  await dotenv.load(fileName: '.env');
  await Injections().initialize();
  await NotificationUtility.initNotification();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  Widget app =
      await getLocale().then((value) => initializeApp(stgAppConfig, value));
  runApp(app);
  // NetworkUtility.instance.getConnectivity();
}
