import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/MobileViews/DashedBoardScreens/DashedBoardDataScreen/ColumnContainer.dart';
import 'package:referral_admin_web/MobileViews/DashedBoardScreens/DashedBoardDataScreen/ReferralPartner/ButtonsColumnContainer.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/Colors/Colours.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/PoppinText.dart';

class LeadsDoneListContainer extends StatelessWidget {
  LeadsDoneListContainer({Key? key, required this.list, required this.list2})
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
          borderRadius: BorderRadius.circular(31.r),
          border: Border.all(width: 0.1, color: lightGrey)),
      padding: EdgeInsets.only(bottom: 20.h, left: 25.w, top: 17.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColumnContainer(
                  w: 256,
                  heading1: 'Phone',
                  heading1Value: '+1-344-9876123',
                  heading2: 'W9 Form',
                  heading2Value: 'Submitted',
                  HeadingColor: lightGrey),
              ColumnContainer(
                  w: 319,
                  heading1: 'Phone',
                  heading1Value: '+1-344-9876123',
                  heading2: 'Company',
                  heading2Value: 'Umbrella Carporation (PVT). Ltd',
                  HeadingColor: lightGrey),
              ColumnContainer(
                  w: 324,
                  heading1: 'Address',
                  heading1Value: 'H#12, ST 10 New York USA',
                  heading2: '',
                  heading2Value: '',
                  HeadingColor: lightGrey),
              ColumnContainer(
                  w: 262,
                  heading1: 'Date',
                  heading1Value: '12 Dec, 2022',
                  heading2: '',
                  heading2Value: '',
                  HeadingColor: lightGrey),
              ButtonsColumnContainer(
                heading1: "Job number",
                heading2: "Payment",
                // list2: list2,
                list: list,
              ),
              ButtonsColumnContainer(
                heading1: "Invoiced amt",
                heading2: "Lead",
                // list2: list2,
                list: list2,
              )
            ],
          ),
          PoppinText(text: "Description of loss", colour: lightGrey, fs: 20),
          SizedBox(
            height: 3.h,
          ),
          PoppinText(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit. In risus neque, commodo quis luctus a, convallis quis sapien. Aliquam vitae pharetra nibh. Sed mollis interdum ante sit amet mollis. Vivamus efficitur tincidunt iaculis. Nunc dapibus urna turpis, sit amet malesuada massa ornare sit amet. Vivamus egestas, velit eget pretium feugiat, dolor tellus tincidunt nisi, sed vestibulum metus nunc quis magna.",
              colour: blackColors,
              fs: 18),
        ],
      ),
    );
  }
}
