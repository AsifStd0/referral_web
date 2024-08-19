import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopEditReferralPartnerAccount/edit_provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/profile_screen/profile_provider.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/kButton.dart';
import 'package:referral_admin_web/View_models/ModelReferalPartners.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../GlobalWidgets/Colors/Colours.dart';
import '../../../GlobalWidgets/InputTextContainer.dart';
import '../../../GlobalWidgets/PoppinText.dart';

// class profileScreen extends StatefulWidget {
//   final double deviceWidth;
//   final double deviceHeight;
//   const profileScreen({
//     Key? key,
//     required this.deviceWidth,
//     required this.deviceHeight,
//   }) : super(key: key);
//   @override
//   State<profileScreen> createState() => _profileScreenState();
// }
// class _profileScreenState extends State<profileScreen> {
//   void initState() {
//     // TODO: implement initState
//     shareFunction();
//     super.initState();
//   }
//   String? CurrentID;
//   int isShowTextFeild = 0;
//   String? email;
//   String? password;
//   String? currrentPassword;
//   SharedPreferences? shared;
//   shareFunction() async {
//     shared = await SharedPreferences.getInstance();
//     setState(() {
//       CurrentID = shared!.getString('ID');
//       email = shared!.getString('Email');
//       password = shared!.getString('password');
//     });
//     // log("ID $CurrentID email $email  password $password");
//     // if (login == 'login') {
//     //   Get.offAll(DisktopDashedBoardScreen());
//     // } else {
//     //   Get.offAll(DisktopSignInScreen());
//     // }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => profileProvider(),
//         child: Consumer<profileProvider>(
//             builder: (BuildContext context, model, Widget? child) {
//           return Container(
//             color: Colors.white.withOpacity(.3),
//             width: widget.deviceWidth * 0.84,
//             height: widget.deviceHeight * .99 - 65.h,
//             child: model.isAdminLoaded
//                 ? Center(
//                     child: Center(child: CircularProgressIndicator()),
//                   )
//                 : Column(
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                         Container(
//                           height: 80.h,
//                         ),
//                         SizedBox(
//                           width: 80.w,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20.w),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.r)),
//                               color: themeBlue,
//                             ),
//                             height: 40.w,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 PoppinText(
//                                   text: "Email :",
//                                   colour: whiteColors,
//                                   fs: 20,
//                                   fw: FontWeight.w300,
//                                 ),
//                                 SizedBox(
//                                   width: 20.w,
//                                 ),
//                                 PoppinText(
//                                   text: "${model.email}",
//                                   colour: whiteColors,
//                                   fs: 20,
//                                   fw: FontWeight.w300,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20.w,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20.w),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.r)),
//                               color: themeBlue,
//                             ),
//                             height: 40.w,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 PoppinText(
//                                   text: "Password :",
//                                   colour: whiteColors,
//                                   fs: 20,
//                                   fw: FontWeight.w300,
//                                 ),
//                                 SizedBox(
//                                   width: 20.w,
//                                 ),
//                                 PoppinText(
//                                   text: "${model.password}",
//                                   colour: whiteColors,
//                                   fs: 20,
//                                   fw: FontWeight.w300,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 50.h,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             print('some one tap on me');
//                             setState(() {
//                               isShowTextFeild++;
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: themeBlue,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30.r))),
//                             height: 100.h,
//                             width: 300.w,
//                             child: Center(
//                               child: PoppinText(
//                                 text: "Update Password",
//                                 colour: whiteColors,
//                                 fs: 20,
//                                 fw: FontWeight.w300,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30.h,
//                         ),
//                         isShowTextFeild != 0
//                             ? Column(
//                                 children: [
//                                   InputTextContainer(
//                                     change: (password) {
//                                       //model.model.email = email;
//                                       currrentPassword = password;
//                                     },
//                                     // controller: fullNameControllar,
//                                     hintText: 'Password',
//                                     icon: Icons.lock_person_sharp,
//                                     iconColor: themeBlue,
//                                     iconBackColor: Colors.transparent,
//                                   ),
//                                   SizedBox(
//                                     height: 20.h,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () async {
//                                       print('some one tap on me');
//                                       if (currrentPassword == null) {
//                                         Get.snackbar(
//                                             '', 'Please enter password',
//                                             colorText: Colors.white,
//                                             backgroundColor: themeBlue,
//                                             snackPosition:
//                                                 SnackPosition.BOTTOM);
//                                         return;
//                                       } else {
//                                         try {
//                                           await FirebaseFirestore.instance
//                                               .collection('admin')
//                                               .doc(CurrentID)
//                                               .update({
//                                             'password': currrentPassword,
//                                           }).then((value) {
//                                             model.getadmin();
//                                             Get.snackbar('', 'Password updated',
//                                                 colorText: Colors.white,
//                                                 backgroundColor: themeBlue,
//                                                 snackPosition:
//                                                     SnackPosition.BOTTOM);
//                                           });
//                                         } catch (e) {
//                                           print(e);
//                                         }
//                                       }
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: themeBlue,
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30.r))),
//                                       height: 100.h,
//                                       width: 300.w,
//                                       child: Center(
//                                         child: PoppinText(
//                                           text: "Reset Password",
//                                           colour: whiteColors,
//                                           fs: 20,
//                                           fw: FontWeight.w300,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : PoppinText(
//                                 text: "",
//                                 colour: blackColors,
//                                 fs: 20,
//                                 fw: FontWeight.w300,
//                               ),
//                       ]),
//           );
//         }));
//   }
// }

class profileScreen extends StatelessWidget {
  profileScreen({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => profileProvider(),
        child: Consumer<profileProvider>(
            builder: (BuildContext context, model, Widget? child) {
          return Container(
            width: 900.w,
            color: whiteColors,
            margin: EdgeInsets.only(left: 37.w, top: 34.h, right: 30.w),
            child: model.isAdminLoaded
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PoppinText(
                        text: "Edit Referral Partner Account",
                        colour: blackColors,
                        fs: 24,
                        fw: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputTextContainer(
                            change: (name) {
                              model.onwer.name = name;
                            },
                            w: 426.w,
                            // controller: fullNameSignupControllar,
                            hintText: '${model.onwer.name}',
                            icon: Icons.person,
                            iconColor: themeBlue,
                            iconBackColor: Colors.transparent,
                          ),
                          InputTextContainer(
                            change: (email) {
                              model.onwer.email = email;
                            },
                            w: 426.w,
                            // controller: fullNameSignupControllar,
                            hintText: '${model.onwer.email!.toLowerCase()}',
                            icon: Icons.email,
                            iconColor: themeBlue,
                            iconBackColor: Colors.transparent,
                          ),
                          // InputTextContainer(
                          //   change: (lname) {
                          //     model.onwer.lastName = lname;
                          //   },
                          //   w: 426.w,
                          //   // controller: fullNameSignupControllar,
                          //   hintText: '${model.onwer.lastName}',
                          //   icon: Icons.person,
                          //   iconColor: themeBlue,
                          //   iconBackColor: Colors.transparent,
                          // ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 54.h,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InputTextContainer(
                          //   change: (address) {
                          //     model.onwer.address = address;
                          //   },
                          //   w: 426.w,
                          //   // controller: fullNameSignupControllar,
                          //   hintText: '${model.onwer.address}',
                          //   icon: Icons.location_on,
                          //   iconColor: themeBlue,
                          //   iconBackColor: Colors.transparent,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 54.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InputTextContainer(
                          //   change: (companyName) {
                          //     model.onwer.companyName = companyName;
                          //   },
                          //   w: 426.w,
                          //   //  controller: fullNameSignupControllar,
                          //   hintText: '${model.onwer.companyName}',
                          //   icon: Icons.location_city,
                          //   iconColor: themeBlue,
                          //   iconBackColor: Colors.transparent,
                          // ),

                          InputTextContainer(
                            change: (password) {
                              model.onwer.password = password;
                            },
                            w: 426.w,
                            //  controller: fullNameSignupControllar,
                            hintText: '${model.onwer.password!.toLowerCase()}',
                            icon: Icons.lock_person_sharp,
                            iconColor: themeBlue,
                            iconBackColor: Colors.transparent,
                          ),
                          // InputTextContainer(
                          //   change: (val) {},
                          //   w: 426.w,
                          //   controller: fullNameSignupControllar,
                          //   hintText: 'Confirm Password',
                          //   icon: Icons.lock_person_sharp,
                          //   iconColor: themeBlue,
                          //   iconBackColor: Colors.transparent,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 98.h,
                      ),
                      Consumer<ReferalPartnerProvider>(builder:
                          (BuildContext context, value, Widget? child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kButton(
                              deviceWidth: deviceWidth,
                              deviceHeight: deviceHeight,
                              text: "Edit ACCOUNT",
                              onpressed: () {
                                model.updateFunction();
                              },
                            ),
                          ],
                        );
                      })
                    ],
                  ),
          );
        }));
  }
}
