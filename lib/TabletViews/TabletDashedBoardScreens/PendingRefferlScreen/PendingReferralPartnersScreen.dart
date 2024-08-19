import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/PendingRefferlScreen/PendingReferralHeadingContainer.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/PendingRefferlScreen/PendingReferralListViewContainer.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/Colors/Colours.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/PoppinText.dart';

class PendingReferralPartnersScreen extends StatelessWidget {
  const PendingReferralPartnersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34.w, top: 34.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinText(
              text: "Pending Referral Partners", colour: themeBlue, fs: 26),
          SizedBox(
            height: 15.h,
          ),
          PendingReferralHeadingContainer(),
          SizedBox(
            height: 19.h,
          ),
          Container(
            height: 830.h,
            width: 1550.w,
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
