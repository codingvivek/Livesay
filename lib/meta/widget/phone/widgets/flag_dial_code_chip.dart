import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class FlagDialCodeChip extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool showDialCode;
  final TextStyle textStyle;
  final double flagSize;

  const FlagDialCodeChip({
    Key? key,
    required this.country,
    this.textStyle = const TextStyle(),
    this.showFlag = true,
    this.showDialCode = true,
    this.flagSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showFlag) ...[
          CircleFlag(
            country.isoCode,
            size: flagSize,
          ),
          SizedBox(
            width: size.width * 0.0175,
          ),
        ],
        if (showDialCode)
          Text(
            country.displayDialCode,
            style: textStyle,
          ),
      ],
    );
  }
}
