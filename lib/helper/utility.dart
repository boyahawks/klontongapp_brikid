import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Utility {
  // COLOR
  static Color baseColor1 = Colors.white;
  static Color baseColor2 = Colors.black;
  static Color maincolor1 = const Color.fromARGB(255, 181, 148, 237);
  static Color maincolor2 = const Color.fromARGB(255, 102, 50, 191);

  static Color borderContainer = const Color.fromARGB(189, 224, 224, 224);
  static Color shadowColor =
      const Color.fromARGB(255, 190, 190, 190).withOpacity(0.3);

  // SIZE
  static double small = 8.0;
  static double normal = 14.0;
  static double medium = 16.0;
  static double large = 20.0;
  static double extraLarge = 24.0;

  // BORDER RADIUS
  static BorderRadius borderStyle1 = const BorderRadius.all(Radius.circular(6));
  static BorderRadius borderStyle2 = const BorderRadius.all(Radius.circular(8));
  static BorderRadius borderStyle3 =
      const BorderRadius.all(Radius.circular(10));
  static BorderRadius borderStyle4 =
      const BorderRadius.all(Radius.circular(16));
  static BorderRadius borderStyle5 =
      const BorderRadius.all(Radius.circular(24));

  // CONVERT DATE

  static DateTime onlyDate() {
    final DateTime now = DateTime.now();
    final DateTime date = DateTime(now.year, now.month, now.day);
    return date;
  }

  static String dateAndFullTimeView(DateTime date) {
    final String outputDate = DateFormat('dd MMMM yyyy HH:mm').format(date);
    return outputDate;
  }

  static String dateAndTimeView(DateTime date) {
    final String outputDate =
        DateFormat('EEEE, MMM dd, yyyy HH:mm a').format(date);
    return outputDate;
  }

  static String dateAndTimeUpload(DateTime date) {
    final String outputDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(date);
    return outputDate;
  }

  static String dateUpload(DateTime date) {
    final String outputDate = DateFormat('yyyy-MM-dd').format(date);
    return outputDate;
  }

  static String dateView(DateTime date) {
    final String outputDate = DateFormat("MMM dd, yyyy").format(date);
    return outputDate;
  }

  static String timeView(DateTime date) {
    final String outputDate = DateFormat('HH:mm').format(date);
    return outputDate;
  }

  static String currencyFormat(double qtyDouble, int? decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: decimalDigit ?? 0,
    );

    final String hasilFinal = currencyFormatter.format(qtyDouble);
    return hasilFinal;
  }

  static TimeOfDay stringToTimeOfDay(String timeString) {
    List<String> timeParts = timeString.split(":");
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }

  static String timeOfDayToString(TimeOfDay timeOfDay) {
    String hour = timeOfDay.hour.toString().padLeft(2, '0');
    String minute = timeOfDay.minute.toString().padLeft(2, '0');
    // String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

    return "$hour:$minute";
  }

  static double calculationCelcius(double resultKelvin) {
    double progres = resultKelvin - 273.15;
    return progres;
  }

  static String parseDoubleToIdLocalCurrency(double double) {
    // Note: If double has more that 4 decimal places it will be ceiled
    return NumberFormat("#,##0.####", 'id').format(double);
  }
}

class Validator {
  static String? required(
    dynamic value,
    String message, {
    String? fieldName,
  }) {
    if (value is String || value == null) {
      if (value.toString() == "null") return message;
      if (value.isEmpty) return message;
    }
    return null;
  }
}
