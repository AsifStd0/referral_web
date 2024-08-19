import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/forget_screen/email_screen/email_screen.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/signin_screen_provider.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/AppbarWidget.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';
import 'package:referral_admin_web/GlobalWidgets/kButton.dart';
import 'package:referral_admin_web/GlobalWidgets/InputTextContainer.dart';

class DisktopSignInScreen extends StatelessWidget {
  DisktopSignInScreen({super.key});

  TextEditingController fullNameControllar = TextEditingController();
  TextEditingController passwordControllar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
        create: (context) => SignInProvider(),
        child: Consumer<SignInProvider>(
            builder: (BuildContext context, model, Widget? child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SinginAppbarWidget(
                      deviceWidth: deviceWidth, deviceHeight: deviceHeight),
                  SizedBox(
                    height: deviceHeight * 0.05,
                  ),
                  Image.asset(
                    "assets/images/logo1.png",
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
                    change: (email) {
                      model.model.email = email;
                    },
                    // controller: fullNameControllar,
                    hintText: 'Email',
                    icon: Icons.email,
                    iconColor: themeBlue,
                    iconBackColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  InputTextContainer(
                    change: (password) {
                      model.model.password = password;
                    },
                    // controller: passwordControllar,
                    hintText: 'Password',
                    icon: Icons.lock_person_sharp,
                    iconColor: themeBlue,
                    isobsecure: true,
                    iconBackColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 277.w),
                    child: GestureDetector(
                      onTap: () {
                        // Get.offAll(EnteremailScreen());
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                EnteremailScreen(mylist: model.list),
                            transitionDuration: Duration(milliseconds: 500),
                            // reverseTransitionDuration: Duration.zero,
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Container(
                        height: 31.h,
                        width: 156.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: PoppinText(
                            text: "Forgot Password",
                            colour: Colors.red,
                            fs: deviceWidth * 0.010,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  kButton(
                    deviceWidth: deviceWidth,
                    deviceHeight: deviceHeight,
                    text: "SIGN IN",
                    onpressed: () {
                      print('some one tap on me');
                      model.adminfunction();
                      //Get.to(DisktopDashedBoardScreen());
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => DashedBoardScreen()));
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
