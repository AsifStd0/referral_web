import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/PendingRefferlScreen/PendingReferralHeadingContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/PendingRefferlScreen/PendingReferralListViewContainer.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/Colors/Colours.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/PoppinText.dart';

class PendingReferralPartnersScreen extends StatelessWidget {
  const PendingReferralPartnersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, top: 34.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinText(
            text: "Pending Referral Partners",
            colour: themeBlue,
            fs: 20,
            fw: FontWeight.bold,
          ),
          SizedBox(
            height: 15.h,
          ),
          PendingReferralHeadingContainer(),
          SizedBox(
            height: 19.h,
          ),
          Container(
            height: 830.h,
            width: 1020.w,
            // padding: EdgeInsets.only(left: 34.w),
            child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return PendingReferralListViewContainer();
                }),
          ),
        ],
      ),
    );
  }
}
