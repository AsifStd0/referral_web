import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

class kButton extends StatelessWidget {
  kButton(
      {Key? key,
      required this.deviceWidth,
      required this.deviceHeight,
      this.onpressed,
      required this.text})
      : super(key: key);

  final double deviceWidth;
  final double deviceHeight;
  final text;
  VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 55.h,
        width: 426.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: themeBlue,
        ),
        child: Center(
          child: PoppinText(
            text: text,
            colour: whiteColors,
            fs: deviceWidth * 0.015,
          ),
        ),
      ),
    );
  }
}
