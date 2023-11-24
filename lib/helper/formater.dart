import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:test_brikId/helper/utility.dart';

class CurrencyInputFormatterWithDecimal extends TextInputFormatter {
  final int decimalDigits;

  CurrencyInputFormatterWithDecimal({this.decimalDigits = 4})
      : assert(decimalDigits >= 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String newText = newValue.text;

    if (decimalDigits == 0) {
      newText = newText.replaceAll(RegExp('[^0-9]'), '');
    } else {
      if (newText.endsWith('.')) {
        // In case user put multiple ','s
        if (newText.contains(',')) {
          return oldValue;
        }

        //in case if user's first input is "."
        if (newText.trim() == '.') {
          return newValue.copyWith(
            text: '0,',
            selection: const TextSelection.collapsed(offset: 2),
          );
        }
        // Once user pressed the '.' button, change '.' text to ',' immediately
        else {
          newText =
              newText.replaceRange(newText.length - 1, newText.length, ',');
          return newValue.copyWith(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      }
      newText = newText.replaceAll(RegExp('[^0-9,]'), '').replaceAll(',', '.');
    }

    if (newText.contains('.')) {
      //in case if user tries to input more than the decimal place
      if ((newText.split(".")[1].length > decimalDigits)) {
        return oldValue;
      } else {
        return newValue;
      }
    }

    //in case if input is empty
    if (newText.trim() == '') {
      return newValue.copyWith(text: '');
    }

    double newDouble = double.parse(newText);
    var selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;

    String newString = Utility.parseDoubleToIdLocalCurrency(newDouble);

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(
        offset: newString.length - selectionIndexFromTheRight,
      ),
    );
  }
}
