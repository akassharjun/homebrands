import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final Function onTap;

  ClickableText({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    
    ScreenUtil()..init(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: ScreenUtil.getTextSize(10),
          fontWeight: FontWeight.w400,
          color: kAsh
        ),
      ),
    );
  }
}