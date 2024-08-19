import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopEditReferralPartnerAccount/DisktopEditReferralPartnerAccount.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopNewReferralPartnerScreen/DisktopNewReferralPartnerScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopReferralPartnerDoneScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopReferralPartnerMainScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/test.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/over_view_screen/over_view_screen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DisktopMainHeadingContainerWidget/DisktopHeadingContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DisktopPendingRefferlScreen/DisktopPendingReferralPartnersScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/profile_screen/profile_screen.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/AppbarWidget.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/global%20Lists/GlobalList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../GlobalWidgets/PoppinText.dart';

int index = 0;
List<String> paidList = ["Paid", 'Not Paid', 'Not Qualified'];
List<String> leadsList = ["Sold", 'Lost', 'Not Qualified'];

class DisktopDashedBoardScreen extends StatefulWidget {
  final email;
  final isSuperAdmin;
  const DisktopDashedBoardScreen({super.key, this.email, this.isSuperAdmin});

  @override
  State<DisktopDashedBoardScreen> createState() =>
      _DisktopDashedBoardScreenState();
}

class _DisktopDashedBoardScreenState extends State<DisktopDashedBoardScreen> {
  TextEditingController fullNameSignupControllar = TextEditingController();
  TextEditingController emailControllar = TextEditingController();
  TextEditingController addressControllar = TextEditingController();
  TextEditingController CompanyControllar = TextEditingController();
  TextEditingController passwordSignupControllar = TextEditingController();
  TextEditingController confirmPasswordSignupControllar =
      TextEditingController();
  void initState() {
    sharedfunction();
    // TODO: implement initState
    super.initState();
  }

  bool? isviewonly;
  sharedfunction() async {
    SharedPreferences? shared = await SharedPreferences.getInstance();
    setState(() {
      isviewonly = shared.getBool('isviewonly');
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColors,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppbarWidget(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            isSuperAdmin: widget.isSuperAdmin,
            email: widget.email,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DisktopMainHeadingsContainer(deviceHeight),

              ///
              ///Overview & Stats
              ///
              index == 0
                  ? OverViewScreen(
                      isviewonly: isviewonly,
                      deviceWidth: deviceWidth,
                      deviceHeight: deviceHeight)

                  ///
                  ///<ReferalPartner
                  ///
                  : index == 1
                      ? Consumer<ReferalPartnerProvider>(builder:
                          (BuildContext context, value, Widget? child) {
                          return value.getPartnerDoesreferralReportScreen == 0

                              ///
                              ///-----><ReferalPartner main page
                              ///
                              ? DisktopReferralPartnerMainScreen(
                                  isviewonly: isviewonly,
                                  deviceWidth: deviceWidth)
                              : value.getPartnerDoesreferralReportScreen == 1

                                  ///
                                  ///------->ReferralPartnerDone and leads
                                  ///
                                  ? DisktopReferralPartnerViewScreen(
                                      deviceWidth: deviceWidth,
                                      deviceHeight: deviceHeight)

                                  ///
                                  ///------>add new referal partner
                                  ///
                                  : value.getPartnerDoesreferralReportScreen ==
                                          2
                                      ? NewReferralPartnerScreen()

                                      ///
                                      ///-----> edite referel partner
                                      ///
                                      : DisktopEditReferralPartnerAccount(
                                          list: referralPartnersList,
                                          fullNameSignupControllar:
                                              fullNameSignupControllar,
                                          deviceWidth: deviceWidth,
                                          deviceHeight: deviceHeight);
                        })

                      ///
                      ///------> pending partner
                      ///
                      : index == 2
                          ? DisktopPendingReferralPartnersScreen(
                              deviceWidth: deviceWidth,
                              deviceHeight: deviceHeight)
                          : profileScreen(
                              deviceWidth: deviceWidth,
                              deviceHeight: deviceHeight,
                            )
            ],
          )
        ],
      ),
    );
  }

  Container DisktopMainHeadingsContainer(double height) {
    return Container(
      height: height * 0.9,
      width: 305.w,
      decoration: BoxDecoration(
        color: whiteColors,
        border: Border(
            right: BorderSide(width: 0.1, color: lightGrey.withOpacity(1))),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 3.r,
            offset: Offset(
              4.0,
              0.0,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 58.h,
          ),
          Consumer<ReferalPartnerProvider>(
              builder: (BuildContext context, value, Widget? child) {
            return DisktopHeadingContainer(
              clickedIndex: 0,
              headingText: "Dashboard",
              image: "assets/images/dashedboardIcon.png",
              onPressed: () {
                setState(() {
                  index = 0;
                });
                value.setValue(0);
              },
            );
          }),
          SizedBox(
            height: 33.h,
          ),
          Consumer<ReferalPartnerProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return DisktopHeadingContainer(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                  value.setValue(0);
                },
                clickedIndex: 1,
                headingText: "Referral Partners",
                image: index == 1
                    ? "assets/images/activeReferral.png"
                    : "assets/images/referralPartners.png",
              );
            },
          ),
          SizedBox(
            height: 33.h,
          ),
          Consumer<ReferalPartnerProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return DisktopHeadingContainer(
                onPressed: () {
                  setState(() {
                    index = 2;
                  });
                  value.setValue(0);
                },
                clickedIndex: 2,
                headingText: "Pending Partners",
                image: "assets/images/pendingPartnersImage.png",
              );
            },
          ),
          SizedBox(
            height: 33.h,
          ),
          Consumer<ReferalPartnerProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return DisktopHeadingContainer(
                onPressed: () {
                  setState(() {
                    index = 3;
                  });
                  value.setValue(0);
                },
                clickedIndex: 3,
                headingText: "Profile",
                image: "assets/images/profile21.png",
              );
            },
          ),
        ],
      ),
    );
  }
}
