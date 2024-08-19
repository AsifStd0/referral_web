import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

class HeadingsContainer extends StatelessWidget {
  const HeadingsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1521.w,
      height: 54.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ContainerBackground),
      padding: EdgeInsets.only(left: 13.w),
      margin: EdgeInsets.only(left: 33.w, right: 33.w),
      child: Row(
        children: [
          PoppinText(text: "Name", colour: themeBlue, fs: 15),
          SizedBox(
            width: 93.w,
          ),
          PoppinText(text: "Referrals", colour: themeBlue, fs: 15),
          SizedBox(
            width: 50.w,
          ),
          PoppinText(text: "Jobs Sold", colour: themeBlue, fs: 15),
          SizedBox(
            width: 83.w,
          ),
          PoppinText(text: "Total Invoiced (\$)", colour: themeBlue, fs: 15),
          SizedBox(
            width: 68.w,
          ),
          PoppinText(
              text: "Avg. Referral Invoice (\$)", colour: themeBlue, fs: 15),
          SizedBox(
            width: 50.w,
          ),
          PoppinText(text: "Action", colour: themeBlue, fs: 15),
        ],
      ),
    );
  }
}
