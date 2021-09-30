import 'package:liveasy/meta/hook/hook.dart';

class CountryFinder {
  CountryFinder();

  List<Country> filter(String txt, BuildContext context) {
    // if the txt is a number we check the dial code instead
    final asInt = int.tryParse(txt);
    final isNum = asInt != null;
    if (isNum) {
      // toString to remove any + in front if its an int
      return _filterByDialCode(asInt!.toString());
    } else {
      return _filterByName(txt, context);
    }
  }

  List<Country> _filterByDialCode(String dialCode) {
    final getSortPoint = getCountry(dialCode);

    return countries.where((c) => c.dialCode.contains(dialCode)).toList()
      // puts the closest match at the top
      ..sort((a, b) => getSortPoint(b) - getSortPoint(a));
  }

  List<Country> _filterByName(String txt, BuildContext context) {
    final lowerCaseTxt = txt.toLowerCase();
    // since we keep countries that contain the searched text,
    // we need to put the countries that start with that text in front.
    final getSortPoint = textCountry(
      text: lowerCaseTxt,
      context: context,
    );

    return countries
        .where((c) => _getTranslatedName(c, context).contains(lowerCaseTxt))
        .toList()
      // puts the ones that begin by txt first
      ..sort((a, b) => getSortPoint(b) - getSortPoint(a));
  }

  _getTranslatedName(Country country, BuildContext context) {
    final translatedName =
        PhoneFieldLocalization.of(context)?.translate(country.isoCode);
    String name = translatedName ?? country.name;
    return name.toLowerCase();
  }

  int Function(Country) getCountry(String dialCode) {
    return (Country c) => c.dialCode.length == dialCode.length ? 1 : 0;
  }

  int Function(Country) textCountry({
    required BuildContext context,
    required String text,
  }) {
    return (Country c) {
      final name = _getTranslatedName(c, context);
      bool isStartOfString =
          name.startsWith(text) || c.isoCode.toLowerCase().startsWith(text);
      return isStartOfString ? 1 : 0;
    };
  }
}
