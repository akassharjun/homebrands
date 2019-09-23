import 'package:flutter/material.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/utils/theme_data.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: ScreenUtil.getTextSize(11),
            ),
          ),
          Text(
            'Brands',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: kMagenta,
              fontSize: ScreenUtil.getTextSize(11),
            ),
          )
        ],
      ),
    );
  }
}
