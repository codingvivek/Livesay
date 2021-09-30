import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class PhoneView extends GetView<GlobalCon> {
  const PhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.0125,
            ),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      color: AppColors.black,
                      onPressed: () => Get.back(),
                      iconSize: size.height * 0.0425,
                      icon: const Icon(Ionicons.close_outline),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "phone_title".tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.027,
                  ),
                ),
                SizedBox(height: size.height * 0.0125),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.08,
                  ),
                  child: Text(
                    "phone_subtitle".tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: size.height * 0.019,
                      color: AppColors.black.withOpacity(0.75),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: PhoneFormField(),
                ),
                SizedBox(height: size.height * 0.04),
                CustomBtn(
                  width: size.width * 0.86,
                  title: "phone_btn".tr,
                  onTap: () => controller.validate(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
