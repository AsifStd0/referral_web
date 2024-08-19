import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

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
        height: 55.h,
        width: w ?? 240.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ContainerBackground,
        ),
        padding: EdgeInsets.only(left: pLeft, right: pRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinText(
              text: title,
              colour: themeBlue,
              fs: 15,
              fw: FontWeight.w500,
            ),
            PoppinText(
              text: titleValue,
              colour: blackColors,
              fs: 15,
              fw: FontWeight.bold,
            ),
          ],
        ));
  }
}
