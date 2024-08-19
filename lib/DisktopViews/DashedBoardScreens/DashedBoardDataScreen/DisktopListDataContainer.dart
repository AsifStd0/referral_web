import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopColumnContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import '../../../GlobalWidgets/Colors/Colours.dart';
import '../../../MobileViews/Mobile_res/widgets/DropDown.dart';
import '../../../MobileViews/Mobile_res/widgets/PoppinText.dart';
import 'over_view_screen/over_view_provider.dart';

int firsttime = 0;

class DisktopListDataContainer extends StatefulWidget {
  final getdata;
  final index;
  DocumentSnapshot? snap1;
  DocumentSnapshot? snap2;
  int? refferelLength;
  final endtDate;
  final startDate;
  final isviewonly;
  double? aveJob;
  DisktopListDataContainer(
      {Key? key,
      this.startDate,
      this.isviewonly,
      this.index,
      this.endtDate,
      required this.deviceWidth,
      this.getdata,
      required this.snap1,
      this.snap2,
      this.aveJob,
      this.refferelLength})
      : super(key: key);

  final double deviceWidth;

  @override
  State<DisktopListDataContainer> createState() =>
      _DisktopListDataContainerState();
}

class _DisktopListDataContainerState extends State<DisktopListDataContainer> {
  // Map<String, dynamic> snap1 = {};

  @override
  bool isbool = false;
  int i = 0;
  Widget build(BuildContext context) {
    var model = Provider.of<OverViewProvider>(context, listen: false);
    DateTime date2 = widget.snap1!['DateTime'].toDate();

    String jobNumber = widget.snap1!['JobNumber'];

    // if (widget.startDate != null) {
    //   if (date2.compareTo(widget.startDate) > 0 &&
    //       date2.compareTo(widget.endtDate) < 0) {
    //     model.rangList.add({
    //       "Refferer fname":
    //           "${widget.snap2!['FirstName']} ${widget.snap2!['LastName']}",
    //       'phone': "${widget.snap2!['Phone']}",
    //       'address': "${widget.snap2!["Address"]}",
    //       'w9form': "${widget.snap2!["W9Form"]}",
    //       'Email': "${widget.snap2!["Email"]}",
    //       'CompanyName': "${widget.snap2!["CompanyName"]}",
    //       'referrals': widget.refferelLength,
    //       'CustomerName': "${widget.snap1!["CustomerName"]}",
    //       'CustomerPhone': "${widget.snap1!["CustomerPhone"]}",
    //       'CustomerAddress': "${widget.snap1!["CustomerAddress"]}",
    //       'DateTime': '${widget.snap1!["DateTime"].toDate()}',
    //       'JobNumber': "${widget.snap1!["JobNumber"]}",
    //       'CustomerCompany': "${widget.snap1!["CustomerCompany"]}",
    //       'CustomerEmail': "${widget.snap1!["CustomerEmail"]}",
    //       'InvoicedAmount': "${widget.snap1!["InvoicedAmount"] ?? 0}",
    //       'Lead': "${widget.snap1!["Lead"]}",
    //       'Payment': "${widget.snap1!["Payment"]}",
    //       'DescriptionOfLoss': "${widget.snap1!["DescriptionOfLoss"]}",
    //     });
    //     log("compare is matched");
    //     log("compare is matched%%%%%%%%%%%%%%%%%%%");
    //   } else {
    //     isbool = true;
    //     i++;
    //     log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    //   }
    // }

    // print('$date1');
    int invoiceamt = widget.snap1!['InvoicedAmount'];
    // int lostamount = widget.snap1!['lastlostamount'];
    String lead = widget.snap1!['Lead'];
    String isShowPopup = '';
    String payment = widget.snap1!['Payment'];
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

    return widget.startDate != null
        ? date2.compareTo(widget.startDate) > 0 &&
                date2.compareTo(widget.endtDate) < 0
            ? Container(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: 18.h,
                          right: 20.w,
                          left: 0.w,
                        ),
                        child: Container(
                          width: 1430.w,
                          margin: EdgeInsets.only(bottom: 39.h),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: blackColors.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(31.r),
                            color: whiteColors,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 20.h, left: 15.w, top: 17.h, right: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 18.h, right: 25.w),
                                  padding:
                                      EdgeInsets.only(left: 24.w, top: 19.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: ContainerBackground),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DisktopColumnContainer(
                                        w: 155,
                                        heading1: 'Referrer Name ',
                                        heading1Value:
                                            '${widget.snap2!['FirstName']} ${widget.snap2!['LastName']}',
                                        heading2: 'W9 Form',
                                        heading2Value: widget.snap2!['W9Form']
                                            ? "Submitted"
                                            : "Not Submitted",
                                      ),
                                      DisktopColumnContainer(
                                        w: 219,
                                        heading1: "Phone",
                                        heading1Value:
                                            "${widget.snap2!['Phone']}",
                                        heading2: "Email",
                                        heading2Value:
                                            "${widget.snap2!['Email']}",
                                      ),
                                      DisktopColumnContainer(
                                        w: 327,
                                        heading1: "Address",
                                        heading1Value:
                                            "${widget.snap2!['Address']}",
                                        heading2: "Company",
                                        heading2Value:
                                            "${widget.snap2!['CompanyName']}",
                                      ),
                                      DisktopColumnContainer(
                                        w: 200,
                                        heading1: "Avg. Job Value",
                                        heading1Value:
                                            "\$${widget.aveJob!.toStringAsFixed(0)}",
                                        heading2: "Referrals",
                                        heading2Value:
                                            "${widget.refferelLength}",
                                      ),
                                    ],
                                  )),
                              Container(
                                height: 165.h,
                                margin: EdgeInsets.only(top: 18.h, right: 25.w),
                                padding: EdgeInsets.only(left: 24.w, top: 19.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color:
                                        //Colors.amber
                                        whiteColors),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DisktopColumnContainer(
                                        w: 206,
                                        heading1: 'Customer Name',
                                        heading1Value:
                                            '${widget.snap1!['CustomerName']}',
                                        heading2: 'Company',
                                        heading2Value:
                                            '${widget.snap1!['CustomerCompany']}',
                                        HeadingColor: lightGrey),
                                    Container(
                                      child: DisktopColumnContainer(
                                          w: 200,
                                          heading1: 'Phone',
                                          heading1Value:
                                              '${widget.snap1!['CustomerPhone']}',
                                          heading2: 'Email',
                                          heading2Value:
                                              '${widget.snap1!['CustomerEmail']}',
                                          HeadingColor: lightGrey),
                                    ),
                                    DisktopColumnContainer(
                                        w: 300,
                                        heading1: 'Address',
                                        heading1Value:
                                            '${widget.snap1!['CustomerAddress']}',
                                        heading2: '',
                                        heading2Value: '',
                                        HeadingColor: lightGrey),
                                    Container(
                                      child: DisktopColumnContainer(
                                          w: 182,
                                          heading1: 'Date',
                                          heading1Value:
                                              '${DateFormat('MM/dd/yyyy').format(date2)}',
                                          heading2: '',
                                          heading2Value: '',
                                          HeadingColor: lightGrey),
                                    ),
                                    Container(
                                      width: 400.w,
                                      height: 90.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: blackColors
                                                        .withOpacity(0.1),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: Offset(2, 3)),
                                              ],
                                            ),
                                            child: TextFormField(
                                              onChanged: (val) {
                                                jobNumber = val;
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.r),
                                                        borderSide: BorderSide(
                                                            color:
                                                                whiteColors)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.r),
                                                        borderSide: BorderSide(
                                                            color:
                                                                whiteColors)),
                                                border: InputBorder.none,
                                                hintText:
                                                    "${widget.snap1!['JobNumber']}",
                                                fillColor: whiteColors,
                                                filled: true,
                                                contentPadding: EdgeInsets.only(
                                                    left: 20.w, right: 10.w),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 40),
                                      child: InkWell(
                                          onHover: (value) {
                                            print('copy job number');
                                          },
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text:
                                                    "${widget.snap1!['JobNumber']}"));
                                            Get.snackbar(
                                                '', 'job number copied',
                                                colorText: themeBlue,
                                                maxWidth: 200,
                                                backgroundColor: Colors.white);
                                          },
                                          child: Icon(Icons.copy)),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30.w),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    // color: Colors.amber,
                                    height: 70,
                                    width: 500,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Container(
                                          //width: 100.w,
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 209.w,
                                            // color: Colors.black,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                PoppinText(
                                                  text: 'Invoiced amt',
                                                  colour: lightGrey,
                                                  fs: 14,
                                                ),
                                                SizedBox(height: 6.h),
                                                widget.snap1!['Lead'] == 'Lost'
                                                    ? Container(
                                                        height: 47.h,
                                                        width: 169.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: lightGrey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: blackColors
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 1,
                                                              offset: Offset(2,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: blackColors
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 1,
                                                              offset: Offset(2,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 15),
                                                              child: Text('\$'),
                                                            ),
                                                            Container(
                                                              height: 47.h,
                                                              width: 169.w,
                                                              child:
                                                                  TextFormField(
                                                                onChanged:
                                                                    (val) {
                                                                  invoiceamt =
                                                                      int.parse(
                                                                          val);
                                                                },
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                inputFormatters: <TextInputFormatter>[
                                                                  // for below version 2 use this
                                                                  FilteringTextInputFormatter
                                                                      .allow(RegExp(
                                                                          r'[0-9]')),
// for version 2 and greater youcan also use this
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(15
                                                                              .r),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: whiteColors)),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(15
                                                                              .r),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: whiteColors)),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "${widget.snap1!['InvoicedAmount']}",
                                                                  fillColor:
                                                                      whiteColors,
                                                                  filled: true,
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left: 5
                                                                              .w,
                                                                          right:
                                                                              10.w),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              PoppinText(
                                                text: 'Lead',
                                                colour: lightGrey,
                                                fs: 14,
                                              ),
                                              SizedBox(height: 6.h),
                                              Container(
                                                //height: 50.h,
                                                width: 159.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35.r),
                                                    color: whiteColors,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
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
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14.sp,
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          BorderSide.none,
                                                      // borderSide: BorderSide(
                                                      //   color: Colors.black,
                                                      // ),
                                                    ),
                                                  ),
                                                  isExpanded: true,
                                                  hint: PoppinText(
                                                    text: widget.snap1![
                                                                'Lead'] ==
                                                            ''
                                                        ? ''
                                                        : '${widget.snap1!['Lead']}',
                                                    // widget.list == paidList ? selectedItem : LeadListSelectedItem,
                                                    colour: blackColors,
                                                    fs: selectedItem ==
                                                            'Not Qualified'
                                                        ? 15
                                                        : 15,
                                                  ),
                                                  icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black38,
                                                    size: 25,
                                                  ),
                                                  iconSize: 50,
                                                  dropdownDecoration:
                                                      BoxDecoration(),
                                                  items: leadsList
                                                      .map(
                                                        (item) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                          value: item,
                                                          child: PoppinText(
                                                            text: item,
                                                            fs: 15,
                                                            colour:
                                                                Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                  onChanged: (value) {
                                                    lead = value!;
                                                    isShowPopup = value;
                                                  },
                                                  onSaved: (value) {
                                                    //SpecificRefferel.payment = value.toString();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              PoppinText(
                                                text: 'Payment',
                                                colour: lightGrey,
                                                fs: 14,
                                              ),
                                              SizedBox(height: 6.h),
                                              Container(
                                                // height: 50.h,
                                                width: 159.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35.r),
                                                    color: whiteColors,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
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
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14.sp,
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          BorderSide.none,
                                                      // borderSide: BorderSide(
                                                      //   color: Colors.black,
                                                      // ),
                                                    ),
                                                  ),
                                                  isExpanded: true,
                                                  hint: PoppinText(
                                                    text: widget.snap1![
                                                                'Payment'] ==
                                                            ''
                                                        ? ''
                                                        : '${widget.snap1!['Payment']}',
                                                    // widget.list == paidList ? selectedItem : LeadListSelectedItem,
                                                    colour: blackColors,
                                                    fs: selectedItem ==
                                                            'Not \nQualified'
                                                        ? 15
                                                        : 15,
                                                  ),
                                                  icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black38,
                                                    size: 25,
                                                  ),
                                                  iconSize: 50,
                                                  // buttonHeight: 35,
                                                  // buttonPadding: const EdgeInsets.only(
                                                  //     left: 10, right: 10),
                                                  dropdownDecoration: BoxDecoration(
                                                      // color: appBarColor,
                                                      // borderRadius: BorderRadius.circular(30),
                                                      ),
                                                  items: paidList
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: PoppinText(
                                                              text: item,
                                                              fs: 15,
                                                              colour:
                                                                  Colors.black,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  // validator: (value) {
                                                  //   if (value == null) {
                                                  //     return 'Please select gender.';
                                                  //   }
                                                  // },
                                                  onChanged: (value) {
                                                    payment = value!;
                                                  },
                                                  onSaved: (value) {
                                                    //SpecificRefferel.payment = value.toString();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.w,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: PoppinText(
                                    text: "Description of loss",
                                    colour: lightGrey,
                                    fs: 17),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: PoppinText(
                                    //DescriptionOfLoss
                                    text:
                                        "${widget.snap1!['DescriptionOfLoss']}",
                                    colour: blackColors,
                                    fs: 17),
                              ),
                              widget.isviewonly
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: themeBlue.withOpacity(.1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  blurRadius: 5,
                                                  spreadRadius: 4.r,
                                                  offset: Offset(
                                                    2.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          height: 50,
                                          width: 150,
                                          child: Center(
                                              child: PoppinText(
                                                  text: "Update",
                                                  colour: whiteColors,
                                                  fs: 18)),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (isShowPopup ==
                                                'Not Qualified') {
                                              dailogBox(
                                                  reason,
                                                  invoiceamt,
                                                  lead,
                                                  payment,
                                                  jobNumber,
                                                  model,
                                                  sendemail2);
                                            } else {
                                              print("this is  test $firsttime");
                                              try {
                                                FirebaseFirestore.instance
                                                    .collection('Users')
                                                    .doc(widget.snap2!.id)
                                                    .collection('Refferals')
                                                    .doc(widget.snap1!.id)
                                                    .update({
                                                  "InvoicedAmount": invoiceamt,
                                                  "Lead": lead,
                                                  "Payment": payment,
                                                  "JobNumber": jobNumber,
                                                });
                                                model.GetRefferel();
                                                Get.snackbar(
                                                    '', 'DataBase updated',
                                                    colorText: Colors.white,
                                                    backgroundColor: themeBlue,
                                                    snackPosition:
                                                        SnackPosition.BOTTOM);
                                              } catch (e) {}
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: themeBlue,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    blurRadius: 5,
                                                    spreadRadius: 4.r,
                                                    offset: Offset(
                                                      2.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            height: 50,
                                            width: 150,
                                            child: Center(
                                                child: PoppinText(
                                                    text: "Update",
                                                    colour: whiteColors,
                                                    fs: 18)),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )),
                  ],
                ),
              )
            : Container(child: i == 0 ? Text('') : Text(''))
        : Container(
            child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: 18.h,
                    right: 20.w,
                    left: 0.w,
                  ),
                  child:
                      // DisktopLeadsDoneListContainer(
                      //   list: paidList,
                      //   list2: leadsList,
                      // ),
                      Container(
                    width: 1430.w,
                    // height: 332.h,
                    margin: EdgeInsets.only(bottom: 39.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: blackColors.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(31.r),
                      color: whiteColors,
                      //color: Colors.green,
                      //border: Border.all(width: 0.5, color: themeBlue)
                    ),
                    padding: EdgeInsets.only(
                        bottom: 20.h, left: 15.w, top: 17.h, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            // width: deviceWidth * 0.6,
                            // height: 168.h,
                            margin: EdgeInsets.only(top: 18.h, right: 25.w),
                            padding: EdgeInsets.only(left: 24.w, top: 19.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: ContainerBackground),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DisktopColumnContainer(
                                  w: 155,
                                  heading1: 'Referrer Name',
                                  heading1Value:
                                      '${widget.snap2!['FirstName']}',
                                  heading2: 'W9 Form',
                                  heading2Value: widget.snap2!['W9Form']
                                      ? "Submitted"
                                      : "Not Submitted",
                                ),
                                DisktopColumnContainer(
                                  w: 219,
                                  heading1: "Phone",
                                  heading1Value: "${widget.snap2!['Phone']}",
                                  heading2: "Email",
                                  heading2Value: "${widget.snap2!['Email']}",
                                ),
                                DisktopColumnContainer(
                                  w: 327,
                                  heading1: "Address",
                                  heading1Value: "${widget.snap2!['Address']}",
                                  heading2: "Company",
                                  heading2Value:
                                      "${widget.snap2!['CompanyName']}",
                                ),
                                DisktopColumnContainer(
                                  w: 200,
                                  heading1: "Avg. Job Value",
                                  heading1Value:
                                      "\$${widget.aveJob!.toStringAsFixed(0)}",
                                  heading2: "Referrals",
                                  heading2Value: "${widget.refferelLength}",
                                ),
                              ],
                            )),
                        Container(
                          height: 165.h,
                          margin: EdgeInsets.only(top: 18.h, right: 25.w),
                          padding: EdgeInsets.only(left: 24.w, top: 19.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: whiteColors),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DisktopColumnContainer(
                                  w: 206,
                                  heading1: 'Customer Name',
                                  heading1Value:
                                      '${widget.snap1!['CustomerName']}',
                                  heading2: 'Company',
                                  heading2Value:
                                      '${widget.snap1!['CustomerCompany']}',
                                  HeadingColor: lightGrey),
                              DisktopColumnContainer(
                                  w: 200,
                                  //CustomerAddress
                                  heading1: 'Phone',
                                  heading1Value:
                                      '${widget.snap1!['CustomerPhone']}',
                                  heading2: 'Email',
                                  heading2Value:
                                      '${widget.snap1!['CustomerEmail']}',
                                  HeadingColor: lightGrey),
                              DisktopColumnContainer(
                                  w: 300,
                                  heading1: 'Address',
                                  heading1Value:
                                      '${widget.snap1!['CustomerAddress']}',
                                  heading2: '',
                                  heading2Value: '',
                                  HeadingColor: lightGrey),
                              Container(
                                child: DisktopColumnContainer(
                                    w: 182,
                                    heading1: 'Date',
                                    heading1Value:
                                        '${DateFormat('MM/dd/yyyy').format(date2)}',
                                    heading2: '',
                                    heading2Value: '',
                                    HeadingColor: lightGrey),
                              ),
                              Container(
                                width: 380.w,
                                height: 94.h,
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
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  blackColors.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(2, 3)),
                                        ],
                                      ),
                                      child: TextFormField(
                                        onChanged: (val) {
                                          jobNumber = val;
                                        },
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              borderSide: BorderSide(
                                                  color: whiteColors)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              borderSide: BorderSide(
                                                  color: whiteColors)),
                                          border: InputBorder.none,
                                          hintText:
                                              "${widget.snap1!['JobNumber']}",
                                          fillColor: whiteColors,
                                          filled: true,
                                          contentPadding: EdgeInsets.only(
                                              left: 20.w, right: 10.w),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 30),
                                child: InkWell(
                                    onHover: (value) {
                                      print('copy job number');
                                    },
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                          text:
                                              "${widget.snap1!['JobNumber']}"));
                                      Get.snackbar('', 'job number copied',
                                          colorText: themeBlue,
                                          maxWidth: 180,
                                          backgroundColor: Colors.white);
                                    },
                                    child: Icon(Icons.copy)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              // color: Colors.amber,
                              height: 70,
                              width: 500,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Container(
                                    //width: 100.w,
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 209.w,
                                      // color: Colors.black,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PoppinText(
                                            text: 'Invoiced amt',
                                            colour: lightGrey,
                                            fs: 14,
                                          ),
                                          SizedBox(height: 5.h),
                                          widget.snap1!['Lead'] == 'Lost'
                                              ? Container(
                                                  height: 47.h,
                                                  width: 169.w,
                                                  decoration: BoxDecoration(
                                                    color: lightGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: blackColors
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: Offset(2,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: blackColors
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: Offset(2,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15),
                                                        child: Text('\$'),
                                                      ),
                                                      Container(
                                                        height: 57.h,
                                                        width: 159.w,
                                                        child: TextFormField(
                                                          onChanged: (val) {
                                                            invoiceamt =
                                                                int.parse(val);
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <TextInputFormatter>[
                                                            // for below version 2 use this
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    r'[0-9]')),
// for version 2 and greater youcan also use this
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          decoration:
                                                              InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(15
                                                                            .r),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            whiteColors)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(15
                                                                            .r),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            whiteColors)),
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                "${widget.snap1!['InvoicedAmount']}",
                                                            fillColor:
                                                                whiteColors,
                                                            filled: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 5.w,
                                                                    right:
                                                                        10.w),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinText(
                                          text: 'Lead',
                                          colour: lightGrey,
                                          fs: 14,
                                        ),
                                        SizedBox(height: 6.h),
                                        Container(
                                          //height: 50.h,
                                          width: 159.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.r),
                                              color: whiteColors,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
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
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              isDense: true,
                                              fillColor: Colors.white,
                                              filled: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide.none,
                                                // borderSide: BorderSide(
                                                //   color: Colors.black,
                                                // ),
                                              ),
                                            ),
                                            isExpanded: true,
                                            hint: PoppinText(
                                              text: widget.snap1!['Lead'] == ''
                                                  ? ''
                                                  : '${widget.snap1!['Lead']}',
                                              // widget.list == paidList ? selectedItem : LeadListSelectedItem,
                                              colour: blackColors,
                                              fs: selectedItem ==
                                                      'Not Qualified'
                                                  ? 15
                                                  : 15,
                                            ),
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.black38,
                                              size: 25,
                                            ),
                                            iconSize: 50,
                                            dropdownDecoration: BoxDecoration(),
                                            items: leadsList
                                                .map(
                                                  (item) =>
                                                      DropdownMenuItem<String>(
                                                    value: item,
                                                    child: PoppinText(
                                                      text: item,
                                                      fs: 15,
                                                      colour: Colors.black,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              lead = value!;
                                              isShowPopup = value;
                                            },
                                            onSaved: (value) {
                                              //SpecificRefferel.payment = value.toString();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinText(
                                          text: 'Payment',
                                          colour: lightGrey,
                                          fs: 14,
                                        ),
                                        SizedBox(height: 6.h),
                                        Container(
                                          // height: 50.h,
                                          width: 159.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.r),
                                              color: whiteColors,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
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
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              isDense: true,
                                              fillColor: Colors.white,
                                              filled: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide.none,
                                                // borderSide: BorderSide(
                                                //   color: Colors.black,
                                                // ),
                                              ),
                                            ),
                                            isExpanded: true,
                                            hint: PoppinText(
                                              text: widget.snap1!['Payment'] ==
                                                      ''
                                                  ? ''
                                                  : '${widget.snap1!['Payment']}',
                                              // widget.list == paidList ? selectedItem : LeadListSelectedItem,
                                              colour: blackColors,
                                              fs: selectedItem ==
                                                      'Not \nQualified'
                                                  ? 15
                                                  : 15,
                                            ),
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.black38,
                                              size: 25,
                                            ),
                                            iconSize: 50,
                                            // buttonHeight: 35,
                                            // buttonPadding: const EdgeInsets.only(
                                            //     left: 10, right: 10),
                                            dropdownDecoration: BoxDecoration(
                                                // color: appBarColor,
                                                // borderRadius: BorderRadius.circular(30),
                                                ),
                                            items: paidList
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: PoppinText(
                                                        text: item,
                                                        fs: 15,
                                                        colour: Colors.black,
                                                      ),
                                                    ))
                                                .toList(),
                                            // validator: (value) {
                                            //   if (value == null) {
                                            //     return 'Please select gender.';
                                            //   }
                                            // },
                                            onChanged: (value) {
                                              payment = value!;
                                            },
                                            onSaved: (value) {
                                              //SpecificRefferel.payment = value.toString();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: PoppinText(
                              text: "Description of loss",
                              colour: lightGrey,
                              fs: 17),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: PoppinText(
                              //DescriptionOfLoss
                              text: "${widget.snap1!['DescriptionOfLoss']}",
                              colour: blackColors,
                              fs: 17),
                        ),
                        widget.isviewonly
                            ? Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: themeBlue.withOpacity(.1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 5,
                                            spreadRadius: 4.r,
                                            offset: Offset(
                                              2.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    height: 50,
                                    width: 150,
                                    child: Center(
                                        child: PoppinText(
                                            text: "Update",
                                            colour: whiteColors,
                                            fs: 18)),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('${widget.snap1!.id}');
                                      print('${widget.snap2!.id}');
                                      log('this is test of  first time $firsttime');
                                      if (isShowPopup == 'Not Qualified') {
                                        // firsttime++;
                                        dailogBox(
                                            reason,
                                            invoiceamt,
                                            lead,
                                            payment,
                                            jobNumber,
                                            model,
                                            sendemail2);
                                      } else {
                                        print("this is  test $firsttime");
                                        try {
                                          FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(widget.snap2!.id)
                                              .collection('Refferals')
                                              .doc(widget.snap1!.id)
                                              .update({
                                            "InvoicedAmount": invoiceamt,
                                            "Lead": lead,
                                            "Payment": payment,
                                            "JobNumber": jobNumber,
                                          });
                                          model.GetRefferel();
                                        } catch (e) {}
                                        Get.snackbar('', 'DataBase updated',
                                            colorText: Colors.white,
                                            backgroundColor: themeBlue,
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      }

                                      // else {
                                      //   try {
                                      //     print(
                                      //         'this is show pop $isShowPopup');
                                      //     if (isShowPopup == 'Lost') {
                                      //       log('this is lost area');
                                      //       FirebaseFirestore.instance
                                      //           .collection('Users')
                                      //           .doc(widget.snap2!.id)
                                      //           .collection('Refferals')
                                      //           .doc(widget.snap1!.id)
                                      //           .update({
                                      //         "InvoicedAmount": 0,
                                      //         "isActiveRefferal": false,
                                      //         "lastlostamount": invoiceamt,
                                      //         "Lead": lead,
                                      //         "Payment": payment,
                                      //         "JobNumber": jobNumber,
                                      //       });
                                      //       model.GetRefferel();
                                      //     } else if (isShowPopup == "Sold") {
                                      //       FirebaseFirestore.instance
                                      //           .collection('Users')
                                      //           .doc(widget.snap2!.id)
                                      //           .collection('Refferals')
                                      //           .doc(widget.snap1!.id)
                                      //           .update({
                                      //         "InvoicedAmount": lostamount,
                                      //         "lastlostamount": 0,
                                      //         "isActiveRefferal": true,
                                      //         "Lead": lead,
                                      //         "Payment": payment,
                                      //         "JobNumber": jobNumber,
                                      //       });
                                      //       model.GetRefferel();
                                      //     } else {
                                      //       log('this is else area-------->');
                                      //       FirebaseFirestore.instance
                                      //           .collection('Users')
                                      //           .doc(widget.snap2!.id)
                                      //           .collection('Refferals')
                                      //           .doc(widget.snap1!.id)
                                      //           .update({
                                      //         "InvoicedAmount": invoiceamt,
                                      //         "Lead": lead,
                                      //         "Payment": payment,
                                      //         "JobNumber": jobNumber,
                                      //       });
                                      //       model.GetRefferel();
                                      //     }
                                      //     log('this is test of  $isShowPopup');
                                      //   } catch (e) {}
                                      //   Get.snackbar('', 'DataBase updated',
                                      //       colorText: Colors.white,
                                      //       backgroundColor: themeBlue,
                                      //       snackPosition:
                                      //           SnackPosition.BOTTOM);
                                      // }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: themeBlue,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              blurRadius: 5,
                                              spreadRadius: 4.r,
                                              offset: Offset(
                                                2.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      height: 50,
                                      width: 150,
                                      child: Center(
                                          child: PoppinText(
                                              text: "Update",
                                              colour: whiteColors,
                                              fs: 18)),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  )),
            ],
          ));
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
      OverViewProvider model,
      Future<Null> sendemail2(
          dynamic email,
          dynamic name,
          dynamic address,
          dynamic phone,
          dynamic company,
          dynamic DescriptionOfLoss,
          dynamic reason,
          dynamic leadEmail)) async {
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
          if (reason == '') {
            Get.snackbar('error',
                'please provide reason why you make not qualified the lead',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: themeBlue,
                colorText: whiteColors);
          } else {
            print(
                'we need to send email to this referel partner ${widget.snap2!['Email']}');
            Get.back();

            try {
              FirebaseFirestore.instance
                  .collection('Users')
                  .doc(widget.snap2!.id)
                  .collection('Refferals')
                  .doc(widget.snap1!.id)
                  .update({
                "InvoicedAmount": invoiceamt,
                "isActiveRefferal": true,
                "Lead": lead,
                "Payment": payment,
                "JobNumber": jobNumber,
              });
              model.GetRefferel();
              /////------------->');
              await sendemail2(
                  widget.snap2!['Email'],
                  widget.snap1!['CustomerName'],
                  widget.snap1!['CustomerAddress'],
                  widget.snap1!['CustomerPhone'],
                  widget.snap1!['CustomerCompany'],
                  widget.snap1!['DescriptionOfLoss'],
                  reason,
                  widget.snap1!['CustomerEmail']);
            } catch (e) {}
          }
        },
        onCancel: () {
          Get.back();
        });
  }
}
