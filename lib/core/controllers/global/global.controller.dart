import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class GlobalCon extends GetxController with AuthFun, CodeAutoFill {
  RxString lang = Langs.eng.obs;

  // Phone Number controller
  TextEditingController phone = TextEditingController();

  // Validate Phone Number
  void validate() {
    if (phone.text.isNotEmpty) {
      if (NumValidate().validate(phone.text)) {
        sendCode();
      } else {
        snackbar(title: "invalid_no".tr, icon: Ionicons.close_outline);
      }
    } else {
      snackbar(title: "phone_title".tr, icon: Ionicons.phone_portrait_outline);
    }
  }

  // OTP controller
  TextEditingController otp = TextEditingController();

  // Firebase Auth Instantce
  FirebaseAuth auth = FirebaseAuth.instance;

  // User Auth Status
  UserCredential? user;

  // variable will hold timeout status
  RxBool isTimeOut = false.obs;

  // Database OTP
  String dbOtp = "";

  void sendCode() async {
    otp.clear();
    isTimeOut.value = false;
    snackbar(title: "Please wait");

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: super.getNumber(),
        verificationCompleted: (PhoneAuthCredential credential) {
          snackbar(title: "Verification Completed", icon: Ionicons.checkmark);
        },
        verificationFailed: (FirebaseAuthException e) {
          snackbar(title: e.message ?? "Verifcation Failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          dbOtp = verificationId;
          Get.toNamed(AppRoutes.verify);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          isTimeOut.value = true;
        },
      );
    } catch (e) {
      snackbar(title: e.toString());
    }
  }

  void verifyOtp() async {
    if (otp.text.isNotEmpty) {
      try {
        user = await auth.signInWithCredential(PhoneAuthProvider.credential(
            verificationId: dbOtp, smsCode: otp.text));
        snackbar(title: "Verification Completed", icon: Ionicons.checkmark);
        storeNewUser();
      } on FirebaseAuthException catch (e) {
        snackbar(title: "Invalid Otp: ${e.message}");
      }
    } else {
      snackbar(title: "Enter OTP");
    }
  }

  CollectionReference db = FirebaseFirestore.instance.collection("user");

  void storeNewUser() {
    if (user!.additionalUserInfo!.isNewUser) {
      db.doc(user!.user!.uid).get().then((value) {
        if (!value.exists) {
          db
              .doc(user!.user!.uid)
              .set(super.userRecord(user!.user!.phoneNumber!, 3))
              .then((value) {
            Get.offAllNamed(AppRoutes.profile);
          });
        }
      });
    } else {
      Get.offAllNamed(AppRoutes.profile);
      db.doc(user!.user!.uid).get().then((value) {
        if (value.exists) {
          selectItem.value = value.get("profile_status");
        }
      });
    }
  }

  RxInt selectItem = 3.obs;

  // Save User Changes

  void saveChanges() {
    if (selectItem.value != 3) {
      db
          .doc(user!.user!.uid)
          .update(super.userRecord(user!.user!.phoneNumber!, selectItem.value))
          .then((value) {
        snackbar(title: "Changes Saved", icon: Ionicons.checkmark_outline);
      });
    }
  }

  //* Retrieve Auto Sms

  @override
  void codeUpdated() {
    otp.text = code!;
    snackbar(title: "Got OTP: $code", icon: Ionicons.chatbox_ellipses_outline);
  }

  // Auto Otp Signature
  String singature = '';

  @override
  void onReady() {
    super.onReady();
    listenForCode();
    SmsAutoFill().getAppSignature.then((signa) {
      singature = signa;
      snackbar(
          title: "Got Signature: $signa",
          icon: Ionicons.chatbox_ellipses_outline);
    });
    auth.idTokenChanges().listen((User? user) {
      if (user == null) {
        snackbar(
          title: "User is currently signed out!",
          icon: Ionicons.log_out_outline,
        );
      } else {
        snackbar(title: "User is signed in!", icon: Ionicons.log_in_outline);
      }
    });
  }
}
