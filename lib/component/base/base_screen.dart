import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_banking/common/navigation/navigation_helper.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

mixin BaseScreen {
  NavigationHelper get navigationHelper => sl<NavigationHelper>();

  void hideLoading() {
    EasyLoading.dismiss();
  }
}
