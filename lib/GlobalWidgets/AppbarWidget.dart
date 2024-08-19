import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopNewReferralPartnerScreen/NewReferralPartner.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/DisktopSignInScreen.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/admin_model.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/GlobalWidgets/app_bar_widget_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopNewReferralPartnerScreen/DisktopNewReferralPartnerScreen.dart';
import '../DisktopViews/DisktopSignInScreen/signin_screen_provider.dart';

class AppbarWidget extends StatefulWidget {
  final isSuperAdmin;
  final email;
  const AppbarWidget({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
    this.email,
    this.isSuperAdmin,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  void initState() {
    sharedfunction();
    // TODO: implement initState
    super.initState();
  }

  bool? issuperadmin;
  sharedfunction() async {
    SharedPreferences? shared = await SharedPreferences.getInstance();
    setState(() {
      issuperadmin = shared.getBool('issuperadmin');
    });
  }

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    adminModel model = adminModel();
    final firebaseFireStore = FirebaseFirestore.instance;
    final refferral = Provider.of<NewRefferalPartner>(context, listen: false);
    String? phone;
    return ChangeNotifierProvider(
        create: (context) => appbarprovider(),
        child: Consumer<appbarprovider>(
            builder: (BuildContext context, model1, Widget? child) {
          return Container(
            width: widget.deviceWidth,
            height: widget.deviceHeight * 0.07,
            color: themeBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: whiteColors,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Image.asset(
                        "assets/images/logo1.png",
                        height: 60.h,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          //  Text('$isSuperAdmin'),
                          widget.isSuperAdmin ?? issuperadmin ?? false
                              ? Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(builder:
                                                    (context, setState) {
                                                  return AlertDialog(
                                                    scrollable: true,
                                                    content: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: Form(
                                                        key: _formKey,
                                                        child: Container(
                                                          height: 800.h,
                                                          width: 1050.w,
                                                          child: ListView(
                                                            children: [
                                                              Container(
                                                                  height: 62.h,
                                                                  // width: Get.width,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15.0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "New Referral Partner and Admin",
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            fontSize:
                                                                                20.sp,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.cancel,
                                                                              color: themeBlue,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10.0,
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "First Name",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      TextFormField(
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        controller:
                                                                            refferral.firstName,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter your First Name ';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        decoration:
                                                                            InputDecoration(
                                                                          fillColor:
                                                                              Colors.white,
                                                                          hintText:
                                                                              'e.g John',
                                                                          hintStyle:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xFFD8D4D4),
                                                                          ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(16),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        "Last Name",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),

                                                                      TextFormField(
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        controller:
                                                                            refferral.lastName,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter your Last Name ';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        decoration:
                                                                            InputDecoration(
                                                                          fillColor:
                                                                              Colors.white,
                                                                          hintText:
                                                                              'e.g Doe',
                                                                          hintStyle:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xFFD8D4D4),
                                                                          ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(16),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        "Password",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),

                                                                      TextFormField(
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        controller:
                                                                            refferral.password,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter Password ';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        decoration:
                                                                            InputDecoration(
                                                                          fillColor:
                                                                              Colors.white,
                                                                          hintText:
                                                                              'e.g 123456',
                                                                          hintStyle:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xFFD8D4D4),
                                                                          ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(16),
                                                                        ),
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),

                                                                      Text(
                                                                        "Phone number",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),

                                                                      TextFormField(
                                                                        onChanged:
                                                                            (val) {
                                                                          //refferral.phoneNumber.text
                                                                          phone =
                                                                              val;
                                                                          log('$val');
                                                                        },
                                                                        inputFormatters: [
                                                                          MaskTextInputFormatter(
                                                                              mask: "+1 ###-###-####")
                                                                        ],
                                                                        keyboardType:
                                                                            TextInputType.phone,
                                                                        // controller: refferral.lastName,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter phone number ';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        decoration:
                                                                            InputDecoration(
                                                                          fillColor:
                                                                              Colors.white,
                                                                          hintText:
                                                                              '+1 ___-___-____',
                                                                          hintStyle:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xFFD8D4D4),
                                                                          ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.5,
                                                                              color: Color(0xFFD8D4D4),
                                                                              // style: BorderStyle.none,
                                                                            ),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(16),
                                                                        ),
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        "Street Address",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      CustomTextFeild(
                                                                        refferral:
                                                                            refferral.address,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter your Address';
                                                                          }
                                                                          return null;
                                                                        },
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        "City",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      CustomTextFeild(
                                                                        refferral:
                                                                            refferral.city,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter your city';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        hintText:
                                                                            "e.g New York",
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),

                                                                      Text(
                                                                        "State",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      CustomTextFeild(
                                                                        refferral:
                                                                            refferral.state,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter your state';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        hintText:
                                                                            "e.g Texas",
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),

                                                                      Text(
                                                                        "ZIP",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      CustomTextFeild(
                                                                        keyboardtype:
                                                                            TextInputType.number,
                                                                        refferral:
                                                                            refferral.zip,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter your zip';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        hintText:
                                                                            "e.g 11102",
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        "Job title",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      CustomTextFeild(
                                                                        refferral:
                                                                            refferral.jobtittle,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter job title';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        hintText:
                                                                            "Please enter job title",
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        "Email",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),

                                                                      CustomTextFeild(
                                                                        refferral:
                                                                            refferral.email,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty ||
                                                                              RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value) == false) {
                                                                            return 'Please enter a valid email ';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        hintText:
                                                                            "johndoe@email.com",
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        "Company",
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      CustomTextFeild(
                                                                        refferral:
                                                                            refferral.company,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please enter your Company ';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        hintText:
                                                                            "company name",
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),

                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),

                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
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
                                                                      SizedBox(
                                                                          height:
                                                                              20.h),
                                                                      Consumer<NewRefferalPartner>(builder:
                                                                          (context,
                                                                              signUp1,
                                                                              _) {
                                                                        return Padding(
                                                                          padding:
                                                                              EdgeInsets.only(left: 20.w),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                color: Colors.transparent,
                                                                                child: RadioListTile(
                                                                                  contentPadding: EdgeInsets.all(0),
                                                                                  selectedTileColor: Color(0xFF22408F),
                                                                                  title: Text(
                                                                                    "Yes I completed & Submitted it",
                                                                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300),
                                                                                  ),
                                                                                  value: "Yes I completed & Submitted it",
                                                                                  groupValue: signUp1.w9Form,
                                                                                  onChanged: (value) {
                                                                                    signUp1.updateW9(value.toString());
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: RadioListTile(
                                                                                  contentPadding: EdgeInsets.all(0),
                                                                                  title: Text(
                                                                                    "No I have not completed it",
                                                                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300),
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
                                                                        height:
                                                                            10.h,
                                                                      ),

                                                                      Text(
                                                                        "Select Avatar",
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14.sp),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              20.h),

                                                                      Consumer<NewRefferalPartner>(builder:
                                                                          (context,
                                                                              refferal2,
                                                                              _) {
                                                                        return SizedBox(
                                                                          width:
                                                                              1.sw,
                                                                          height:
                                                                              100.h,
                                                                          child:
                                                                              ListView.builder(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            itemCount:
                                                                                avatarList.length,
                                                                            itemBuilder:
                                                                                (BuildContext context, int index) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  refferal2.setAvatar(avatarList[index], index);
                                                                                },
                                                                                child: Stack(
                                                                                  alignment: Alignment.center,
                                                                                  children: [
                                                                                    CircleAvatar(
                                                                                      radius: 60.r,
                                                                                      backgroundImage: AssetImage(avatarList[index]),
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
                                                                        height:
                                                                            90.h,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                              'view only'),
                                                                          Switch(
                                                                              value: model1.switchvalue,
                                                                              onChanged: (val) {
                                                                                setState(() {
                                                                                  model1.changeSwitchValue(val);
                                                                                  model.isviewonly = model1.switchvalue;
                                                                                });
                                                                              })
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            40.h,
                                                                      ),
                                                                      Consumer<NewRefferalPartner>(builder:
                                                                          (context,
                                                                              signUp1,
                                                                              _) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            if (signUp1.isLoading ==
                                                                                false) if (_formKey.currentState!.validate()) {
                                                                              String result = phone!.replaceAll(RegExp('[^A-Za-z0-9+]'), '');
                                                                              print('this is phone number $result');
                                                                              refferral.phoneNumber.text = result;
                                                                              // model.password=refferral
                                                                              refferral.AdminModel.isviewonly = model1.switchvalue;
                                                                              refferral.AdminModel.email = refferral.email.text.toLowerCase();
                                                                              refferral.AdminModel.password = refferral.password.text.toLowerCase();
                                                                              refferral.AdminModel.issuperAdmin = false;
                                                                              refferral.AdminModel.name = refferral.firstName.text + ' ' + refferral.lastName.text;
                                                                              String a = await signUp1.signupUser(context, true,false);

                                                                              refferral.address.clear();
                                                                              refferral.company.clear();
                                                                              refferral.email.clear();
                                                                              refferral.firstName.clear();
                                                                              refferral.password.clear();
                                                                              refferral.jobtittle.clear();
                                                                              refferral.phoneNumber.clear();
                                                                              refferral.lastName.clear();
                                                                              refferral.state.clear();
                                                                              refferral.city.clear();
                                                                              refferral.zip.clear();
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                const SnackBar(backgroundColor: Color(0xFF22408F), content: Text('Kindly Correct The Input Feilds')),
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
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
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      //  Form(
                                                      //   key: _formKey,
                                                      //   child: Column(
                                                      //     children: <Widget>[
                                                      //       Container(
                                                      //         // color: Colors.amber,
                                                      //         child: Row(
                                                      //           mainAxisAlignment:
                                                      //               MainAxisAlignment
                                                      //                   .spaceBetween,
                                                      //           children: [
                                                      //             Text(
                                                      //               'Add new admin',
                                                      //               style: GoogleFonts.poppins(
                                                      //                   fontSize:
                                                      //                       widget.deviceWidth *
                                                      //                           0.020,
                                                      //                   color:
                                                      //                       themeBlue),
                                                      //             ),
                                                      //             Padding(
                                                      //               padding: const EdgeInsets
                                                      //                       .only(
                                                      //                   left:
                                                      //                       0),
                                                      //               child: GestureDetector(
                                                      //                   onTap: () {
                                                      //                     Get.back();
                                                      //                   },
                                                      //                   child: Icon(Icons.close)),
                                                      //             )
                                                      //           ],
                                                      //         ),
                                                      //       ),

                                                      //       SizedBox(
                                                      //         height: 40.h,
                                                      //       ),
                                                      //       InputTextContainer(
                                                      //         change: (email) {
                                                      //           model.email =
                                                      //               email;
                                                      //         },
                                                      //         // controller: fullNameControllar,
                                                      //         valid: (value) {
                                                      //           if (value ==
                                                      //                   null ||
                                                      //               value
                                                      //                   .isEmpty ||
                                                      //               RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                      //                       .hasMatch(value) ==
                                                      //                   false) {
                                                      //             return 'Please enter a valid email ';
                                                      //           }
                                                      //           return null;
                                                      //         },

                                                      //         hintText: 'Email',
                                                      //         icon: Icons.email,
                                                      //         iconColor:
                                                      //             themeBlue,
                                                      //         iconBackColor: Colors
                                                      //             .transparent,
                                                      //       ),
                                                      //       // TextFormField(
                                                      //       //   decoration: InputDecoration(
                                                      //       //     labelText: 'Email',
                                                      //       //     icon: Icon(Icons.email),
                                                      //       //   ),
                                                      //       // ),
                                                      //       SizedBox(
                                                      //         height: 40.h,
                                                      //       ),
                                                      //       InputTextContainer(
                                                      //         change:
                                                      //             (password) {
                                                      //           model.password =
                                                      //               password;
                                                      //         },
                                                      //         // controller: passwordControllar,
                                                      //         valid:
                                                      //             (password) {
                                                      //           if (password!
                                                      //               .isEmpty) {
                                                      //             return "please enter password";
                                                      //           } else if (password
                                                      //                   .length <
                                                      //               6) {
                                                      //             return "password must be 6 character";
                                                      //           } else {
                                                      //             return null;
                                                      //           }
                                                      //         },
                                                      //         hintText:
                                                      //             'Password',
                                                      //         icon: Icons
                                                      //             .lock_person_sharp,
                                                      //         iconColor:
                                                      //             themeBlue,
                                                      //         iconBackColor: Colors
                                                      //             .transparent,
                                                      //       ),

                                                      //       Row(
                                                      //         children: [
                                                      //           Text(
                                                      //               'view only'),
                                                      //           Switch(
                                                      //               value: model1
                                                      //                   .switchvalue,
                                                      //               onChanged:
                                                      //                   (val) {
                                                      //                 setState(
                                                      //                     () {
                                                      //                   model1.changeSwitchValue(
                                                      //                       val);
                                                      //                   model.isviewonly =
                                                      //                       model1.switchvalue;
                                                      //                 });
                                                      //               })
                                                      //         ],
                                                      //       )
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ),
                                                    // actions: [
                                                    //   Center(
                                                    //     child: TextButton(
                                                    //         child:
                                                    //             CustomContainer(
                                                    //           width: 382.w,
                                                    //           height: 66.h,
                                                    //           boarderRadius:
                                                    //               20.sp,
                                                    //           color: themeBlue,
                                                    //           widget: Center(
                                                    //             child: Text(
                                                    //               "Add Admin",
                                                    //               style:
                                                    //                   TextStyle(
                                                    //                 color: Colors
                                                    //                     .white,
                                                    //                 fontSize:
                                                    //                     20.sp,
                                                    //               ),
                                                    //             ),
                                                    //           ),
                                                    //         ),
                                                    //         onPressed: () {
                                                    //           if (_formKey
                                                    //               .currentState!
                                                    //               .validate()) {
                                                    //             model.issuperAdmin =
                                                    //                 false;
                                                    //             print(
                                                    //                 '${model.email} ${model.password} ${model.issuperAdmin} ${model.isviewonly}');
                                                    //             firebaseFireStore
                                                    //                 .collection(
                                                    //                     'admin')
                                                    //                 .add(model
                                                    //                     .toJson());
                                                    //             model1
                                                    //                 .getallAdmin();
                                                    //             Get.snackbar('',
                                                    //                 'Admin is added',
                                                    //                 backgroundColor:
                                                    //                     themeBlue,
                                                    //                 colorText:
                                                    //                     Colors
                                                    //                         .white,
                                                    //                 snackPosition:
                                                    //                     SnackPosition
                                                    //                         .BOTTOM,
                                                    //                 margin: EdgeInsets
                                                    //                     .all(
                                                    //                         40));
                                                    //             Navigator.of(
                                                    //                     context)
                                                    //                 .pop();
                                                    //           } else {
                                                    //             print(
                                                    //                 'form is not validated');
                                                    //           }
                                                    //           // your code
                                                    //         }),
                                                    //   )
                                                    // ],
                                                  );
                                                });
                                              });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              'Add Admin',
                                              style: TextStyle(
                                                  color: themeBlue,
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          // model1.getallAdmin();
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(builder:
                                                    (context, setState) {
                                                  return AlertDialog(
                                                    scrollable: true,
                                                    title: Center(
                                                        child: Text(
                                                            'Current admin')),
                                                    content: Column(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5),
                                                          child: Container(
                                                            height: 400.h,
                                                            width: 400.w,
                                                            child: ListView
                                                                .builder(
                                                              shrinkWrap: true,
                                                              itemCount: model1
                                                                  .list.length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return model1
                                                                        .list[
                                                                            index]
                                                                        .issuperAdmin!
                                                                    ? SizedBox
                                                                        .shrink()
                                                                    : Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                10,
                                                                            bottom:
                                                                                10),
                                                                        child:
                                                                            Container(
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: themeBlue, width: 2),
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                          // height:
                                                                          //     55.h,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'Name: ',
                                                                                          style: TextStyle(color: themeBlue, fontSize: 17.sp, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        Text(
                                                                                          '${model1.list[index].name}',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'Email: ',
                                                                                          style: TextStyle(color: themeBlue, fontSize: 17.sp, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 240.w,
                                                                                          child: Text(
                                                                                            '${model1.list[index].email}',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'Password: ',
                                                                                          style: TextStyle(color: themeBlue, fontSize: 17.sp, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        Text(
                                                                                          '${model1.list[index].password}',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    Get.back();
                                                                                    customDialog(context, model1, index);
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.delete,
                                                                                    color: Colors.red,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      Center(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child:
                                                              CustomContainer(
                                                            width: 382.w,
                                                            height: 66.h,
                                                            boarderRadius:
                                                                20.sp,
                                                            color: themeBlue,
                                                            widget: Center(
                                                              child: Text(
                                                                "ok",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      25.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                });
                                              });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              'View Admin',
                                              style: TextStyle(
                                                  color: themeBlue,
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ))
                                  ],
                                )
                              : SizedBox(),
                          // Text('$email'),
                          // Text('$isSuperAdmin'),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisktopSignInScreen()));
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setBool("login", false);
                        },
                        child: Icon(
                          Icons.logout,
                          size: 30.sp,
                          color: whiteColors,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }

  Future<dynamic> customDialog(
      BuildContext context, appbarprovider model1, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              scrollable: true,
              content: Container(
                height: 100.h,
                width: 400.w,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(Icons.cancel,
                                color: Colors.red, size: 30.sp))),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                        'Are you sure want to delete ${model1.list[index].name}?'),
                  ],
                ),
              ),
              actions: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      try {
                        firebaseFireStore
                            .collection('admin')
                            .doc(model1.list[index].id)
                            .delete();
                      } catch (e) {
                        print('eeee$e');
                      }
                      setState(() {
                        model1.list.removeAt(index);
                      });
                      Get.snackbar('', 'Admin deleted',
                          colorText: Colors.white,
                          backgroundColor: themeBlue,
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: CustomContainer(
                      width: 382.w,
                      height: 50.h,
                      boarderRadius: 20.sp,
                      color: themeBlue,
                      widget: Center(
                        child: Text(
                          "ok",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          });
        });
  }
}

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    Key? key,
    required this.refferral,
    this.hintText,
    this.keyboardtype,
    required this.validator,
  }) : super(key: key);

  final refferral;
  final hintText;
  final keyboardtype;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype ?? TextInputType.text,
      controller: refferral,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
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
    );
  }
}

class SinginAppbarWidget extends StatelessWidget {
  const SinginAppbarWidget({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      height: deviceHeight * 0.07,
      color: themeBlue,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70.w,
              decoration: BoxDecoration(
                color: whiteColors,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Image.asset(
                  "assets/images/logo1.png",
                  height: 60.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
