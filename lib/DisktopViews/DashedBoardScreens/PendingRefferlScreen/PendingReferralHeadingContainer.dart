import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

class PendingReferralHeadingContainer extends StatelessWidget {
  const PendingReferralHeadingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: 1000.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ContainerBackground),
      padding: EdgeInsets.only(left: 10.w),
      child: Row(
        children: [
          PoppinText(
            text: "Referred By",
            colour: themeBlue,
            fs: 13,
            fw: FontWeight.bold,
          ),
          SizedBox(
            width: 52.w,
          ),
          PoppinText(
              text: "Referral Partner",
              colour: themeBlue,
              fs: 13,
              fw: FontWeight.bold),
          SizedBox(
            width: 24.w,
          ),
          PoppinText(
              text: "Phone number",
              colour: themeBlue,
              fs: 13,
              fw: FontWeight.bold),
          SizedBox(
            width: 32.w,
          ),
          PoppinText(
              text: "Job title",
              colour: themeBlue,
              fs: 13,
              fw: FontWeight.bold),
          SizedBox(
            width: 77.w,
          ),
          PoppinText(
              text: "Company ", colour: themeBlue, fs: 13, fw: FontWeight.bold),
          SizedBox(
            width: 23.w,
          ),
          PoppinText(
              text: "Email", colour: themeBlue, fs: 13, fw: FontWeight.bold),
          SizedBox(
            width: 153.w,
          ),
          PoppinText(
              text: "Action", colour: themeBlue, fs: 13, fw: FontWeight.bold),
        ],
      ),
    );
  }
}
