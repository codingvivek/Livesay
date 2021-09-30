import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.width,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return MaterialButton(
      onPressed: onTap,
      minWidth: width,
      color: AppColors.main,
      child: Text(
        title,
        style: GoogleFonts.openSans(
          color: AppColors.white,
          fontSize: size.height * 0.027,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.015,
      ),
      elevation: 2.0,
      focusElevation: 2.0,
      hoverElevation: 2.0,
      disabledElevation: 2.0,
      highlightElevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.height * 0.01),
      ),
    );
  }
}
