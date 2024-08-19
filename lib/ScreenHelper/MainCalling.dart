import 'package:flutter/material.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/DisktopSignInScreen.dart';
import 'package:referral_admin_web/MobileViews/SignInScreen/MobileSignInScreen.dart';
import 'package:referral_admin_web/ScreenHelper/ResponsiveClass.dart';

class DesktopMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
          // Let's work on our mobile part

          //  ListOfEmails(),
          tablet: DisktopSignInScreen(),
          desktop: DisktopDashedBoardScreen(),
          // desktop: DesktopHome(),
          mobile: MobileSignInScreen()),
    );
  }
}
