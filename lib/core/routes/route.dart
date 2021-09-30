import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class AppRoutes {
  static const String language = "/language";
  static const String phone = "/phone";
  static const String verify = "/verify";
  static const String profile = "/profile";
  static const String countryPicker = "/countrypicker";

  List<GetPage<dynamic>>? routes = [
    GetPage(
      name: language,
      page: () => const LanguageView(),
    ),
    GetPage(
      name: phone,
      page: () => const PhoneView(),
    ),
    GetPage(
      name: verify,
      page: () => const VerifyView(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: countryPicker,
      page: () => const CountrySelector(),
    ),
  ];
}
