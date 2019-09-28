import 'package:flutter/material.dart';
import 'package:homebrands/utils/screen_util.dart';

class Heading{
  static Align buildTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: ScreenUtil.getPaddingAll(8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil.getTextSize(12),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

