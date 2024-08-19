import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopEditReferralPartnerAccount/edit_provider.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/InputTextContainer.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';
import 'package:referral_admin_web/GlobalWidgets/kButton.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/View_models/ModelReferalPartners.dart';

class DisktopEditReferralPartnerAccount extends StatelessWidget {
  DisktopEditReferralPartnerAccount(
      {Key? key,
      required this.fullNameSignupControllar,
      required this.deviceWidth,
      required this.deviceHeight,
      required this.list})
      : super(key: key);
  List<ModelReferalPartners> list;
  final TextEditingController fullNameSignupControllar;
  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    // print(list.toString());
    return ChangeNotifierProvider(
        create: (context) => EditProvider(),
        child: Consumer<EditProvider>(
            builder: (BuildContext context, model, Widget? child) {
          return Container(
            width: 900.w,
            color: whiteColors,
            margin: EdgeInsets.only(left: 37.w, top: 34.h, right: 30.w),
            child: model.isdataLoad
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              model.onwer.firstName = name;
                            },
                            w: 426.w,
                            // controller: fullNameSignupControllar,
                            hintText: '${model.onwer.firstName}',
                            icon: Icons.person,
                            iconColor: themeBlue,
                            iconBackColor: Colors.transparent,
                          ),
                          InputTextContainer(
                            change: (lname) {
                              model.onwer.lastName = lname;
                            },
                            w: 426.w,
                            // controller: fullNameSignupControllar,
                            hintText: '${model.onwer.lastName}',
                            icon: Icons.person,
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
                            change: (email) {
                              model.onwer.email = email;
                            },
                            w: 426.w,
                            // controller: fullNameSignupControllar,
                            hintText: '${model.onwer.email}',
                            icon: Icons.email,
                            iconColor: themeBlue,
                            iconBackColor: Colors.transparent,
                          ),
                          InputTextContainer(
                            change: (address) {
                              model.onwer.address = address;
                            },
                            w: 426.w,
                            // controller: fullNameSignupControllar,
                            hintText: '${model.onwer.address}',
                            icon: Icons.location_on,
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
                            change: (companyName) {
                              model.onwer.companyName = companyName;
                            },
                            w: 426.w,
                            //  controller: fullNameSignupControllar,
                            hintText: '${model.onwer.companyName}',
                            icon: Icons.location_city,
                            iconColor: themeBlue,
                            iconBackColor: Colors.transparent,
                          ),

                          InputTextContainer(
                            change: (password) {
                              model.onwer.password = password;
                            },
                            w: 426.w,
                            //  controller: fullNameSignupControllar,
                            hintText: '${model.onwer.password}',
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            kButton(
                              deviceWidth: deviceWidth,
                              deviceHeight: deviceHeight,
                              text: "Edit ACCOUNT",
                              onpressed: () {
                                model.updateFunction();

                                value.setValue(0);
                              },
                            ),
                            SizedBox(
                              width: 56.w,
                            ),
                            InkWell(
                              onTap: () {
                                value.setValue(0);
                              },
                              child: PoppinText(
                                text: "Cancel",
                                colour: lightGrey,
                                fs: 20,
                              ),
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
