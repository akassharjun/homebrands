import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';

class ReusableTextField extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final Widget icon;
  final Color color;
  final Function onChanged;
  final TextEditingController controller;

  ReusableTextField({@required this.obscureText, @required this.hintText, this.icon, @required this.color, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    
    ScreenUtil()..init(context);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: color,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: color,
            fontWeight: FontWeight.w300,
            fontSize: ScreenUtil.getTextSize(9),
            letterSpacing: 2
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: kWhite
            )
        ),
        icon: icon,
      ),
    );
  }
}