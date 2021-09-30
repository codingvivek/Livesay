import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class VerifyView extends GetView<GlobalCon> {
  const VerifyView({Key? key}) : super(key: key);

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
                      iconSize: size.height * 0.04,
                      icon: const Icon(Ionicons.arrow_back_outline),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "verify_title".tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.032,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "verify_middle".tr,
                    style: GoogleFonts.openSans(
                      fontSize: size.height * 0.02,
                      color: AppColors.black.withOpacity(0.75),
                    ),
                    children: [
                      TextSpan(
                        text: " " + controller.phone.text,
                        style: GoogleFonts.openSans(
                          fontSize: size.height * 0.02,
                          color: AppColors.black.withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    appContext: context,
                    autoDisposeControllers: false,
                    controller: controller.otp,
                    backgroundColor: AppColors.white,
                    keyboardType: TextInputType.phone,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeFillColor: Colors.white,
                      fieldWidth: size.width * 0.105,
                      inactiveFillColor: AppColors.main,
                      fieldHeight: size.height * 0.0725,
                      inactiveColor: AppColors.main,
                      borderRadius: BorderRadius.circular(size.height * 0.005),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) => true,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Obx(
                  () => controller.isTimeOut.value
                      ? RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "verify_subtitle".tr,
                            style: GoogleFonts.openSans(
                              fontSize: size.height * 0.018,
                              color: AppColors.black.withOpacity(0.7),
                            ),
                            children: [
                              TextSpan(
                                text: " " + "verify_again".tr,
                                style: GoogleFonts.openSans(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.019,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.back(),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                SizedBox(height: size.height * 0.05),
                CustomBtn(
                  width: size.width * 0.82,
                  title: "verify_btn".tr,
                  onTap: controller.verifyOtp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
