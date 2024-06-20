import 'package:flutter/material.dart';
import 'package:mobile_banking/common/localization/language/language.dart';
import 'package:mobile_banking/common/localization/language/language_en.dart';
import 'package:mobile_banking/common/localization/language/language_id.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'id',
        'en',
        'ja',
      ].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'id':
        return LanguageID();
      case 'en':
        return LanguageEN();

      default:
        return LanguageID();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
