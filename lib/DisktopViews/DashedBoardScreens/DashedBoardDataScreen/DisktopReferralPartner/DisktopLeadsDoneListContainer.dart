import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopColumnContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopButtonsColumnContainer.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class DisktopLeadsDoneListContainer extends StatelessWidget {
  DisktopLeadsDoneListContainer(
      {Key? key, required this.list, required this.list2})
      : super(key: key);
  List<String> list;
  List<String> list2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1521.w,
      // height: 332.h,
      margin: EdgeInsets.only(bottom: 39.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blackColors.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(31.r),
          color: whiteColors,
          border: Border.all(width: 0.5, color: themeBlue)),
      padding:
          EdgeInsets.only(bottom: 20.h, left: 15.w, top: 17.h, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              // width: deviceWidth * 0.6,
              height: 168.h,
              margin: EdgeInsets.only(top: 18.h, right: 25.w),
              padding: EdgeInsets.only(left: 24.w, top: 19.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: ContainerBackground),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DisktopColumnContainer(
                    w: 155,
                    heading1: 'Referrer Name',
                    heading1Value: 'John Doe',
                    heading2: 'W9 Form',
                    heading2Value: 'Submitted',
                  ),
                  DisktopColumnContainer(
                    w: 219,
                    heading1: "Phone",
                    heading1Value: "+1-344-9876123",
                    heading2: "Email",
                    heading2Value: "johndoe@email.com",
                  ),
                  DisktopColumnContainer(
                    w: 327,
                    heading1: "Address",
                    heading1Value: "H#12, ST 10 New York USA",
                    heading2: "Company",
                    heading2Value: "Umbrella Carporation (PVT). Ltd",
                  ),
                  DisktopColumnContainer(
                    w: 200,
                    heading1: "Avg. Job Value",
                    heading1Value: "123",
                    heading2: "Referrals",
                    heading2Value: "10",
                  ),
                ],
              )),
          Container(
            height: 240.h,
            margin: EdgeInsets.only(top: 18.h, right: 25.w),
            padding: EdgeInsets.only(left: 24.w, top: 19.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), color: whiteColors),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DisktopColumnContainer(
                    w: 206,
                    heading1: 'Customer Name',
                    heading1Value: 'daniel',
                    heading2: 'W9 Form',
                    heading2Value: 'Submitted',
                    HeadingColor: lightGrey),
                DisktopColumnContainer(
                    w: 350,
                    heading1: 'Phone',
                    heading1Value: '+1-344-9876123',
                    heading2: 'Company',
                    heading2Value: 'Umbrella Carporation (PVT). Ltd',
                    HeadingColor: lightGrey),
                DisktopColumnContainer(
                    w: 300,
                    heading1: 'Address',
                    heading1Value: 'H#12, ST 10 New York USA',
                    heading2: '',
                    heading2Value: '',
                    HeadingColor: lightGrey),
                DisktopColumnContainer(
                    w: 222,
                    heading1: 'Date',
                    heading1Value: '12 Dec, 2022',
                    heading2: '',
                    heading2Value: '',
                    HeadingColor: lightGrey),
                DisktopButtonsColumnContainer(
                  heading1: "Job number",
                  heading2: "Payment",
                  // list2: list2,
                  list: list,
                ),
                DisktopButtonsColumnContainer(
                  heading1: "Invoiced amt",
                  heading2: "Lead",
                  // list2: list2,
                  list: list2,
                )
              ],
            ),
          ),
          PoppinText(text: "Description of loss", colour: lightGrey, fs: 13),
          SizedBox(
            height: 3.h,
          ),
          PoppinText(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit. In risus neque, commodo quis luctus a, convallis quis sapien. Aliquam vitae pharetra nibh. Sed mollis interdum ante sit amet mollis. Vivamus efficitur tincidunt iaculis. Nunc dapibus urna turpis, sit amet malesuada massa ornare sit amet. Vivamus egestas, velit eget pretium feugiat, dolor tellus tincidunt nisi, sed vestibulum metus nunc quis magna.",
              colour: blackColors,
              fs: 14),
        ],
      ),
    );
  }
}
