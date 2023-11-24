part of "widget.dart";

class TextFieldMain extends StatelessWidget {
  final dynamic colorCard;
  final dynamic colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final bool? keyboardMultiline;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? readOnly;
  final bool isCurrencyWithDecimal;
  final bool isNumberOnly;
  final String? hintText;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmit;

  const TextFieldMain({
    super.key,
    this.colorCard,
    this.heightCard,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.hintText,
    this.isCurrencyWithDecimal = false,
    this.isNumberOnly = false,
    this.keyboardMultiline,
    this.borderRadius,
    this.fontSize,
    this.validator,
    this.heightTextField,
    this.colorTextField,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.onChange,
    this.onFieldSubmit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorTextField ?? Utility.baseColor1,
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      readOnly: readOnly ?? false,
      inputFormatters: isCurrencyWithDecimal
          ? [
              CurrencyInputFormatterWithDecimal(),
            ]
          : isNumberOnly
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Utility.baseColor1, // Set your desired border color here
          ),
        ),
        enabledBorder: border(
          color: colorTextField ?? Utility.baseColor1,
        ),
        focusedBorder: border(
          indent: 2.0,
          color: Utility.maincolor1,
        ),
        errorBorder: border(
          indent: 2.0,
          color: Colors.red,
        ),
        focusedErrorBorder: border(
          indent: 2.0,
          color: Colors.red,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                color: Colors.black,
              )
            : null,
      ),
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onFieldSubmit,
      style: TextStyle(
          fontSize: fontSize ?? 16.0,
          height: heightTextField ?? 1.0,
          color: colorTextField ?? Utility.baseColor1),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final dynamic colorCard;
  final dynamic colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final BorderRadius? borderRadius;
  final bool? obscureController;
  final String? Function(String?)? validator;
  final bool? statusCardCustom;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function? onTap;
  const TextFieldPassword({
    super.key,
    this.colorCard,
    this.heightCard,
    this.borderRadius,
    this.fontSize,
    this.heightTextField,
    this.colorTextField,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    required this.statusCardCustom,
    required this.obscureController,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Utility.baseColor2,
      obscureText: !obscureController!,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: TextInputType.text,
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
      // ],
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: border(
            color: colorTextField ?? Utility.baseColor1,
          ),
          focusedBorder: border(
            indent: 2.0,
            color: Colors.black,
          ),
          errorBorder: border(
            indent: 2.0,
            color: Colors.red,
          ),
          focusedErrorBorder: border(
            indent: 2.0,
            color: Colors.red,
          ),
          // prefixIcon: const Icon(Iconsax.lock),
          suffixIcon: InkWell(
            onTap: () {
              if (onTap != null) onTap!();
            },
            child: Icon(
              obscureController! ? Iconsax.eye : Iconsax.eye_slash,
              size: 20,
              color: obscureController!
                  ? Utility.baseColor2
                  : const Color.fromARGB(255, 180, 180, 180),
            ),
          )),
      style: TextStyle(
          fontSize: fontSize ?? 14.0,
          height: heightTextField ?? 1.0,
          color: colorTextField ?? Colors.black),
    );
  }
}
