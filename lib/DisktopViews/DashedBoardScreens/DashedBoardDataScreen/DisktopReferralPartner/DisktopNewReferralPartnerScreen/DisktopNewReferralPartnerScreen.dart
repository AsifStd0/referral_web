import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopNewReferralPartnerScreen/NewReferralPartner.dart';

String img = 'assets';

String female = '$img/female.png';
String female1 = '$img/female1.png';
String female2 = '$img/female2.png';
String female3 = '$img/female3.png';

String men1 = '$img/men1.png';
String men2 = '$img/men11.png';
String men3 = '$img/men12.png';

String newreferralPartner = '$img/newreferralPartner.png';

List avatarList = [
  female,
  female1,
  female2,
  female3,
  men1,
  men2,
  men3,
];

// class NewReferralPartnerScreen extends StatefulWidget {
//   const NewReferralPartnerScreen({super.key});

//   @override
//   State<NewReferralPartnerScreen> createState() => _NewReferralPartnerScreen();
// }

// class _NewReferralPartnerScreen extends State<NewReferralPartnerScreen> {
//   int selectedAvatarIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ListView(
//           children: [
//             Container(
//                 height: 62.h,
//                 width: width,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                           onTap: (() {
//                             Get.back();
//                           }),
//                           child: Icon(Icons.arrow_back_ios)),
//                       Text(
//                         "New Referral Partner",
//                         style: GoogleFonts.poppins(fontSize: 20.sp),
//                       ),
//                       Container(),
//                     ],
//                   ),
//                 )),
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Full Name",
//                       style: GoogleFonts.poppins(
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     TextField(
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         hintText: 'e.g John Doe',
//                         hintStyle: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFFD8D4D4),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         filled: true,
//                         contentPadding: EdgeInsets.all(16),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     Text(
//                       "Phone number",
//                       style: GoogleFonts.poppins(
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     TextField(
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         hintText: 'e.g +1-(800)980-7654',
//                         hintStyle: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFFD8D4D4),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         filled: true,
//                         contentPadding: EdgeInsets.all(16),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     Text(
//                       "Job title",
//                       style: GoogleFonts.poppins(
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     TextField(
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         hintText: 'House#12, Street#09, New York USA',
//                         hintStyle: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFFD8D4D4),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         filled: true,
//                         contentPadding: EdgeInsets.all(16),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     Text(
//                       "Email",
//                       style: GoogleFonts.poppins(
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     TextField(
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         hintText: 'johndoe@email.com',
//                         hintStyle: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFFD8D4D4),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         filled: true,
//                         contentPadding: EdgeInsets.all(16),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     Text(
//                       "Company",
//                       style: GoogleFonts.poppins(fontSize: 14.sp),
//                     ),
//                     SizedBox(height: 10.h),
//                     TextField(
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         hintText: 'Company...',
//                         hintStyle: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFFD8D4D4),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(
//                             width: 1.5,
//                             color: Color(0xFFD8D4D4),
//                             // style: BorderStyle.none,
//                           ),
//                         ),
//                         filled: true,
//                         contentPadding: EdgeInsets.all(16),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     Text(
//                       "Select Avatar",
//                       style: GoogleFonts.poppins(fontSize: 14.sp),
//                     ),
//                     SizedBox(height: 10.h),
//                     SizedBox(
//                       width: 1.sw,
//                       height: 70.h,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: avatarList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedAvatarIndex = index;
//                               });
//                             },
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 CircleAvatar(
//                                   radius: 40.r,
//                                   backgroundImage:
//                                       AssetImage(avatarList[index]),
//                                 ),
//                                 selectedAvatarIndex == index
//                                     ? Icon(
//                                         Icons.check,
//                                         color: Colors.white,
//                                         size: 50.sp,
//                                       )
//                                     : SizedBox(),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     InkWell(
//                       onTap: () {
//                         Get.off(() => NewReferralPartnerScreen());
//                       },
//                       child: Container(
//                         height: 66.h,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 3,
//                               offset:
//                                   Offset(0, 3), // changes position of shadow
//                             ),
//                           ],
//                           border: Border.all(color: Color(0xFF22408F)),
//                           borderRadius: BorderRadius.all(Radius.circular(20.r)),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "ANOTHER REFERRAL FORM",
//                             style: GoogleFonts.poppins(
//                                 color: Color(0xFF22408F), fontSize: 20.sp),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Container(
//                         height: 66.h,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF22408F),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 3,
//                               offset:
//                                   Offset(0, 3), // changes position of shadow
//                             ),
//                           ],
//                           borderRadius: BorderRadius.all(Radius.circular(20.r)),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "SUBMIT",
//                             style: GoogleFonts.poppins(
//                                 color: Colors.white, fontSize: 20.sp),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class NewReferralPartnerScreen extends StatefulWidget {
  const NewReferralPartnerScreen({super.key});

  @override
  State<NewReferralPartnerScreen> createState() =>
      _NewReferralPartnerScreenState();
}

class _NewReferralPartnerScreenState extends State<NewReferralPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? phone;
    final refferral = Provider.of<NewRefferalPartner>(context, listen: false);

    return Container(
      height: Get.height - 100,
      width: Get.width / 1.2,
      child: Form(
        key: _formKey,
        child: Container(
          // height: 200,
          // width: 500,
          child: ListView(
            children: [
              Container(
                  height: 62.h,
                  // width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Referral Partner",
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.firstName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your First Name ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'e.g John',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Last Name",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.lastName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Last Name ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'e.g Doe',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),

                      Text(
                        "Phone number",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      // TextFormField(
                      //   onChanged: (value) {
                      //     print('$value');
                      //   },
                      //   inputFormatters: [
                      //     FilteringTextInputFormatter.digitsOnly,
                      //     LengthLimitingTextInputFormatter(16),
                      //     CardNumberInputFormatter(),
                      //   ],
                      //   keyboardType: TextInputType.number,
                      //   cursorColor: Colors.grey.withOpacity(0.5),
                      //   decoration: InputDecoration(
                      //     prefixIcon: Padding(
                      //       padding: EdgeInsets.only(top: 5.h),
                      //       child: Icon(
                      //         Icons.credit_card,
                      //         size: 20.sp,
                      //         color: Colors.grey.withOpacity(0.5),
                      //       ),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       //cursor color
                      //       borderSide: BorderSide(
                      //           color: Colors.grey.withOpacity(0.5),
                      //           width: 1.0),
                      //     ),
                      //     hintText: "1234 5678 9012 3456",
                      //     hintStyle: TextStyle(
                      //       fontSize: 15.sp,
                      //       color: Colors.grey.withOpacity(0.5),
                      //     ),
                      //   ),
                      // ),

                      TextFormField(
                        onChanged: (val) {
                          //refferral.phoneNumber.text
                          phone = val;
                          log('$val');
                        },
                        inputFormatters: [
                          MaskTextInputFormatter(mask: "+1 ###-###-####")
                        ],
                        keyboardType: TextInputType.phone,
                        // controller: refferral.lastName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: '+1 ___-___-____',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Street Address",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.address,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'House#12, Street#09',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "City",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.city,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'e.g New York',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      Text(
                        "State",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.state,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your state';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'e.g Texas',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "ZIP",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: refferral.zip,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your zip';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'e.g 11102',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Job title",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.jobtittle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please job title ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Enter job title',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.email,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value) ==
                                  false) {
                            return 'Please enter a valid email ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'johndoe@email.com',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Company",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.company,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Company ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Company',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "W9 with Service Restoration?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              width: 24.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Consumer<NewRefferalPartner>(
                          builder: (context, signUp1, _) {
                        return Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  selectedTileColor: Color(0xFF22408F),
                                  title: Text(
                                    "Yes I completed & Submitted it",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  value: "Yes I completed & Submitted it",
                                  groupValue: signUp1.w9Form,
                                  onChanged: (value) {
                                    signUp1.updateW9(value.toString());
                                  },
                                ),
                              ),
                              Container(
                                // height: 30.h,
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "No I have not completed it",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  value: "No I have not completed it",
                                  groupValue: signUp1.w9Form,
                                  onChanged: (value) {
                                    signUp1.updateW9(value.toString());
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                      SizedBox(
                        height: 10.h,
                      ),

                      Text(
                        "Select Avatar",
                        style: GoogleFonts.poppins(fontSize: 14.sp),
                      ),
                      SizedBox(height: 20.h),

                      Consumer<NewRefferalPartner>(
                          builder: (context, refferal2, _) {
                        return SizedBox(
                          width: 1.sw,
                          height: 100.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: avatarList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  refferal2.setAvatar(avatarList[index], index);
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 60.r,
                                      backgroundImage:
                                          AssetImage(avatarList[index]),
                                    ),
                                    refferal2.selectedAvatarIndex == index
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 50.sp,
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }),

                      SizedBox(
                        height: 90.h,
                      ),
                      Consumer<NewRefferalPartner>(
                          builder: (context, signUp1, _) {
                        return GestureDetector(
                          onTap: () async {
                            String result =
                                phone!.replaceAll(RegExp('[^A-Za-z0-9+]'), '');
                            print('this is phone number $result');
                            refferral.phoneNumber.text = result;
                            if (signUp1.isLoading ==
                                false) if (_formKey.currentState!.validate()) {
                              String a =
                                  await signUp1.signupUser(context, false,true);
                              refferral.address.clear();
                              refferral.company.clear();
                              refferral.email.clear();
                              refferral.firstName.clear();
                              refferral.jobtittle.clear();
                              refferral.phoneNumber.clear();
                              refferral.lastName.clear();
                              refferral.state.clear();
                              refferral.city.clear();
                              refferral.zip.clear();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Color(0xFF22408F),
                                    content: Text(
                                        'Kindly Correct The Input Feilds')),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomContainer(
                                width: Get.width / 2,
                                height: 66.h,
                                boarderRadius: 20.sp,
                                color: Color(0xFF22408F),
                                widget: Center(
                                  child: refferral.isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(RefferalSubmittedScreen());
                      //   },
                      //   child: Container(
                      //     height: 66.h,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       color: Color(0xFF22408F),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.grey.withOpacity(0.2),
                      //           spreadRadius: 2,
                      //           blurRadius: 3,
                      //           offset:
                      //               Offset(0, 3), // changes position of shadow
                      //         ),
                      //       ],
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20.r)),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         "DONE",
                      //         style: GoogleFonts.poppins(
                      //             color: Colors.white, fontSize: 20.sp),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final double? height;
  final double width;
  final Widget? widget;
  final Color color;
  final double boarderRadius;
  final double? borderwidth;
  final Color? borderColor;
  CustomContainer({
    this.width = 20.0,
    this.height = 20.0,
    this.boarderRadius = 0,
    this.color = Colors.grey,
    this.widget,
    this.borderwidth,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            width: borderwidth ?? 0,
            color: borderColor ?? Colors.white,
          ),
          color: color,
          borderRadius: BorderRadius.circular(boarderRadius)),
      child: widget,
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
