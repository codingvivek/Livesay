import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class PhoneFormField extends FormField<PhoneNumber> {
  PhoneFormField({Key? key})
      : super(
            key: key,
            builder: (field) {
              final state = field as _PhoneFormFieldState;
              return state._textField();
            });

  @override
  _PhoneFormFieldState createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends FormFieldState<PhoneNumber> {
  final parser = PhoneParser();

  void openCountrySelection() async {
    Get.toNamed(AppRoutes.countryPicker);
  }

  Widget _textField() {
    Size size = Get.size;
    return TextField(
      controller: Get.find<GlobalCon>().phone,
      style: GoogleFonts.openSans(
        fontWeight: FontWeight.w600,
        fontSize: size.height * 0.019,
        color: AppColors.black.withOpacity(0.75),
      ),
      autofillHints: widget.enabled && true
          ? [AutofillHints.telephoneNumberNational]
          : null,
      enabled: widget.enabled,
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: size.height * 0.023,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "phone_hint".tr,
        labelText: "phone_label".tr,
        fillColor: Colors.black,
        hintStyle: GoogleFonts.openSans(
          fontSize: size.height * 0.0175,
          fontWeight: FontWeight.normal,
          color: AppColors.black.withOpacity(0.75),
        ),
        prefixIcon: SelectedCountryWidget(
          onTap: () => openCountrySelection(),
        ),
        labelStyle: GoogleFonts.openSans(
          fontSize: size.height * 0.0185,
          fontWeight: FontWeight.normal,
          color: AppColors.black.withOpacity(0.75),
        ),
        suffixIcon: const SizedBox.shrink(),
        border: _outlineInputBorder(size),
        enabledBorder: _outlineInputBorder(size),
        focusedBorder: _outlineInputBorder(size),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(Size size) {
    return OutlineInputBorder(
      gapPadding: size.width * 0.015,
      borderSide: BorderSide(color: AppColors.black.withOpacity(0.75)),
      borderRadius: BorderRadius.circular(size.height * 0.015),
    );
  }
}
