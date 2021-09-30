import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class CountriesCon extends GetxController {
  RxList filteredCountries = <Country>[].obs;
  final _countryFinder = CountryFinder();

  BuildContext? context;

  void storeContext(BuildContext contex) {
    context = contex;
  }

  @override
  void onReady() {
    super.onReady();
    onCountrySelect();
  }

  void onSearch(String txt) {
    filteredCountries.value = _countryFinder.filter(txt, context!);
  }

  void onCountrySelect() {
    filteredCountries.assignAll(countries);
  }

  Rx<Country> selectedCountry = Country('IN').obs;
}
