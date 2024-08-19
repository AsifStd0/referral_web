import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/OverviewContainersROW/OverViewStatesContainer.dart';

class OverviewContainersROW extends StatelessWidget {
  const OverviewContainersROW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OverViewStatesContainer(
          pLeft: 24.w,
          pRight: 38.w,
          title: "Referrals",
          titleValue: "394",
        ),
        OverViewStatesContainer(
          pLeft: 24.w,
          pRight: 48.w,
          title: "Jobs Sold",
          titleValue: "251",
        ),
        OverViewStatesContainer(
          pLeft: 24.w,
          pRight: 32.w,
          title: "Total Invoiced",
          titleValue: "25,738",
        ),
        OverViewStatesContainer(
          pLeft: 24.w,
          pRight: 16.w,
          title: "Avg. Referral Invoice",
          titleValue: "103.53",
        ),
      ],
    );
  }
}
