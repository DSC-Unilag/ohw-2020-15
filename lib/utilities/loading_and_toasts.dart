import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'style.dart' as Style;

class Indicator {
  static showLoading(BuildContext context, [String message]) {
    showDialog(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Dialog(
            backgroundColor: Style.themeWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: message == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/loader.gif',
                    height: 56,
                    width: 56,
                  ),
                ),
                Text(
                  '${message ?? ''}',
                  style: Style.body2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static closeLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showToast(BuildContext context, String message, [Color color]) {
    Fluttertoast.showToast(
      backgroundColor: color == null ? Style.themeBlueLight : color,
      fontSize: 14,
      textColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      msg: message,
    );
  }
}
