import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../GlobalWidgets/Colors/Colours.dart';
import '../../DisktopSignInScreen/admin_model.dart';

class profileProvider extends ChangeNotifier {
  String? CurrentID;
  SharedPreferences? shared;
  String? email;
  bool isAdminLoaded = false;
  String? password;
  profileProvider() {
    log('profileProvider constructor');
    getadmin();
  }

  adminModel onwer = adminModel();
  getadmin() async {
    print('get aadin function called');
    isAdminLoaded = true;
    notifyListeners();
    shared = await SharedPreferences.getInstance();
    String? id = shared!.getString("ID");
    print('this is id ${shared!.getString("ID")}');
    var snapshot =
        await FirebaseFirestore.instance.collection('admin').doc(id).get();

    if (snapshot.exists) {
      print('this is email of the admin ${snapshot.data()!['email']}');
      onwer = adminModel.fromJson(snapshot.data(), snapshot.id);
      // print('this is password of the admin ${onwer.password}');
    }

    isAdminLoaded = false;
    notifyListeners();
  }

  updateFunction() async {
    try {
      await FirebaseFirestore.instance
          .collection('admin')
          .doc(shared!.getString("ID"))
          .update({
        'email': onwer.email!.toLowerCase(),
        'password': onwer.password!.toLowerCase()
      });
      var snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(shared!.getString("ID"))
          .update({
        'name': onwer.name,
        'email': onwer.email!.toLowerCase(),
        'password': onwer.password!.toLowerCase()
      }).then((value) {
        Get.snackbar('', 'User Data updated',
            colorText: Colors.white,
            backgroundColor: themeBlue,
            snackPosition: SnackPosition.BOTTOM);
      });

      notifyListeners();
    } catch (e) {}
  }
}
