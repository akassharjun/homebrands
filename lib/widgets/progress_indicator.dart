import 'package:flutter/material.dart';
import 'package:homebrands/utils/screen_util.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: ScreenUtil.getHeight(25),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
