import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class LanguageView extends GetView<GlobalCon> {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.image_outline,
                  size: size.height * 0.15,
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  "lang_title".tr,
                  style: GoogleFonts.openSans(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.026,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  "lang_subtitle".tr,
                  style: GoogleFonts.openSans(
                    fontSize: size.height * 0.018,
                    color: AppColors.black.withOpacity(0.75),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width * 0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.black,
                    ),
                    borderRadius: BorderRadius.circular(size.height * 0.0125),
                  ),
                  child: Obx(
                    () => DropdownButton<String>(
                      elevation: 2,
                      hint: Text(
                        controller.lang.value,
                        style: GoogleFonts.openSans(
                          color: AppColors.black,
                          fontSize: size.height * 0.0225,
                        ),
                      ),
                      focusColor: AppColors.black,
                      items: <String>[Langs.eng, Langs.hin].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.openSans(
                              color: AppColors.black,
                              fontSize: size.height * 0.0225,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {
                        controller.lang.value = _!;
                        if (_ == Langs.eng) {
                          Get.updateLocale(Langs.english);
                        } else if (_ == Langs.hin) {
                          Get.updateLocale(Langs.hindi);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                CustomBtn(
                  width: size.width * 0.7,
                  title: "lang_btn".tr,
                  onTap: () {
                    if (controller.user != null) {
                      Get.offAllNamed(AppRoutes.profile);
                    } else {
                      Get.toNamed(AppRoutes.phone);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
