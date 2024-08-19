import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DisktopPendingRefferlScreen/DisktopPendingReferralHeadingContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DisktopPendingRefferlScreen/DisktopPendingReferralListViewContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DisktopPendingRefferlScreen/DisktopPendingRefferlProvider.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/Colors/Colours.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/PoppinText.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class DisktopPendingReferralPartnersScreen extends StatefulWidget {
  DisktopPendingReferralPartnersScreen(
      {Key? key, this.deviceWidth, this.deviceHeight})
      : super(key: key);
  double? deviceWidth, deviceHeight;

  @override
  State<DisktopPendingReferralPartnersScreen> createState() =>
      _DisktopPendingReferralPartnersScreenState();
}

class _DisktopPendingReferralPartnersScreenState
    extends State<DisktopPendingReferralPartnersScreen> {
  bool loading = false;
  void initState() {
    sharedfunction();
    // TODO: implement initState
    super.initState();
  }

  bool? isviewonly;
  sharedfunction() async {
    SharedPreferences? shared = await SharedPreferences.getInstance();
    setState(() {
      isviewonly = shared.getBool('isviewonly');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DesktopPendingRefferlProvider(),
      child: Consumer<DesktopPendingRefferlProvider>(
          builder: (BuildContext context, model, Widget? child) {
        return Container(
          color: Colors.transparent,
          // height: 1000.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 37.h,
                  ),
                  PoppinText(
                    text: "Pending Referral Partners ",
                    colour: blackColors,
                    fs: 24,
                    fw: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  DisktopPendingReferralHeadingContainer(),
                  SizedBox(
                    height: 19.h,
                  ),
                  Container(
                    height: 825.h,
                    width: 1521.w,
                    // color: blueAxent.withOpacity(0.1),
                    // padding: EdgeInsets.only(left: 34.w),
                    child: model.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : model.alluser.length == 0
                            ? Center(
                                child: Text("No pending partner requests yet!"))
                            : ListView.builder(
                                itemCount: model.alluser.length,
                                scrollDirection: Axis.vertical,
                                // physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return loading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : DisktopPendingReferralListViewContainer(
                                          isviewonly: isviewonly,
                                          index: index,
                                          loading: model.alluser[index].loading,
                                          refferedBy:
                                              model.alluser[index].refderedBy,
                                          refferelpartner: model
                                                  .alluser[index].firstName! +
                                              " " +
                                              model.alluser[index].lastName!,
                                          phone: model.alluser[index].phone,
                                          jobtitle:
                                              model.alluser[index].jobTittle,
                                          company:
                                              model.alluser[index].companyName,
                                          email: model.alluser[index].email,
                                          w9form: model.alluser[index].w9Form,
                                          denyPress: () {
                                            model.Reject(
                                                model.alluser[index].id, index);
                                          },
                                          acceptPress: () async {
                                            setState(() {
                                              model.alluser[index].loading =
                                                  true;
                                            });

                                            ///
                                            ///---> if user registered by self then no email and sms will send to him
                                            ///

                                            if (model.alluser[index]
                                                    .refderedBy !=
                                                'Self') {
                                              print(
                                                  'user is not reffered by self');
                                              try {
                                                late TwilioFlutter
                                                    twilioFlutter;
                                                twilioFlutter = TwilioFlutter(
                                                    accountSid:
                                                        "AC00734aa99666985887dd97443033e759",
                                                    authToken:
                                                        "2c029b5d824ae7de0401f8100bff967c",
                                                    twilioNumber:
                                                        "+18158932679");
                                                log("Hiiiiiii");
                                                log('${model.alluser[index].phone}');
                                                twilioFlutter.sendSMS(
                                                    toNumber: model
                                                        .alluser[index].phone
                                                        .toString(),
                                                    messageBody: "REFERRAL APP NOTIFICATION"
                                                            "\n"
                                                            "\n"
                                                            "\n"
                                                            "Login to the mobile app to change your password."
                                                            "\n"
                                                            "\n"
                                                            "You have been added as  Referral partner on Referral App."
                                                            "\n"
                                                            "\n"
                                                            "Your credentials are"
                                                            "\n"
                                                            "\n"
                                                            "EMAIL:" +
                                                        "${model.alluser[index].email.toString()}"
                                                            "\n"

                                                            ///
                                                            ///-----> i need to edit here after changing the templete
                                                            ///
                                                            "PASSWORD: 123456");
                                              } on TwilioFlutter catch (e) {
                                                setState(() {
                                                  model.alluser[index].loading =
                                                      false;
                                                });
                                                Get.defaultDialog(
                                                    title: '${e}');
                                                print(
                                                    "sms erorrrrrrrrrrrrrrrrrrrrrrrrrrr ${e.toString()}");
                                              }

                                              final serviceId =
                                                  "service_lnluuzm";
                                              final templateId =
                                                  "template_e4y9rnw";
                                              final userId =
                                                  "PKpVr2NVyCvnT0ZD5";
                                              final url = Uri.parse(
                                                  "https://api.emailjs.com/api/v1.0/email/send");
                                              final response = await http.post(
                                                  url,
                                                  headers: {
                                                    "origin":
                                                        "http://localhost",
                                                    "Content-Type":
                                                        "application/json"
                                                  },
                                                  body: json.encode(
                                                    {
                                                      "service_id": serviceId,
                                                      "template_id": templateId,
                                                      "user_id": userId,
                                                      "template_params": {
                                                        // "from_email": fromEmail,
                                                        "to_email": model
                                                            .alluser[index]
                                                            .email
                                                            .toString(),
                                                        "reply_to":
                                                            "arbabshujaat8@gmail.com",
                                                        "main_heading":
                                                            "REFERRAL APP NOTIFICATION",

                                                        "email": model
                                                            .alluser[index]
                                                            .email
                                                            .toString(),
                                                        "password": model
                                                            .alluser[index]
                                                            .password
                                                            .toString(),
                                                      }
                                                    },
                                                  ));
                                              log("email send to user");
                                              log(response.toString());
                                              print('$index  accept');
                                            }

                                            setState(() {
                                              model.alluser[index].loading =
                                                  false;
                                            });
                                            model.Accept(
                                                model.alluser[index].id, index);
                                          },
                                        );
                                }),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
