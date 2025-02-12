class LanguageModel {
  final String country;
  final String languageName;
  final String languageCode;

  LanguageModel({
    required this.country,
    required this.languageName,
    required this.languageCode,
  });

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel(
        country: "ID",
        languageName: "Bahasa Indonesia",
        languageCode: 'id',
      ),
      LanguageModel(
        country: "US",
        languageName: "English",
        languageCode: 'en',
      ),
    ];
  }
}
