import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/MobileViews/DashedBoardScreens/DashedBoardDataScreen/ColumnContainer.dart';

class ListDataContainer extends StatelessWidget {
  const ListDataContainer({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: deviceWidth * 0.8,
        height: 168.h,
        margin: EdgeInsets.only(top: 18.h),
        padding: EdgeInsets.only(left: 24.w, top: 19.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Color.fromARGB(255, 235, 235, 238)),
        child: Row(
          children: [
            ColumnContainer(
              w: 256,
              heading1: 'Referrer Name',
              heading1Value: 'John Doe',
              heading2: 'W9 Form',
              heading2Value: 'Submitted',
            ),
            ColumnContainer(
              w: 319,
              heading1: "Phone",
              heading1Value: "+1-344-9876123",
              heading2: "Email",
              heading2Value: "johndoe@email.com",
            ),
            ColumnContainer(
              w: 467,
              heading1: "Address",
              heading1Value: "H#12, ST 10 New York USA",
              heading2: "Company",
              heading2Value: "Umbrella Carporation (PVT). Ltd",
            ),
            ColumnContainer(
              w: 280,
              heading1: "Avg. Job Value",
              heading1Value: "123",
              heading2: "Referrals",
              heading2Value: "10",
            ),
          ],
        ));
  }
}
