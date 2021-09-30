import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class CountryList extends GetView<CountriesCon> {
  const CountryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Obx(
      () => ListView.builder(
        itemCount: controller.filteredCountries.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          Country country = controller.filteredCountries.elementAt(index);
          return ListTile(
            key: Key(country.isoCode),
            leading: CircleFlag(country.isoCode),
            title: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                PhoneFieldLocalization.of(context)
                        ?.translate(country.isoCode) ??
                    country.name,
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  fontSize: size.height * 0.0205,
                ),
              ),
            ),
            subtitle: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                country.displayDialCode,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  fontSize: size.height * 0.017,
                ),
              ),
            ),
            onTap: () {
              controller.selectedCountry.value = country;
              controller.onCountrySelect();
              Get.back();
            },
          );
        },
      ),
    );
  }
}
