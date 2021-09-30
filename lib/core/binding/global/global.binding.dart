import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalCon(), permanent: true);
    Get.put(CountriesCon(), permanent: true);
  }
}
