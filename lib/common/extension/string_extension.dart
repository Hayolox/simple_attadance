import 'package:flutter/material.dart';

extension StringExtension on String {
  String toTranslate(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    List<String> translations = split('|');
    return translations.length > 1
        ? translations[locale.languageCode == 'en' ? 1 : 0]
        : this;
  }

  String splitText(String language) {
    String result = '';
    final parts = split('|');
    if (parts.length == 2) {
      if (language == 'english') {
        result = parts[1].trim();
      } else {
        result = parts[0].trim();
      }
    }
    return result;
  }

  String generateAlias() {
    if (isEmpty) {
      return '';
    }

    List<String> words = split(' ');

    return words
        .where((word) => word.isNotEmpty)
        .take(2)
        .map((word) => word[0].toUpperCase())
        .join();
  }
}
