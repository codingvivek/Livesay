import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

mixin AuthFun {
  String getNumber() {
    String second = Get.find<GlobalCon>().phone.text;
    String first =
        Get.find<CountriesCon>().selectedCountry.value.displayDialCode;
    String number = first + second;
    return number.replaceAll(' ', '');
  }

  Map<String, dynamic> userRecord(String no, int id) {
    return {"number": no, "profile_status": id};
  }
}
