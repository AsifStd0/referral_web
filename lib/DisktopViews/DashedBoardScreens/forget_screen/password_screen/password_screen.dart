import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/forget_screen/email_screen/email_screen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/forget_screen/password_screen/password_screen_provider.dart';

import '../../../../GlobalWidgets/Colors/Colours.dart';

// ignore: must_be_immutable
class PasswordScreen extends StatelessWidget {
  final id;
  PasswordScreen({super.key, this.id});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
        create: (context) => PasswordScreenProvider(id),
        child: Consumer<PasswordScreenProvider>(
            builder: (BuildContext context, model1, Widget? child) {
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
                              text: 'Enter password',
                              width: width,
                              fw: FontWeight.w500,
                              fs: width * 0.040,
                              colour: Colors.black,
                            ),
                            // Center(
                            //   child: Image.asset(
                            //     "assets/images/appLogoImage.png",
                            //     scale: 4,
                            //     // color: whiteColors,
                            //   ),
                            // ),
                            SizedBox(
                              height: 35,
                            ),

                            SizedBox(
                              height: 35,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'password',
                                width: width,
                                fs: width * 0.012,
                                colour: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            KTextFieldwithShadow(
                                isobsecure: true,
                                onchange: (password) {
                                  model1.password = password;
                                },
                                textEditingController: emailController),
                            SizedBox(
                              height: 25,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'Confirm Password',
                                width: width,
                                fs: width * 0.012,
                                colour: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            KTextFieldwithShadow(
                                isobsecure: true,
                                onchange: (confirmpassword) {
                                  model1.confirmpassword = confirmpassword;
                                },
                                textEditingController: passwordController),

                            SizedBox(
                              height: 15,
                            ),
                            model1.isDataadd
                                ? Center(child: CircularProgressIndicator())
                                : kButton1(
                                    onPressed: () {
                                      if (model1.password!.length < 6) {
                                        Get.snackbar('',
                                            'Password must be 6 characters long',
                                            colorText: Colors.white,
                                            backgroundColor: themeBlue,
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      } else if (model1.password !=
                                          model1.confirmpassword) {
                                        Get.snackbar('',
                                            'Password and confirm password must be same',
                                            colorText: Colors.white,
                                            backgroundColor: themeBlue,
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      } else {
                                        model1.changePassword(context);
                                      }
                                    },
                                    h: 48,
                                    w: 200,
                                    text: "Change Password",
                                    textColor: Colors.white,
                                    colour: Colors.blue,
                                  ),
                          ],
                        ),
                      ])));
        }));
  }
}
