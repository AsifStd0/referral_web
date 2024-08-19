import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class DisktopColumnContainer extends StatelessWidget {
  DisktopColumnContainer(
      {Key? key,
      required this.w,
      required this.heading1,
      required this.heading1Value,
      required this.heading2,
      required this.heading2Value,
      this.backgroundColor,
      this.HeadingColor})
      : super(key: key);
  String heading1, heading1Value, heading2, heading2Value;
  double w;
  Color? HeadingColor, backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w.w,
      // height: 168.h,
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PoppinText(
            text: heading1,
            colour: HeadingColor ?? themeBlue,
            fs: 16,
          ),
          PoppinText(
            text: heading1Value,
            colour: blackColors,
            fs: 17,
          ),
          SizedBox(
            height: 15.h,
          ),
          PoppinText(
            text: heading2,
            colour: HeadingColor ?? themeBlue,
            fs: 17,
          ),
          PoppinText(
            text: heading2Value,
            colour: blackColors,
            fs: 18,
          ),
        ],
      ),
    );
  }
}
