import 'package:flutter/material.dart';
import 'package:mobile_banking/common/localization/language/language.dart';

// this code for showcase view

extension LanguagesExtension on BuildContext {
  Languages get appLanguages => Languages.of(this)!;
}
