import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class CountrySelector extends GetView<CountriesCon> {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.storeContext(context);
    Size size = Get.size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              SearchBox(
                onChanged: controller.onSearch,
              ),
              const Expanded(
                child: CountryList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
