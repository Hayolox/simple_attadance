import 'package:flutter/material.dart';
import 'package:mobile_banking/app.dart';
import 'package:mobile_banking/data/model/global/global_model.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefSelectedLanguageCode = "language";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(prefSelectedLanguageCode) ?? "id";
  sl<Global>().locale = languageCode;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale('id', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  await setLocale(selectedLanguageCode).then(
    (locale) => App.setLocale(context, locale),
  );
}
