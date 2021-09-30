import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class SearchBox extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBox({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.04,
      ),
      child: TextField(
        autofocus: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white54
                : Colors.black38,
          ),
          filled: true,
          isDense: true,
          hintText: "country_hint".tr,
          hintStyle: GoogleFonts.firaSans(
            fontSize: size.height * 0.0185,
            color: AppColors.black.withOpacity(0.65),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
