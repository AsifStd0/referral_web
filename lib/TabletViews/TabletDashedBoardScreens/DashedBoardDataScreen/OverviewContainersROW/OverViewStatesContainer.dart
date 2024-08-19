import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/Colors/Colours.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/PoppinText.dart';

class OverViewStatesContainer extends StatelessWidget {
  OverViewStatesContainer(
      {Key? key,
      required this.title,
      required this.titleValue,
      this.w,
      required this.pLeft,
      required this.pRight})
      : super(key: key);
  String title, titleValue;
  double? w;
  double pLeft, pRight;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 96.h,
        width: w ?? 348.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: ContainerBackground,
        ),
        padding: EdgeInsets.only(left: pLeft, right: pRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinText(
              text: title,
              colour: themeBlue,
              fs: 20,
              fw: FontWeight.w500,
            ),
            PoppinText(
              text: titleValue,
              colour: blackColors,
              fs: 30,
              fw: FontWeight.w300,
            ),
          ],
        ));
  }
}
