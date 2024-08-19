import 'package:flutter/material.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      height: deviceHeight * 0.07,
      color: themeBlue,
    );
  }
}
