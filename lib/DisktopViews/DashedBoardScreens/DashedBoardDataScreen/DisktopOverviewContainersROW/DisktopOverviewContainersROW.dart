import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopOverviewContainersROW/DisktopOverViewStatesContainer.dart';

class DisktopOverviewContainersROW extends StatelessWidget {
  const DisktopOverviewContainersROW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DisktopOverViewStatesContainer(
          pLeft: 30.w,
          pRight: 30.w,
          title: "Referrals",
          titleValue: "394",
        ),
        DisktopOverViewStatesContainer(
          pLeft: 30.w,
          pRight: 30.w,
          title: "Jobs Sold",
          titleValue: "251",
        ),
        DisktopOverViewStatesContainer(
          pLeft: 30.w,
          pRight: 30.w,
          title: "Total Invoiced",
          titleValue: "25,738",
        ),
        DisktopOverViewStatesContainer(
          pLeft: 30.w,
          pRight: 30.w,
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
