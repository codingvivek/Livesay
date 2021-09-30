import 'package:liveasy/meta/hook/hook.dart';

class PhoneFieldLocalization {
  static PhoneFieldLocalizationDelegate delegate =
      const PhoneFieldLocalizationDelegate();
  Locale locale;
  Map<String, String> translations = {};
  PhoneFieldLocalization(this.locale);

  static PhoneFieldLocalization? of(BuildContext context) {
    return Localizations.of<PhoneFieldLocalization>(
      context,
      PhoneFieldLocalization,
    );
  }

  Future load() async {
    String jsonString = await rootBundle
        .loadString('asset/translations/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    translations = jsonMap.map((k, v) => MapEntry(k, v.toString()));
  }

  String translate(String key) {
    return translations[key] ?? key;
  }
}
