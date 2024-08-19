import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/refferel_pertner_main_screen_provider.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class DisktopHeadingsContainer extends StatelessWidget {
  final RefferelPartnerMainScreenProvider model;
  const DisktopHeadingsContainer({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1521.w,
      height: 65.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ContainerBackground),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(
        left: 33.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              model.getdata();
            },
            child: Container(
              //color: Colors.amber,
              width: 220.w,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: PoppinText(
                    text: "Name",
                    colour: themeBlue,
                    fs: 18,
                    fw: FontWeight.w500),
              ),
            ),
          ),
          Container(
            width: 160.w,
            child: PoppinText(
                text: "city", colour: themeBlue, fs: 18, fw: FontWeight.w500),
          ),
          Container(
            width: 220.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PoppinText(
                    text: "Referrals",
                    colour: themeBlue,
                    fs: 18,
                    fw: FontWeight.w500),
                Container(
                  //color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.sortrefferelAsending();
                            print('tap on sortrefferelAsending');
                          },
                          child: Container(
                            // color: Colors.red,
                            // height: 14.h,
                            // width: 20.w,
                            child: Center(
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                size: 25.sp,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.sortreffereldesending();
                            print('tap on sortreffereldesending');
                          },
                          child: Container(
                            // height: 14.h,
                            // width: 20.w,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 25.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            // height: 40.h,
            width: 220.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PoppinText(
                    text: "Jobs Sold",
                    colour: themeBlue,
                    fs: 18,
                    fw: FontWeight.w500),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        model.sortJobNumberAsending();
                        print('tap on sortJobNumberAsending');
                      },
                      child: Container(
                        // height: 34.h,
                        // width: 50.w,
                        decoration: BoxDecoration(),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        model.sortJobNumberdesending();
                        print('tap on sortJobNumberdesending');
                      },
                      child: Container(
                        // height: 14.h,
                        // width: 20.w,
                        decoration: BoxDecoration(),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 220.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: PoppinText(
                      text: "Total Invoiced (\$)",
                      colour: themeBlue,
                      fs: 18,
                      fw: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          model.sortInvoiceDesending();
                          //sortInvoiceAsending();
                          print(' tap on sortInvoiceAsending');
                        },
                        child: Container(
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.sortbyinvoice();

                          print('tap on sortInvoiceDesending');
                        },
                        child: Container(
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 25.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 300.w,
            child: PoppinText(
                text: "Avg. Referral Invoice (\$)",
                colour: themeBlue,
                fs: 18,
                fw: FontWeight.w500),
          ),
          PoppinText(
            text: "Action",
            colour: themeBlue,
            fs: 18,
            fw: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
