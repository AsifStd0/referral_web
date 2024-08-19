import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/GlobalWidgets/AppbarWidget.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/ListDataContainer.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/OverviewContainersROW/OverviewContainersROW.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/ReferralPartner/ReferralPartnerMainScreen.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/MainHeadingContainerWidget/HeadingContainer.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/PendingRefferlScreen/PendingReferralPartnersScreen.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/ReferralPartner/ReferralPartnerDoneScreen.dart';
import 'package:referral_admin_web/TabletViews/TabletSignInScreen/InputTextContainer.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/Colors/Colours.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/PoppinText.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/kButton.dart';

int index = 0;
List<String> paidList = ["Paid", 'Not Paid', 'Not \nQualified'];
List<String> leadsList = ["Sold", 'Lost'];

class DashedBoardScreen extends StatefulWidget {
  const DashedBoardScreen({super.key});

  @override
  State<DashedBoardScreen> createState() => _DashedBoardScreenState();
}

class _DashedBoardScreenState extends State<DashedBoardScreen> {
  TextEditingController fullNameSignupControllar = TextEditingController();
  TextEditingController emailControllar = TextEditingController();
  TextEditingController addressControllar = TextEditingController();
  TextEditingController CompanyControllar = TextEditingController();
  TextEditingController passwordSignupControllar = TextEditingController();
  TextEditingController confirmPasswordSignupControllar =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppbarWidget(deviceWidth: deviceWidth, deviceHeight: deviceHeight),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainHeadingsContainer(),
                index == 0
                    ? Container(
                        width: deviceWidth * 0.8,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 34.w,
                            top: 47.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinText(
                                text: "Overview & Stats",
                                colour: blackColors,
                                fs: 24,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              OverviewContainersROW(),
                              SizedBox(
                                height: 30.h,
                              ),
                              PoppinText(
                                text: "All Users Referral Leads",
                                colour: blackColors,
                                fs: 24,
                                fw: FontWeight.bold,
                              ),
                              Container(
                                height: deviceHeight,
                                child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListDataContainer(
                                          deviceWidth: deviceWidth);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )
                    : index == 1
                        ? Consumer<ReferalPartnerProvider>(builder:
                            (BuildContext context, value, Widget? child) {
                            return value.getPartnerDoesreferralReportScreen == 0
                                ? ReferralPartnerMainScreen(
                                    deviceWidth: deviceWidth)
                                : value.getPartnerDoesreferralReportScreen == 1
                                    ? ReferralPartnerDoneScreen(
                                        deviceWidth: deviceWidth,
                                        deviceHeight: deviceHeight)
                                    : NewReferralPartnerScreen(
                                        fullNameSignupControllar:
                                            fullNameSignupControllar,
                                        deviceWidth: deviceWidth,
                                        deviceHeight: deviceHeight);
                          })
                        : PendingReferralPartnersScreen()
              ],
            )
          ],
        ),
      ),
    );
  }

  Container MainHeadingsContainer() {
    return Container(
      height: 1000,
      width: 305.w,
      decoration: BoxDecoration(
        color: whiteColors,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1.r,
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
            return HeadingContainer(
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
              return HeadingContainer(
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
              return HeadingContainer(
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
          )
        ],
      ),
    );
  }
}

class NewReferralPartnerScreen extends StatelessWidget {
  const NewReferralPartnerScreen({
    Key? key,
    required this.fullNameSignupControllar,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  final TextEditingController fullNameSignupControllar;
  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1120.w,
      margin: EdgeInsets.only(left: 67.w, top: 34.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinText(
            text: "Add New Referral Partner Account",
            colour: blackColors,
            fs: 26,
            // fw: FontWeight.bold,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputTextContainer(
                controller: fullNameSignupControllar,
                hintText: 'Full Name',
                icon: Icons.person,
                iconColor: themeBlue,
                iconBackColor: Colors.transparent,
              ),
              InputTextContainer(
                controller: fullNameSignupControllar,
                hintText: 'Email',
                icon: Icons.email,
                iconColor: themeBlue,
                iconBackColor: Colors.transparent,
              ),
            ],
          ),
          SizedBox(
            height: 54.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputTextContainer(
                controller: fullNameSignupControllar,
                hintText: 'Address',
                icon: Icons.location_on,
                iconColor: themeBlue,
                iconBackColor: Colors.transparent,
              ),
              InputTextContainer(
                controller: fullNameSignupControllar,
                hintText: 'Company Name',
                icon: Icons.location_city,
                iconColor: themeBlue,
                iconBackColor: Colors.transparent,
              ),
            ],
          ),
          SizedBox(
            height: 54.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputTextContainer(
                controller: fullNameSignupControllar,
                hintText: 'Password',
                icon: Icons.lock_person_sharp,
                iconColor: themeBlue,
                iconBackColor: Colors.transparent,
              ),
              InputTextContainer(
                controller: fullNameSignupControllar,
                hintText: 'Confirm Password',
                icon: Icons.lock_person_sharp,
                iconColor: themeBlue,
                iconBackColor: Colors.transparent,
              ),
            ],
          ),
          SizedBox(
            height: 118.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kButton(
                deviceWidth: deviceWidth,
                deviceHeight: deviceHeight,
                text: "create account",
                onpressed: () {
                  Get.to(DashedBoardScreen());
                },
              ),
              SizedBox(
                width: 66.w,
              ),
              PoppinText(
                text: "Cancel",
                colour: lightGrey,
                fs: 24,
              ),
            ],
          )
        ],
      ),
    );
  }
}
