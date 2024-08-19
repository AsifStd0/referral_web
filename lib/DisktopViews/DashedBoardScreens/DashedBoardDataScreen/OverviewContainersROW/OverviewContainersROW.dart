import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/OverviewContainersROW/OverViewStatesContainer.dart';

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
          pLeft: 14.w,
          pRight: 18.w,
          title: "Referrals",
          titleValue: "394",
          w: 200,
        ),
        OverViewStatesContainer(
          pLeft: 14.w,
          pRight: 18.w,
          w: 200,
          title: "Jobs Sold",
          titleValue: "251",
        ),
        OverViewStatesContainer(
          pLeft: 10.w,
          pRight: 10.w,
          w: 210,
          title: "Total Invoiced",
          titleValue: "25,738",
        ),
        OverViewStatesContainer(
          pLeft: 5.w,
          pRight: 5.w,
          w: 230,
          title: "Avg. Referral Invoice",
          titleValue: "103.53",
        ),
        SizedBox(
          width: 1.w,
        )
      ],
    );
  }
}
