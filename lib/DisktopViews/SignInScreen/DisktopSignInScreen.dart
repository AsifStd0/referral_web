import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/AppbarWidget.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/kButton.dart';
import 'package:referral_admin_web/DisktopViews/SignInScreen/InputTextContainer.dart';

class DisktopSignInScreen extends StatelessWidget {
  DisktopSignInScreen({super.key});

  TextEditingController fullNameControllar = TextEditingController();
  TextEditingController passwordControllar = TextEditingController();
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
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            Image.asset(
              "assets/images/appLogo.png",
              height: 82.h,
              width: 50.w,
            ),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            PoppinText(
              text: "Referral Program",
              colour: blackColors,
              fs: 17,
            ),
            SizedBox(
              height: 40.h,
            ),
            PoppinText(
              text: "Welcome! Sign in to Continue",
              colour: lightGrey,
              fs: 15,
            ),
            SizedBox(
              height: 40.h,
            ),
            InputTextContainer(
              controller: fullNameControllar,
              hintText: 'Full Name',
              icon: Icons.person,
              iconColor: whiteColors,
              iconBackColor: themeBlue,
            ),
            SizedBox(
              height: 40.h,
            ),
            InputTextContainer(
              isobsecure: true,
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
                Get.to(DisktopDashedBoardScreen());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => DashedBoardScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
