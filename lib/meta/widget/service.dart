import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class ServicesType extends GetView<GlobalCon> {
  final int index;
  final String path;
  final String title;
  final String content;
  const ServicesType({
    Key? key,
    required this.path,
    required this.title,
    required this.content,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return GestureDetector(
      onTap: () {
        controller.selectItem.value = index;
      },
      child: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.07,
        ),
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: size.width * 0.03,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.black.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(size.height * 0.015),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.black,
                  width: size.width * 0.005,
                ),
              ),
              padding: EdgeInsets.all(size.height * 0.005),
              child: Obx(
                () => CircleAvatar(
                  radius: size.height * 0.0125,
                  backgroundColor: controller.selectItem.value == index
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
            ),
            SizedBox(width: size.width * 0.04),
            SvgPicture.asset(
              path,
              fit: BoxFit.cover,
              height: size.height * 0.06,
            ),
            SizedBox(width: size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.openSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height * 0.022,
                    ),
                  ),
                  SizedBox(height: size.height * 0.007),
                  Text(
                    content,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      color: AppColors.black,
                      fontSize: size.height * 0.018,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
