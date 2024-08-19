import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/DisktopSignInScreen.dart';

import '../../../../GlobalWidgets/Colors/Colours.dart';

class PasswordScreenProvider extends ChangeNotifier {
  String ID = '';
  PasswordScreenProvider(id) {
    print('this is password screen provider $id');
    ID = id;
  }
  String? password = '';
  String? confirmpassword = '';
  bool isDataadd = false;

  changePassword(context) async {
    isDataadd = true;
    notifyListeners();
    print('this is change password function');
    await FirebaseFirestore.instance
        .collection('admin')
        .doc(ID)
        .update({'password': password!.toLowerCase()}).then((value) {
      Get.snackbar('', 'Password Updated Successfully',
          colorText: Colors.white,
          backgroundColor: themeBlue,
          snackPosition: SnackPosition.BOTTOM);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("Password Updated Successfully"),
      //   ),
      // );

      // Get.offAll(DisktopSignInScreen());
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              DisktopSignInScreen(),
          transitionDuration: Duration(milliseconds: 500),
          // reverseTransitionDuration: Duration.zero,
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
    });
  }


}
