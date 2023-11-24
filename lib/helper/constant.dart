import 'package:flutter/material.dart';
import 'package:test_brikId/helper/utility.dart';

Future<DateTime?> pickerDate(BuildContext context) async {
  DateTime? pickerDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015),
    lastDate: DateTime(2030),
  );
  if (pickerDate != null) {
    return pickerDate;
  }
  return pickerDate;
}

OutlineInputBorder border({final double? indent, final color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      width: indent ?? 1,
      color: color ?? Utility.maincolor1,
    ),
  );
}

hideKeyboard(final BuildContext context) {
  return FocusScope.of(context).unfocus();
}

// Future<String?> getPhotoFromCamera() async {
//   ImagePicker imagePicker = ImagePicker();

//   XFile? image = await imagePicker.pickImage(source: ImageSource.camera);

//   if (image != null) {
//     return image.path;
//   }
//   return null;
// }

class AssetsConstant {
  /// Icon
  // static AssetImage icSalah = const AssetImage('assets/images/ic_salah.png');
  /// Svg
  // static SvgPicture icOnboarding1 = SvgPicture.asset('assets/images/ic_onboarding_1.svg');
  /// Json
  static String jsonLottieNoData = 'assets/nodata_animation.json';
}
