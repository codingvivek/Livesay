import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class NumValidate {
  final parser = PhoneParser();
  final controller = Get.find<CountriesCon>().selectedCountry.value;

  bool validate(String number) {
    try {
      return parser
          .validate(parser.parseWithIsoCode(controller.isoCode, number));
    } on PhoneNumberException {
      return false;
    }
  }
}
