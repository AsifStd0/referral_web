import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopColumnContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopReferralPartnerMainScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/done_screen_provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/test.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/DisktopDropDown.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';
import 'package:referral_admin_web/core/model/refferel_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

int isfiresttime = 0;

class DisktopLeadsDoneListContainer2 extends StatelessWidget {
  DisktopLeadsDoneListContainer2(
      {Key? key,
      required this.list,
      this.leademail,
      required this.list2,
      required this.model,
      required this.SpecificRefferel})
      : super(key: key);

  List<String> list;
  List<String> list2;
  final leademail;

  doneScreenProvider model;
  refferelModel SpecificRefferel;

  @override
  Widget build(BuildContext context) {
    TextEditingController? _TexteditingController;
    String reason = '';

    sendemail2(email, name, address, phone, company, DescriptionOfLoss, reason,
        leadEmail) async {
      log('this is print function');
      log("email send to this email ${email.toString()}");
      final serviceId = "service_lnluuzm";
      final templateId = "template_cmo9zcg";
      final userId = "PKpVr2NVyCvnT0ZD5";
      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
      // for (int i = 0; i < emails.length; i++)
      final response = await http.post(url,
          headers: {
            "origin": "http://localhost",
            "Content-Type": "application/json"
          },
          body: json.encode(
            {
              "service_id": serviceId,
              "template_id": templateId,
              "user_id": userId,
              "template_params": {
                // "from_email": fromEmail,\/email.text.toString()
                "to_email": "${email.toString()}", //
                "reply_to": "arbabshujaat8@gmail.com", //
                "main_heading": "Lead Not qualified",
                "user_name": "${name}", //

                "user_address": "${address}", //

                "user_phone": "${phone}", //

                "user_company": "${company}", //

                "user_email": "${leadEmail.toString()}", //

                "loss_description": "${DescriptionOfLoss}", //
                "reason": "$reason" //
              }
            },
          ));
    }

    String isNotQualifid = '';
    return Container(
      width: 1521.w,
      // height: 332.h,
      margin: EdgeInsets.only(bottom: 39.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31.r),
          color: whiteColors,
          border: Border.all(width: 0.5, color: Color(0xffD8D4D4))),
      padding:
          EdgeInsets.only(bottom: 20.h, left: 15.w, top: 17.h, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 190.h,
            margin: EdgeInsets.only(top: 12.h, right: 15.w),
            padding: EdgeInsets.only(left: 15.w, top: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), color: whiteColors),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DisktopColumnContainer(
                    w: 136,
                    heading1: 'Customer Name',
                    heading1Value: '${SpecificRefferel.customerName}',
                    heading2: 'Company',
                    heading2Value: '${SpecificRefferel.customerCompany}',
                    HeadingColor: lightGrey),
                DisktopColumnContainer(
                    w: 230,
                    heading1: 'Phone',
                    heading1Value: '${SpecificRefferel.customerPhone}',
                    heading2: 'Email',
                    heading2Value: '${SpecificRefferel.customerEmail}',
                    HeadingColor: lightGrey),
                DisktopColumnContainer(
                    w: 214,
                    heading1: 'Address',
                    heading1Value: '${SpecificRefferel.customerAddress}',
                    heading2: '',
                    heading2Value: '',
                    HeadingColor: lightGrey),
                DisktopColumnContainer(
                    w: 122,
                    heading1: 'Date',
                    heading1Value:
                        //'${DateFormat("MM/dd/yyyy").parse(SpecificRefferel.dateTime!)}',
                        '${DateFormat('MM/dd/yyyy').format(SpecificRefferel.dateTime!)}',
                    heading2: '',
                    heading2Value: '',
                    HeadingColor: lightGrey),
                Container(
                  width: 400.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinText(
                        text: 'Job number',
                        colour: lightGrey,
                        fs: 14,
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        // height: 40.h,
                        // width: 69.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: blackColors.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(2, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          onChanged: (val) {
                            SpecificRefferel.jobNumber = val;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(color: whiteColors)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(color: whiteColors)),
                            border: InputBorder.none,
                            hintText: "${SpecificRefferel.jobNumber}",
                            fillColor: whiteColors,
                            filled: true,
                            contentPadding:
                                EdgeInsets.only(left: 20.w, right: 10.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 40),
                  child: InkWell(
                      onHover: (value) {
                        print('copy job number');
                      },
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: "${SpecificRefferel.jobNumber}"));
                        Get.snackbar('', 'job number copied',
                            colorText: themeBlue,
                            maxWidth: 200,
                            backgroundColor: Colors.white);
                      },
                      child: Icon(Icons.copy)),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 550.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinText(
                        text: 'Invoiced amt',
                        colour: lightGrey,
                        fs: 14,
                      ),
                      SizedBox(height: 6.h),
                      SpecificRefferel.lead == 'Lost'
                          ? Container(
                              height: 47.h,
                              width: 169.w,
                              decoration: BoxDecoration(
                                color: lightGrey,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColors.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        2, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 50.h,
                              width: 189.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColors.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        2, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: _TexteditingController,
                                onChanged: (val) {
                                  SpecificRefferel.invoicedAmount =
                                      int.parse(val);
                                  print('this is onchange value ${val}');
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                      borderSide:
                                          BorderSide(color: whiteColors)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                      borderSide:
                                          BorderSide(color: whiteColors)),
                                  border: InputBorder.none,
                                  hintText:
                                      "\$ ${SpecificRefferel.invoicedAmount}",
                                  fillColor: whiteColors,
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.only(left: 20.w, right: 10.w),
                                ),
                              ),
                            ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinText(
                        text: 'Lead',
                        colour: lightGrey,
                        fs: 14,
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 50.h,
                        width: 159.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                            color: whiteColors,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 4.r,
                                offset: Offset(
                                  1.0,
                                  1.0,
                                ),
                              )
                            ]),
                        child: DropdownButtonFormField2(
                          dropdownFullScreen: false,
                          dropdownOverButton: false,
                          scrollbarAlwaysShow: true,
                          dropdownMaxHeight: 200.h,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          isExpanded: true,
                          hint: PoppinText(
                            text: SpecificRefferel.lead == ''
                                ? ''
                                : '${SpecificRefferel.lead}',
                            colour: blackColors,
                            fs: selectedItem == 'Not Qualified' ? 15 : 15,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black38,
                            size: 25,
                          ),
                          iconSize: 50,
                          buttonPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          dropdownDecoration: BoxDecoration(),
                          items: list2
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      // style: getTextStyle(
                                      //   Colors.black,
                                      //   14,
                                      //   FontWeight.w300,
                                      // ),
                                    ),
                                  ))
                              .toList(),
                          // validator: (value) {
                          //   if (value == null) {
                          //     return 'Please select gender.';
                          //   }
                          // },
                          onChanged: (value) {
                            SpecificRefferel.lead = value;
                            isNotQualifid = value!;
                          },
                          onSaved: (value) {
                            //SpecificRefferel.payment = value.toString();
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinText(
                        text: 'Payment',
                        colour: lightGrey,
                        fs: 14,
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 50.h,
                        width: 159.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                            color: whiteColors,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 4.r,
                                offset: Offset(
                                  1.0,
                                  1.0,
                                ),
                              )
                            ]),
                        child: DropdownButtonFormField2(
                          dropdownFullScreen: false,
                          dropdownOverButton: false,
                          scrollbarAlwaysShow: true,
                          dropdownMaxHeight: 200.h,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                              // borderSide: BorderSide(
                              //   color: Colors.black,
                              // ),
                            ),
                          ),
                          isExpanded: true,
                          hint: PoppinText(
                            text: SpecificRefferel.payment == ''
                                ? ''
                                : '${SpecificRefferel.payment}',
                            // widget.list == paidList ? selectedItem : LeadListSelectedItem,
                            colour: blackColors,
                            fs: selectedItem == 'Not Qualified' ? 15 : 15,
                          ),
                          // Text(
                          //   hintText,
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 14.sp,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black38,
                            size: 25,
                          ),
                          iconSize: 50,
                          // // buttonHeight: 35,
                          // buttonPadding:
                          //     const EdgeInsets.only(left: 10, right: 10),
                          dropdownDecoration: BoxDecoration(
                              // color: appBarColor,
                              // borderRadius: BorderRadius.circular(30),
                              ),
                          items: list
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: PoppinText(
                                      text: item,
                                      colour: blackColors,
                                      fs: 15,
                                    ),
                                    // Text(
                                    //   item,
                                    //   // style: getTextStyle(
                                    //   //   Colors.black,
                                    //   //   14,
                                    //   //   FontWeight.w300,
                                    //   // ),
                                    // ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            SpecificRefferel.payment = value;
                          },
                          onSaved: (value) {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: PoppinText(
                text: "Description of loss", colour: lightGrey, fs: 17),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: PoppinText(
                text: "${SpecificRefferel.descriptionOfLoss}",
                colour: blackColors,
                fs: 17),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  // SpecificRefferel.jobNumber = _TexteditingController;
                  var temp = _TexteditingController;
                  if (isNotQualifid == "Not Qualified") {
                    isNotQualifid = '';
                    print("going to show dailog");
                    dailogBox(
                        reason,
                        SpecificRefferel.invoicedAmount!,
                        SpecificRefferel.lead!,
                        SpecificRefferel.payment!,
                        SpecificRefferel.jobNumber!,
                        SpecificRefferel,
                        sendemail2,
                        SpecificRefferel.id);
                    model.GetRefferel();
                  } else {
                    try {
                      print(
                          "this is invoice amount fron textfeild ${SpecificRefferel.invoicedAmount}");
                      FirebaseFirestore.instance
                          .collection('Users')
                          .doc(Globalid)
                          .collection('Refferals')
                          .doc(SpecificRefferel.id)
                          .update({
                        "InvoicedAmount": SpecificRefferel.invoicedAmount,
                        "Lead": SpecificRefferel.lead,
                        "Payment": SpecificRefferel.payment,
                        "JobNumber": SpecificRefferel.jobNumber,
                      });
                    } catch (e) {}
                    model.GetRefferel();
                    Get.snackbar('', 'DataBase updated',
                        backgroundColor: Colors.white);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: themeBlue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 4.r,
                          offset: Offset(
                            2.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 50,
                  width: 150,
                  child: Center(
                      child: PoppinText(
                          text: "Update", colour: whiteColors, fs: 18)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///
  ///------>this is custom dailog box
  ///

  dailogBox(
      String reason,
      int invoiceamt,
      String lead,
      String payment,
      String jobNumber,
      refferelModel model,
      Future<Null> sendemail2(
          dynamic email,
          dynamic name,
          dynamic address,
          dynamic phone,
          dynamic company,
          dynamic DescriptionOfLoss,
          dynamic reason,
          dynamic leadEmail),
      id) async {
    Get.defaultDialog(
        title: "Alert Dialog",
        middleText: "Do you really want to edit?",
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 207.h,
            width: 480.w,
            //color: Colors.black12,
            child: TextFormField(
              onChanged: (val) {
                reason = val;
              },
              maxLines: 9,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: whiteColors)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: whiteColors)),
                border: InputBorder.none,
                hintText: "Why did the lead Not Qualify",
                fillColor: whiteColors,
                filled: true,
                contentPadding:
                    EdgeInsets.only(left: 5.w, right: 10.w, top: 20.h),
              ),
            ),
          ),
        ),
        backgroundColor: themeBlue,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        buttonColor: whiteColors,
        confirmTextColor: themeBlue,
        cancelTextColor: Colors.white,
        onConfirm: () async {
          log('invoiceamt $invoiceamt lead $lead payment $payment jobNumber $jobNumber');
          if (reason == '') {
            Get.snackbar('error',
                'please provide reason why you make not qualified the lead',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: themeBlue,
                colorText: whiteColors);
          } else {
            // print(
            //     'we need to send email to this referel partner ${widget.snap2!['Email']}');
            Get.back();

            try {
              FirebaseFirestore.instance
                  .collection('Users')
                  .doc(Globalid)
                  .collection('Refferals')
                  .doc(id)
                  .update({
                "InvoicedAmount": invoiceamt,
                "Lead": lead,
                "Payment": payment,
                "JobNumber": jobNumber,
              });
              //model.GetRefferel();
              ///------------->');
              await sendemail2(
                  leademail,
                  model.customerName,
                  model.customerAddress,
                  model.customerPhone,
                  model.customerCompany,
                  model.descriptionOfLoss,
                  reason,
                  model.customerEmail);
            } catch (e) {}
          }
        },
        onCancel: () {
          Get.back();
        });
  }
}

class CustomeDropDownTextField extends StatelessWidget {
  CustomeDropDownTextField(
      {required this.selectedValue,
      required this.itemList,
      required this.hintText,
      required this.onChange

      // this.selected
      });

  final Function(String)? onChange;

  final String? selectedValue;
//  PersonalDetailsProvider? selected;
  final List itemList;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          color: whiteColors,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 4.r,
              offset: Offset(
                1.0,
                1.0,
              ),
            )
          ]),
      child: DropdownButtonFormField2(
        dropdownFullScreen: false,
        dropdownOverButton: false,
        scrollbarAlwaysShow: true,
        dropdownMaxHeight: 200.h,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
            // borderSide: BorderSide(
            //   color: Colors.black,
            // ),
          ),
        ),

        isExpanded: true,
        hint: PoppinText(
          text: hintText,
          // widget.list == paidList ? selectedItem : LeadListSelectedItem,
          colour: blackColors,
          fs: selectedItem == 'Not \nQualified' ? 15 : 15,
        ),
        // Text(
        //   hintText,
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: 14.sp,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black38,
          size: 25,
        ),
        iconSize: 50,
        buttonHeight: 35,
        buttonPadding: const EdgeInsets.only(left: 10, right: 10),
        dropdownDecoration: BoxDecoration(
            // color: appBarColor,
            // borderRadius: BorderRadius.circular(30),
            ),
        items: itemList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    // style: getTextStyle(
                    //   Colors.black,
                    //   14,
                    //   FontWeight.w300,
                    // ),
                  ),
                ))
            .toList(),
        // validator: (value) {
        //   if (value == null) {
        //     return 'Please select gender.';
        //   }
        // },
        onChanged: (value) {},
        // onSaved: (value) {
        //   selectedValue = value.toString();
        // },
      ),
    );
  }
}
