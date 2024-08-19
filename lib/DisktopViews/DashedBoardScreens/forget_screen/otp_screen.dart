import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/forget_screen/email_screen/email_screen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/forget_screen/password_screen/password_screen.dart';

import '../../../GlobalWidgets/Colors/Colours.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final id;
  final otp;
  OtpScreen({super.key, this.id, this.otp});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // return ChangeNotifierProvider(
    //     create: (context) => PasswordScreenProvider(),
    //     child: Consumer<PasswordScreenProvider>(
    //         builder: (BuildContext context, model1, Widget? child) {
    String? userpin;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      KText(
                        text: 'Enter OTP you Recieved in Email',
                        width: width,
                        fw: FontWeight.w500,
                        fs: width * 0.040,
                        colour: Colors.black,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width - 1000.w,
                        fieldWidth: 80,
                        style: TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                          userpin = pin;
                        },
                      ),
                      // Center(
                      //   child: Image.asset(
                      //     "assets/images/appLogoImage.png",
                      //     scale: 4,
                      //     // color: whiteColors,
                      //   ),
                      // ),

                      SizedBox(
                        height: 60,
                      ),
                      kButton1(
                        onPressed: () {
                          print('this is user input pin ${userpin}');
                          print('this is email  pin ${otp}');
                          print('this is  id ${id}');
                          if (userpin == otp.toString()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordScreen(
                                          id: id,
                                        )));
                          } else {
                            Get.snackbar('', 'OTP not matched',
                                colorText: Colors.white,
                                backgroundColor: themeBlue,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        h: 48,
                        w: 170,
                        text: "confirm",
                        textColor: Colors.white,
                        colour: Colors.blue,
                      ),
                    ],
                  ),
                ])));

    //       }));
    // }
  }
}
