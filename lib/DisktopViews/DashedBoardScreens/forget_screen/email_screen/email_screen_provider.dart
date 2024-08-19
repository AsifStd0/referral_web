import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/forget_screen/otp_screen.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/admin_model.dart';

import '../../../../GlobalWidgets/Colors/Colours.dart';

class EmailScreenProvider extends ChangeNotifier {
  final List<adminModel> adminlist;
  EmailScreenProvider({required this.adminlist}) {
    // getAllEmail();
  }
  String? currentemail = '';
  int? otp;
  bool isload = false;

  getAllEmail(context) async {
    isload = true;
    List<String> emaillist = [];
    String id = '';
    for (int i = 0; i < adminlist.length; i++) {
      // print(widget.mylist[i].email);
      if (adminlist[i].email == currentemail) {
        //  log('${adminlist[i].id}');
        id = adminlist[i].id!;
      }
      emaillist.add(adminlist[i].email!);
    }
    if (emaillist.contains(currentemail)) {
      otp = Random().nextInt(900000) + 100000;
      sendemail();
      // Generate a random 6-digit number
      print("this is otp $otp and id is $id");
      if (id.isNotEmpty && otp != null) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                // PasswordScreen(id: id),
                OtpScreen(otp: otp, id: id),
            transitionDuration: Duration(milliseconds: 500),
            // reverseTransitionDuration: Duration.zero,
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
        isload = false;
        notifyListeners();
      }
    } else {
      print('email not exite in the database');
      var snackbar = Get.snackbar('', 'email does not exite in the database',
          colorText: Colors.white,
          backgroundColor: themeBlue,
          snackPosition: SnackPosition.BOTTOM);
      isload = false;
      notifyListeners();
    }
  }

  sendemail() async {
    final serviceId1 = "service_lnluuzm";
    final templateId1 = "template_ssf7msh";
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
              "to_email": currentemail,
              "reply_to": "arbabshujaat8@gmail.com",
              "main_heading": "REFERRAL APP NOTIFICATION",
              "otp": otp.toString(),
            }
          },
        ));
  }
}
