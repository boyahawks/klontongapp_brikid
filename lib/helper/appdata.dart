import 'dart:convert';

import 'package:test_brikId/helper/local_storage.dart';

class AppData {
  static set uuid(String value) => LocalStorage.saveToDisk('uuid', value);

  static String get uuid {
    if (LocalStorage.getFromDisk('uuid') != null) {
      return LocalStorage.getFromDisk('uuid');
    }
    return "";
  }

  static set email(String value) => LocalStorage.saveToDisk('email', value);

  static String get email {
    if (LocalStorage.getFromDisk('email') != null) {
      return LocalStorage.getFromDisk('email');
    }
    return "";
  }

  // static set dataWeather(List<MainWeather>? value) {
  //   if (value != null) {
  //     List<String> listString = value.map((e) => e.toJson()).toList();
  //     LocalStorage.saveToDisk('dataWeather', listString);
  //   } else {
  //     LocalStorage.saveToDisk('dataWeather', null);
  //   }
  // }

  // static List<MainWeather>? get dataWeather {
  //   if (LocalStorage.getFromDisk('dataWeather') != null) {
  //     List<String> listData = LocalStorage.getFromDisk('dataWeather');
  //     return listData.map((e) => MainWeather.fromMap(jsonDecode(e))).toList();
  //   }
  //   return null;
  // }

  // CLEAR ALL DATA

  static void clearAllData() =>
      LocalStorage.removeFromDisk(null, clearAll: true);
}
