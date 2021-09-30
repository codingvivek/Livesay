import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class SelectedCountryWidget extends GetView<CountriesCon> {
  final VoidCallback onTap;

  const SelectedCountryWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.025,
        ),
        child: Obx(
          () => FlagDialCodeChip(
            country: Country(controller.selectedCountry.value.isoCode),
            showFlag: true,
            showDialCode: true,
            textStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: size.height * 0.019,
              color: AppColors.black.withOpacity(0.6),
            ),
            flagSize: size.height * 0.032,
          ),
        ),
      ),
    );
  }
}
