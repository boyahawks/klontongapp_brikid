import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_brikId/helper/utility.dart';

class UtilsAlert {
  static showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 12);
  }

  static loadingSimpanData(
      {bool? dismiss, required BuildContext context, required String text}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => dismiss ?? false,
          child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 20,
                          child: Padding(
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Utility.maincolor1,
                              ),
                              padding: EdgeInsets.all(8)),
                        ),
                        Expanded(
                          flex: 80,
                          child: Padding(
                              child: Text(
                                text,
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              padding: const EdgeInsets.all(8)),
                        )
                      ],
                    )
                  ])),
        );
      },
    );
  }
}
