part of "./widget.dart";

class CustomTextFieldPicker extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? hintText;
  final String? suffixText;
  final Color? focusColor;
  final bool? readOnly;
  final TextInputAction? styleTextInputAction;
  final TextInputType? keyboardType;
  final bool isCurrency;

  const CustomTextFieldPicker({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.validator,
    this.prefixIcon,
    this.suffixIcon,
    required this.isCurrency,
    this.keyboardType,
    this.hintText,
    this.suffixText,
    this.focusColor,
    this.readOnly,
    this.styleTextInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      controller: controller,
      validator: validator,
      textInputAction: styleTextInputAction ?? TextInputAction.next,
      keyboardType: keyboardType,
      inputFormatters: isCurrency
          ? [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatterWithDecimal(),
            ]
          : null,
      decoration: InputDecoration(
        hintText: hintText,
        suffixText: suffixText,
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: border(
          color: Colors.grey,
        ),
        focusedBorder: border(
          indent: 2.0,
          color: focusColor ?? Utility.maincolor1,
        ),
        errorBorder: border(
          color: Colors.red,
        ),
        focusedErrorBorder: border(
          indent: 2.0,
          color: focusColor ?? Utility.maincolor1,
        ),
      ),
    );
  }
}
