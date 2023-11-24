import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  static var mainUrl =
      "https://crudcrud.com/api/0edc06217c6a490cb0e6491b47fe80cc/";

  static Future connectionApi(
      String typeConnect, valFormData, String url) async {
    var getUrl = mainUrl + url;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if (typeConnect == "post" || typeConnect == "patch") {
      try {
        var url = Uri.parse(getUrl);
        if (typeConnect == "post") {
          var response =
              await post(url, body: jsonEncode(valFormData), headers: headers);
          return response;
        } else if (typeConnect == "patch") {
          var response =
              await patch(url, body: jsonEncode(valFormData), headers: headers);
          return response;
        }
      } on SocketException catch (e) {
        print(e);
        return false;
      }
    } else {
      try {
        var url = Uri.parse(getUrl);
        print(url);
        var response = await get(url, headers: headers);
        return response;
      } on SocketException {
        return false;
      }
    }
  }
}
