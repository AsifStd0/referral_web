import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:referral_admin_web/MobileViews/DashedBoardScreens/DashedBoardDataScreen/DashedBoardScreen.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/Colors/Colours.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/MobileAppbarWidget.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/PoppinText.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/kButton.dart';
import 'package:referral_admin_web/MobileViews/SignInScreen/MobileInputTextContainer.dart';

class MobileSignInScreen extends StatelessWidget {
  MobileSignInScreen({super.key});

  TextEditingController fullNameControllar = TextEditingController();
  TextEditingController passwordControllar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MobileAppbarWidget(
              deviceWidth: deviceWidth, deviceHeight: deviceHeight),
          SizedBox(
            height: deviceHeight * 0.05,
          ),
          Image.asset(
            "assets/images/appLogo.png",
            height: 65.h,
            width: 38.w,
          ),
          SizedBox(
            height: deviceHeight * 0.03,
          ),
          PoppinText(
            text: "Referral Program",
            colour: blackColors,
            fs: 25,
          ),
          SizedBox(
            height: 40.h,
          ),
          PoppinText(
            text: "Welcome! Sign in to Continue",
            colour: lightGrey,
            fs: 20,
          ),
          SizedBox(
            height: 40.h,
          ),
          MobileInputTextContainer(
            controller: fullNameControllar,
            hintText: 'Full Name',
            icon: Icons.person,
            iconColor: whiteColors,
            iconBackColor: themeBlue,
          ),
          SizedBox(
            height: 40.h,
          ),
          MobileInputTextContainer(
            controller: passwordControllar,
            hintText: 'Password',
            icon: Icons.lock_person_sharp,
            iconColor: themeBlue,
            iconBackColor: Colors.transparent,
          ),
          SizedBox(
            height: 40.h,
          ),
          kButton(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            text: "SIGN IN",
            onpressed: () {
              Get.to(DashedBoardScreen());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => DashedBoardScreen()));
            },
          )
        ],
      ),
    );
  }
}
