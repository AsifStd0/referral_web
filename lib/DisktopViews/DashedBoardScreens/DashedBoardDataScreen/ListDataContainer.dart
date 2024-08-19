import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/ColumnContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/ReferralPartner/LeadsDoneListContainer.dart';

class ListDataContainer extends StatelessWidget {
  const ListDataContainer({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            // width: deviceWidth * 0.6,
            height: 168.h,
            margin: EdgeInsets.only(top: 18.h, right: 25.w),
            padding: EdgeInsets.only(left: 24.w, top: 19.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Color.fromARGB(255, 241, 241, 244)),
            child: Row(
              children: [
                ColumnContainer(
                  w: 155,
                  heading1: 'Referrer Name',
                  heading1Value: 'John Doe',
                  heading2: 'W9 Form',
                  heading2Value: 'Submitted',
                ),
                ColumnContainer(
                  w: 219,
                  heading1: "Phone",
                  heading1Value: "+1-344-9876123",
                  heading2: "Email",
                  heading2Value: "johndoe@email.com",
                ),
                ColumnContainer(
                  w: 327,
                  heading1: "Address",
                  heading1Value: "H#12, ST 10 New York USA",
                  heading2: "Company",
                  heading2Value: "Umbrella Carporation (PVT). Ltd",
                ),
                ColumnContainer(
                  w: 200,
                  heading1: "Avg. Job Value",
                  heading1Value: "123",
                  heading2: "Referrals",
                  heading2Value: "10",
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(top: 18.h, right: 20.w, left: 0.w),
          child: LeadsDoneListContainer(
            list: paidList,
            list2: leadsList,
          ),
        )
      ],
    );
  }
}
