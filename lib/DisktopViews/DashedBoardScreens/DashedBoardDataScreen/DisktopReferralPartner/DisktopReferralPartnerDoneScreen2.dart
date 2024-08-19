import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopColumnContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopLeadsDoneListContainer.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';

class DisktopReferralPartnerDoneScreen2 extends StatelessWidget {
  const DisktopReferralPartnerDoneScreen2({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth * 0.8,
      child: Padding(
        padding: EdgeInsets.only(
          left: 34.w,
          top: 47.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Consumer<ReferalPartnerProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return InkWell(
                    onTap: () {
                      value.setValue(0);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: blackColors,
                    ),
                  );
                }),
                PoppinText(
                  text: "John Doe does Referral Leads",
                  colour: blackColors,
                  fs: 19,
                  fw: FontWeight.bold,
                ),
              ],
            ),
            Container(
                width: deviceWidth * 0.8,
                height: 168.h,
                margin: EdgeInsets.only(top: 18.h, right: 20.w),
                padding: EdgeInsets.only(left: 24.w, top: 19.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Color.fromARGB(255, 242, 242, 242)),
                child: Row(
                  children: [
                    DisktopColumnContainer(
                      w: 196,
                      heading1: 'Referrer Name',
                      heading1Value: 'John Doe',
                      heading2: 'W9 Form',
                      heading2Value: 'Submitted',
                    ),
                    DisktopColumnContainer(
                      w: 239,
                      heading1: "Phone",
                      heading1Value: "+1-344-9876123",
                      heading2: "Email",
                      heading2Value: "johndoe@email.com",
                    ),
                    DisktopColumnContainer(
                      w: 310,
                      heading1: "Address",
                      heading1Value: "H#12, ST 10 New York USA",
                      heading2: "Company",
                      heading2Value: "Umbrella Carporation (PVT). Ltd",
                    ),
                    DisktopColumnContainer(
                      w: 180,
                      heading1: "Avg. Job Value",
                      heading1Value: "123",
                      heading2: "Referrals",
                      heading2Value: "10",
                    ),
                  ],
                )),
            Container(
              height: deviceHeight,
              margin: EdgeInsets.only(top: 40.h),
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return DisktopLeadsDoneListContainer(
                      list: paidList,
                      list2: leadsList,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
