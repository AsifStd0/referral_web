import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

class ColumnContainer extends StatelessWidget {
  ColumnContainer(
      {Key? key,
      required this.w,
      required this.heading1,
      required this.heading1Value,
      required this.heading2,
      required this.heading2Value,
      this.HeadingColor})
      : super(key: key);
  String heading1, heading1Value, heading2, heading2Value;
  double w;
  Color? HeadingColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w.w,
      height: 168.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PoppinText(
            text: heading1,
            colour: HeadingColor ?? themeBlue,
            fs: 13,
          ),
          PoppinText(
            text: heading1Value,
            colour: blackColors,
            fs: 14,
          ),
          SizedBox(
            height: 15.h,
          ),
          PoppinText(
            text: heading2,
            colour: HeadingColor ?? themeBlue,
            fs: 13,
          ),
          PoppinText(
            text: heading2Value,
            colour: blackColors,
            fs: 14,
          ),
        ],
      ),
    );
  }
}
