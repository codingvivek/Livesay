import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

void snackbar(
    {required String title, IconData icon = Ionicons.information_outline}) {
  Size size = Get.size;
  Get.rawSnackbar(
    overlayBlur: 1.2,
    borderRadius: size.height * 0.02,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 2),
    padding: EdgeInsets.all(size.height * 0.02),
    backgroundColor: AppColors.main.withOpacity(0.7),
    icon: Icon(icon, size: size.height * 0.035, color: AppColors.white),
    messageText: Text(
      title,
      textAlign: TextAlign.left,
      style: GoogleFonts.openSans(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: size.height * 0.021,
      ),
    ),
    margin: EdgeInsets.symmetric(
      vertical: size.height * 0.02,
      horizontal: size.width * 0.03,
    ),
  );
}
