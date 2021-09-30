import 'package:liveasy/meta/hook/hook.dart';

class PhoneFieldLocalizationDelegate
    extends LocalizationsDelegate<PhoneFieldLocalization> {
  const PhoneFieldLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    final found = [
      'en',
    ].contains(locale.languageCode);
    return found;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;

  @override
  Future<PhoneFieldLocalization> load(Locale locale) async {
    final localizations = PhoneFieldLocalization(locale);
    await localizations.load();
    return localizations;
  }
}
