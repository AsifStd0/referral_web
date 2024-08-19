import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/admin_model.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/signin_screen_provider.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:uuid/uuid.dart';
import 'DisktopNewReferralPartnerScreen.dart';

List numbers = [];
List emails = [];
List<String> Email = [];
List<String> adminEmail = [];

class NewRefferalPartner with ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController jobtittle = TextEditingController();
  TextEditingController password = TextEditingController();

  String w9Form = "No I have not completed it";
  bool isLoading = false;
  adminModel AdminModel = adminModel();

  String avatar = avatarList[0];
  int selectedAvatarIndex = 0;

  updateW9(String value) {
    w9Form = value;
    notifyListeners();
  }

  setAvatar(String value, int index) {
    avatar = value;
    selectedAvatarIndex = index;
    notifyListeners();
  }

  sendemailtoadmin() async {
    final serviceId1 = "service_lnluuzm";
    final templateId1 = "template_e4y9rnw";
    final userId1 = "PKpVr2NVyCvnT0ZD5";
    final url1 = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url1,
        headers: {
          "origin": "http://localhost",
          "Content-Type": "application/json"
        },
        body: json.encode(
          {
            "service_id": serviceId1,
            "template_id": templateId1,
            "user_id": userId1,
            "template_params": {
              // "from_email": fromEmail,
              "to_email": email.text.toLowerCase(),
              "reply_to": "arbabshujaat8@gmail.com",
              "main_heading": "REFERRAL APP NOTIFICATION",

              "email": email.text.toLowerCase(),
              "password": password.text.toLowerCase() == ""
                  ? '123456'
                  : password.text.toLowerCase(),
            }
          },
        ));
    log("email send to user ${password.text.toLowerCase()}");
  }

  sendSms() async {
    try {
      for (int i = 0; i < numbers.length; i++) {
        late TwilioFlutter twilioFlutter;
        twilioFlutter = TwilioFlutter(
            accountSid: "AC00734aa99666985887dd97443033e759",
            authToken: "2c029b5d824ae7de0401f8100bff967c",
            twilioNumber: "+18158932679");
        await twilioFlutter.sendSMS(
            toNumber: numbers[i],
            messageBody: "REFERRAL APP NOTIFICATION"
                    "\n"
                    "\n"
                    "\n"
                    "New Referral partner added  on Referral App."
                    "\n"
                    "\n"
                    "NAME: ${firstName.text + " " + lastName.text}"
                    //"Building Name: ${widget.currentBuilding.buildingName.toString()}"
                    // "\n"
                    // "Building Address: ${widget.currentBuilding.streetAddress.toString()},"
                    "\n"
                    "\n"
                    "ADDRESS: ${address.text + " " + city.text + " " + state.text + " " + zip.text}"
                    "\n"
                    "\n"
                    "PHONE: ${phoneNumber.text}"
                    "\n"
                    "\n"
                    "COMPANY: ${company.text}"
                    "\n"
                    "\n"
                    "EMAIL:" +
                "${email.text.toString()}"
                    "\n"
                    "\n"
                    "W9 Form: $w9Form");
      }

      // print("phone numbers  >>>>>>>>>>>>>> ${phone[i]}");

      // ignore: nullable_type_in_catch_clause
    } on TwilioFlutter catch (e) {
      print("sms erorrrrrrrrrrrrrrrrrrrrrrrrrrr ${e.toString()}");
    }
  }

  sendSmstonewUser() async {
    try {
      late TwilioFlutter twilioFlutter;
      twilioFlutter = TwilioFlutter(
          accountSid: "AC00734aa99666985887dd97443033e759",
          authToken: "2c029b5d824ae7de0401f8100bff967c",
          twilioNumber: "+18158932679");
      log("Hiiiiiii");
      log(phoneNumber.text.toString());
      await twilioFlutter.sendSMS(
          toNumber: phoneNumber.text.toString(),
          messageBody: "REFERRAL APP NOTIFICATION"
                  "\n"
                  "\n"
                  "\n"
                  "You have been added as  Referral partner on Referral App."
                  "\n"
                  "\n"
                  "Your credentials are"
                  "\n"
                  "\n"
                  "EMAIL:" +
              "${email.text.toString()}"
                  "\n"
                  "PASSWORD: 123456");
    } on TwilioFlutter catch (e) {
      print("sms erorrrrrrrrrrrrrrrrrrrrrrrrrrr ${e.toString()}");
    }
  }

  // sendemailtouser() async {
  //   final serviceId = "service_lnluuzm";
  //   final templateId = "template_e4y9rnw";
  //   final userId = "PKpVr2NVyCvnT0ZD5";
  //   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  //   final response = await http.post(url,
  //       headers: {
  //         "origin": "http://localhost",
  //         "Content-Type": "application/json"
  //       },
  //       body: json.encode(
  //         {
  //           "service_id": serviceId,
  //           "template_id": templateId,
  //           "user_id": userId,
  //           "template_params": {
  //             // "from_email": fromEmail,
  //             "to_email": email.text.toString(),
  //             "reply_to": "arbabshujaat8@gmail.com",
  //             "main_heading": "REFERRAL APP NOTIFICATION",
  //             "email": email.text.toString(),
  //           }
  //         },
  //       ));
  //   log("hiiiii");
  //   log(response.toString());
  // }

  sendemail2() async {
    final serviceId = "service_lnluuzm";
    final templateId = "template_spifaze";
    final userId = "PKpVr2NVyCvnT0ZD5";
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    for (int i = 0; i < emails.length; i++)
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
                // "from_email": fromEmail,
                "to_email": emails[i],
                "reply_to": "arbabshujaat8@gmail.com",
                "main_heading": "REFERRAL APP NOTIFICATION",

                "user_name": "${firstName.text + " " + lastName.text}",

                "user_address":
                    "${address.text + " " + city.text + " " + state.text + " " + zip.text}",

                "user_phone": "${phoneNumber.text}",

                "user_company": "${company.text}",

                "user_email": "${email.text.toString()}",

                "user_form": "$w9Form"
              }
            },
          ));
  }

  Future<String> signupUser(
      BuildContext context, bool isadminSHow, bool isonlyPartner) async {
    try {
      print('signupUser function called');
      isLoading = true;
      notifyListeners();
      var uuid = Uuid();
      String uid = uuid.v1();
      final snap = await FirebaseFirestore.instance.collection("Users").get();
      final adminSnap =
          await FirebaseFirestore.instance.collection("admin").get();
      if (snap.docs.length > 0) {
        for (int i = 0; i < snap.docs.length; i++) {
          Email.add(snap.docs[i].data()['Email']);
        }
        for (int i = 0; i < adminSnap.docs.length; i++) {
          log('these are the current emails ${snap.docs.length}');
          adminEmail.add(adminSnap.docs[i].data()['email']);
        }
      } else if (snap.docs.length == 0) {
        if (isonlyPartner) {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(uid.toString())
              .set({
            "RefderedBy": "Admin",
            "RefderedByName": "Admin",
            "EmailVerified": false,
            "W9Form": w9Form == "No I have not completed it" ? false : true,
            "FirstName": firstName.text,
            "LastName": lastName.text,
            "IsAdmin": isadminSHow,
            //may it create problem
            "Verified": false,
            "Udid": uid.toString(),
            "Address": address.text +
                " " +
                city.text +
                " " +
                state.text +
                " " +
                zip.text,
            "city": city.text,
            "Phone": phoneNumber.text,
            "DateTime": DateTime.now().toString(),
            "CompanyName": company.text,
            "Email": email.text.toLowerCase(),
            "Password": password.text.toLowerCase() ?? "123456",
            "AvgJobValue": 0,
            "Refferals": 0,
            "Accepted": "Accepted",
            "Avatar": avatar,
            "JobTittle": jobtittle.text
          }).then((value) async {
            sendemailtoadmin();
          });
        } else {
          log('${AdminModel.email} _____ ${AdminModel.password}');
          firebaseFireStore
              .collection('admin')
              .doc(uid.toString())
              .set(AdminModel.toJson());

          await FirebaseFirestore.instance
              .collection("Users")
              .doc(uid.toString())
              .set({
            "RefderedBy": "Admin",
            "RefderedByName": "Admin",
            "EmailVerified": false,
            "W9Form": w9Form == "No I have not completed it" ? false : true,
            "FirstName": firstName.text,
            "LastName": lastName.text,
            "IsAdmin": isadminSHow,
            //may it create problem
            "Verified": false,
            "Udid": uid.toString(),
            "Address": address.text +
                " " +
                city.text +
                " " +
                state.text +
                " " +
                zip.text,
            "city": city.text,
            "Phone": phoneNumber.text,
            "DateTime": DateTime.now().toString(),
            "CompanyName": company.text,
            "Email": email.text.toLowerCase(),
            "Password": password.text.toLowerCase() ?? "123456",
            "AvgJobValue": 0,
            "Refferals": 0,
            "Accepted": "Accepted",
            "Avatar": avatar,
            "JobTittle": jobtittle.text
          }).then((value) async {
            sendemailtoadmin();
          });
        }
      }

      log('this is the email list $Email');

      if (Email.contains(email.text) || adminEmail.contains(email.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Color(0xFF22408F),
              content: Text(
                  'Email already exit in Refferal Partner list or admin list')),
        );
        print('Email already exit');
        isLoading = false;
        notifyListeners();
        return "";
      } else {
        if (isonlyPartner) {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(uid.toString())
              .set({
            "RefderedBy": "Admin",
            "RefderedByName": "Admin",
            "EmailVerified": false,
            "W9Form": w9Form == "No I have not completed it" ? false : true,
            "FirstName": firstName.text,
            "LastName": lastName.text,
            //may it create problem

            "Verified": false,
            "Udid": uid.toString(),
            "Address": address.text +
                " " +
                city.text +
                " " +
                state.text +
                " " +
                zip.text,
            "city": city.text,
            "Phone": phoneNumber.text,
            "DateTime": DateTime.now(),
            "IsAdmin": isadminSHow,
            "CompanyName": company.text,
            "Email": email.text.toLowerCase(),
            "Password": password.text.toLowerCase() == ""
                ? "123456"
                : password.text.toLowerCase(),
            "AvgJobValue": 0,
            "Refferals": 0,
            "Accepted": "Accepted",
            "Avatar": avatar,
            "JobTittle": jobtittle.text
          }).then((value) async {
            sendemailtoadmin();
          });
        } else {
          log('${AdminModel.email} _____ ${AdminModel.password}');
          firebaseFireStore
              .collection('admin')
              .doc(uid.toString())
              .set(AdminModel.toJson());
          // }
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(uid.toString())
              .set({
            "RefderedBy": "Admin",
            "RefderedByName": "Admin",
            "EmailVerified": false,
            "W9Form": w9Form == "No I have not completed it" ? false : true,
            "FirstName": firstName.text,
            "LastName": lastName.text,
            //may it create problem

            "Verified": false,
            "Udid": uid.toString(),
            "Address": address.text +
                " " +
                city.text +
                " " +
                state.text +
                " " +
                zip.text,
            "city": city.text,
            "Phone": phoneNumber.text,
            "DateTime": DateTime.now(),
            "IsAdmin": isadminSHow,
            "CompanyName": company.text,
            "Email": email.text.toLowerCase(),
            "Password": password.text.toLowerCase() == ""
                ? "123456"
                : password.text.toLowerCase(),
            "AvgJobValue": 0,
            "Refferals": 0,
            "Accepted": "Accepted",
            "Avatar": avatar,
            "JobTittle": jobtittle.text
          }).then((value) async {
            sendemailtoadmin();
          });
        }

        log('admin and use adedd');
        // await auth.signOut();
        await FirebaseFirestore.instance
            .collection("EmailsAndNumbers")
            .doc("emails")
            .get()
            .then((value) {
          log('email and number get-------->>>>>>>>>>>>>>>');
          emails = value["emails"];
          numbers = value["numbers"];
          print('this is the emails and numbers $emails and $numbers');
        });
        await sendSms();
        log('sms send');
        await sendemail2();
        log('email2 send');
        // await sendemailtouser();
        // await sendSmstonewUser();

        isLoading = false;
        notifyListeners();
        Get.back();
        return "Success";
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      if (e.toString() != "Exception")
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Error",
                style: TextStyle(color: Colors.red),
              ),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );

      return e.toString();
    }
  }
}
