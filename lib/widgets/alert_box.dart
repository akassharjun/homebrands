import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
class ErrorDialog{
  static Future<void> getAlertBox({BuildContext context, Function onPressed, String title, String message, String flatButtonText}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        //TODO
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                flatButtonText,
                style: TextStyle(color: kMagenta),
              ),
              onPressed: onPressed,
            ),
          ],
        );
      },
    );
  }
}


