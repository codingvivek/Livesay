import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class ProfileView extends GetView<GlobalCon> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.language);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "profile_title".tr,
                  style: GoogleFonts.openSans(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: size.height * 0.029,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                ServicesType(
                  index: 0,
                  title: "profile_item_1_title".tr,
                  path: AppAsset.warehouse,
                  content: "profile_item_1_content".tr,
                ),
                SizedBox(height: size.height * 0.025),
                ServicesType(
                  index: 1,
                  title: "profile_item_2_title".tr,
                  path: AppAsset.transport,
                  content: "profile_item_2_content".tr,
                ),
                SizedBox(height: size.height * 0.04),
                CustomBtn(
                  width: size.width * 0.8,
                  title: "profile_btn".tr,
                  onTap: controller.saveChanges,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
