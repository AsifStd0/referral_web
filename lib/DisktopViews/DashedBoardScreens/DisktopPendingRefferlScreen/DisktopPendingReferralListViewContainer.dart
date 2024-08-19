import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/KAcceptDenyBtn.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class DisktopPendingReferralListViewContainer extends StatelessWidget {
  DisktopPendingReferralListViewContainer(
      {Key? key,
      required this.index,
      this.refferedBy,
      this.refferelpartner,
      this.phone,
      this.jobtitle,
      this.company,
      this.loading,
      this.email,
      this.denyPress,
      required this.w9form,
      this.isviewonly,
      this.acceptPress})
      : super(key: key);
  int index;
  final refferedBy;
  final isviewonly;
  final phone;
  final refferelpartner;
  final jobtitle;
  final company;
  final loading;
  final email;
  final denyPress;
  final acceptPress;
  final w9form;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 105.h,
      width: 1521.w,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 205.w,
                  child: PoppinText(
                    text: '$refferedBy',
                    colour: blackColors,
                    fs: 17,
                  ),
                ),
                Container(
                  width: 210.w,
                  child: PoppinText(
                    text: '$refferelpartner',
                    colour: blackColors,
                    fs: 17,
                  ),
                ),
                Container(
                  width: 220.w,
                  child: PoppinText(
                    text: '$phone',
                    colour: blackColors,
                    fs: 17,
                  ),
                ),
                Container(
                  width: 205.w,
                  child: PoppinText(
                    text: '$jobtitle',
                    colour: blackColors,
                    fs: 17,
                  ),
                ),
                Container(
                  width: 200.w,
                  child: PoppinText(
                    text: '$company',
                    colour: blackColors,
                    fs: 17,
                  ),
                ),
                // Container(
                //   width: 280.w,
                //   child: PoppinText(
                //     text: '$email' + "    ",
                //     colour: blackColors,
                //     fs: 17,
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                      width: 280.w,
                      child: AutoSizeText(
                        '$email',
                        style: GoogleFonts.poppins(
                            fontSize: 17.sp, color: Colors.black),
                      )),
                ),
                // isviewonly
                //     ? TextButton(
                //         child: Text(
                //           'Disabled',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //         style: TextButton.styleFrom(
                //           backgroundColor: Colors.red,
                //         ),
                //         onPressed: () {
                //           print('Pressed');
                //         },
                //       )
                //     :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : KAcceptDenyBtn(
                            onPressed: isviewonly ? () {} : acceptPress,
                            btnText: "Accept",
                            fs: 18,
                            textColour: isviewonly
                                ? whiteColors.withOpacity(.4)
                                : greenAceptColor,
                            btnColor: isviewonly
                                ? lightGrey.withOpacity(.4)
                                : whiteColors,
                          ),
                    SizedBox(
                      width: 5.w,
                    ),
                    KAcceptDenyBtn(
                      onPressed: isviewonly ? () {} : denyPress,
                      btnText: "Deny",
                      fs: 18,
                      textColour:
                          isviewonly ? redColor.withOpacity(.4) : redColor,
                      btnColor:
                          isviewonly ? lightGrey.withOpacity(.4) : whiteColors,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.h),
            child: Row(
              children: [
                Container(
                  width: 205.w,
                  child: PoppinText(
                    text: 'W9 form',
                    colour: themeBlue,
                    fs: 18,
                    fw: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 205.w,
                  child: PoppinText(
                    text: w9form ? 'Submitted' : 'Not Submitted',
                    colour: blackColors,
                    fs: 17,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
