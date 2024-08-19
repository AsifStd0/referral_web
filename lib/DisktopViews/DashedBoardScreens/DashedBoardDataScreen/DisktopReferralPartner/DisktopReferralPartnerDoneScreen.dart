import 'dart:developer';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopColumnContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopLeadsDoneListContainer2.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/done_screen_provider.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';
import 'package:referral_admin_web/core/model/user_model.dart';

class DisktopReferralPartnerViewScreen extends StatelessWidget {
  const DisktopReferralPartnerViewScreen({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => doneScreenProvider(),
      child: Consumer<doneScreenProvider>(
          builder: (BuildContext context, model, Widget? child) {
        return SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: deviceWidth * 0.8,
            color: Colors.transparent,
            padding: EdgeInsets.only(
              left: 34.w,
              top: 37.h,
            ),
            child: model.SpecificScreen
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          PoppinText(
                            text:
                                "${model.onwer.firstName} ${model.onwer.lastName}  Referral Leads",
                            colour: blackColors,
                            fs: 24,
                            fw: FontWeight.bold,
                          ),
                        ],
                      ),
                      Container(
                        width: deviceWidth * 0.8,
                        height: deviceHeight * 0.85,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              DisktopDoesReferralLeadHeadingContainer(
                                  aveJob: model.aveJobNumber,
                                  TotalRefferel: model.SpecificRefferel.length,
                                  onwer: model.onwer,
                                  deviceWidth: deviceWidth),
                              Container(
                               
                                height: deviceWidth * 0.4,
                                margin: EdgeInsets.only(top: 40.h),
                                child: ListView.builder(
                                    itemCount: model.SpecificRefferel.length,
                                    scrollDirection: Axis.vertical,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      print(
                                          "this is length of SpecificRefferel  ${model.SpecificRefferel.length}");

                                      return DisktopLeadsDoneListContainer2(
                                          leademail: model.onwer.email,
                                          model: model,
                                          list: paidList,
                                          list2: leadsList,
                                          SpecificRefferel:
                                              model.SpecificRefferel[index]);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      }),
    );
  }
}

class DisktopDoesReferralLeadHeadingContainer extends StatefulWidget {
  final TotalRefferel;
  final aveJob;
  DisktopDoesReferralLeadHeadingContainer({
    Key? key,
    this.TotalRefferel,
    this.aveJob,
    required this.deviceWidth,
    required this.onwer,
  }) : super(key: key);

  final double deviceWidth;
  userModel onwer;

  @override
  State<DisktopDoesReferralLeadHeadingContainer> createState() =>
      _DisktopDoesReferralLeadHeadingContainerState();
}

class _DisktopDoesReferralLeadHeadingContainerState
    extends State<DisktopDoesReferralLeadHeadingContainer> {
  @override
  Widget build(BuildContext context) {
    print('this is other cleass value ${widget.aveJob.toStringAsFixed(0)}');
    int aveJob = int.parse(widget.aveJob.toStringAsFixed(0));
    var f = NumberFormat("###,###", "en_US");
    String aveeee = f.format(int.parse("${widget.aveJob.toStringAsFixed(0)}"));
    return Container(
        width: widget.deviceWidth * 0.8,
        height: 170.h,
        margin: EdgeInsets.only(top: 18.h, right: 20.w),
        padding: EdgeInsets.only(left: 24.w, top: 19.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: whiteColors.withOpacity(0.5)),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Update W9 Form"),
                    content: Container(
                      height: 150,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () async {
                              widget.onwer.udid!;
                              log(widget.onwer.udid!.toString());
                              await FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(widget.onwer.udid!)
                                  .update({"W9Form": true});

                              widget.onwer.w9Form = true;
                              setState(() {});

                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 200,
                                color: themeBlue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Submitted",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          InkWell(
                            onTap: () async {
                              widget.onwer.udid!;
                              log(widget.onwer.udid!.toString());
                              await FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(widget.onwer.udid!)
                                  .update({"W9Form": false});

                              widget.onwer.w9Form = false;
                              setState(() {});

                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 200,
                                color: themeBlue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Not Submitted",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: const Text("Close"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: DisktopColumnContainer(
                w: 196,
                heading1: 'Referrer Name',
                heading1Value:
                    '${widget.onwer.firstName} ${widget.onwer.lastName}',
                heading2: 'W9 Form',
                heading2Value:
                    widget.onwer.w9Form! ? "Submitted" : "Not Submitted",
              ),
            ),
            SizedBox(width: 50.w),
            DisktopColumnContainer(
              w: 250,
              heading1: "Phone",
              heading1Value: "${widget.onwer.phone}",
              heading2: "Email",
              heading2Value: "${widget.onwer.email}",
            ),
            SizedBox(width: 50.w),
            DisktopColumnContainer(
              w: 310,
              heading1: "Address",
              heading1Value: "${widget.onwer.address}",
              heading2: "Company",
              heading2Value: "${widget.onwer.companyName}",
            ),
            SizedBox(width: 50.w),
            DisktopColumnContainer(
              w: 180,
              heading1: "Avg. Job Value",
              heading1Value: "\$${aveeee}",
              heading2: "Referrals",
              heading2Value: "${widget.TotalRefferel}",
            ),
            GestureDetector(
              onTap: () {},
              child: DisktopColumnContainer(
                w: 180,
                heading1: "Password",
                heading1Value: "${widget.onwer.password}",
                heading2: widget.onwer.IsAdmin! ? "Admin" : "",
                heading2Value: "",
              ),
            ),
          ],
        ));
  }
}
