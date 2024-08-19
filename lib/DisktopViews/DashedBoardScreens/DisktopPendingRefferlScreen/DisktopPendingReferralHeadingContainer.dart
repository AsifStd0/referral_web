import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class DisktopPendingReferralHeadingContainer extends StatelessWidget {
  const DisktopPendingReferralHeadingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 1521.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ContainerBackground),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            child: PoppinText(
              text: "Referred By",
              colour: themeBlue,
              fs: 18,
              fw: FontWeight.w500,
            ),
          ),
          Container(
            width: 210.w,
            child: PoppinText(
              text: "Referral Partner",
              colour: themeBlue,
              fs: 18,
              fw: FontWeight.w500,
            ),
          ),
          Container(
            width: 220.w,
            child: PoppinText(
              text: "Phone number",
              colour: themeBlue,
              fs: 18,
              fw: FontWeight.w500,
            ),
          ),
          Container(
            width: 200.w,
            child: PoppinText(
              text: "Job title",
              colour: themeBlue,
              fs: 18,
              fw: FontWeight.w500,
            ),
          ),
          Container(
            width: 230.w,
            child: PoppinText(
              text: "Company ",
              colour: themeBlue,
              fs: 18,
              fw: FontWeight.w500,
            ),
          ),
          Container(
            width: 280.w,
            child: PoppinText(
              text: "Email",
              colour: themeBlue,
              fs: 18,
              fw: FontWeight.w500,
            ),
          ),
          Container(
            width: 100.w,
            child: PoppinText(
              text: "Action",
              colour: themeBlue,
              fs: 18,
              fw: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
