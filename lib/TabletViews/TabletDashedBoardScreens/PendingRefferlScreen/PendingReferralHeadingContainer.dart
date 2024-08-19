import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/Colors/Colours.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/PoppinText.dart';

class PendingReferralHeadingContainer extends StatelessWidget {
  const PendingReferralHeadingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 1511.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ContainerBackground),
      padding: EdgeInsets.only(left: 16.w),
      child: Row(
        children: [
          PoppinText(text: "Referred By", colour: themeBlue, fs: 18),
          SizedBox(
            width: 92.w,
          ),
          PoppinText(text: "Referral Partner", colour: themeBlue, fs: 18),
          SizedBox(
            width: 44.w,
          ),
          PoppinText(text: "Phone number", colour: themeBlue, fs: 18),
          SizedBox(
            width: 72.w,
          ),
          PoppinText(text: "Job title", colour: themeBlue, fs: 18),
          SizedBox(
            width: 147.w,
          ),
          PoppinText(text: "Company ", colour: themeBlue, fs: 18),
          SizedBox(
            width: 153.w,
          ),
          PoppinText(text: "Email", colour: themeBlue, fs: 18),
          SizedBox(
            width: 273.w,
          ),
          PoppinText(text: "Action", colour: themeBlue, fs: 18),
        ],
      ),
    );
  }
}
