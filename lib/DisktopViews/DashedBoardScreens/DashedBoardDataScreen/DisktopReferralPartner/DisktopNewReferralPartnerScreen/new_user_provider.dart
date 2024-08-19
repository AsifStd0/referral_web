import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:referral_admin_web/core/model/user_model.dart';

import '../../../../../GlobalWidgets/Colors/Colours.dart';

class NewuserProvider extends ChangeNotifier {
  userModel user = userModel();
  bool loading = false;

  AddNewUser() async {
    try {
      print('this is try class');
      await FirebaseFirestore.instance
          .collection('Users')
          .add(user.toJson())
          .then((value) {
        Get.snackbar('', 'New User Added',
            colorText: Colors.white,
            backgroundColor: themeBlue,
            snackPosition: SnackPosition.BOTTOM);
      });
      notifyListeners();
    } catch (e) {}
  }
}
