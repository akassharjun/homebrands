import 'package:flutter/material.dart';

import 'package:homebrands/utils/screen_util.dart';


class Button extends StatelessWidget {

  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;

  const Button({@required this.backgroundColor, this.buttonText, @required this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: ScreenUtil.getHeight(5),
      minWidth: double.maxFinite,
      elevation: 0,
      color: backgroundColor,
      child: Text(
        buttonText,
        style: TextStyle(
            color: textColor,
            fontSize: ScreenUtil.getTextSize(11)
        ),
      ),
    );
  }
}