import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/admin_model.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/Colors/Colours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';

final firebaseFireStore = FirebaseFirestore.instance;

String islogin = '';

class SignInProvider extends ChangeNotifier {
  SignInProvider() {
    getAllAdmins();
  }
  adminModel model = adminModel();
  bool isEmailCorrect = false;
  bool isPasswordCorrect = false;
  List<adminModel> list = [];
  List<String> Allemails = [];
  List<String> Allpasswords = [];
  String? currentemail = '';
  String? currentID = '';
  String? currentpasssword = '';
  bool? issuperadmin = false;
  bool? isviewonly = false;
  getAllAdmins() async {
    list = await getSaloonData();
    for (int i = 0; i < list.length; i++) {
      print('saloon data is name ${list[i].email}');
      print('saloon data is name;;;;;;; ${list[i].password}');
      Allemails.add(list[i].email!);
      Allpasswords.add(list[i].password!);
    }
    notifyListeners();
  }

  adminfunction() async {
    for (int i = 0; i < list.length; i++) {
      if (list[i].email == model.email!.toLowerCase()) {
        isEmailCorrect = true;
        if (list[i].password == model.password!.toLowerCase()) {
          isPasswordCorrect = true;
          isEmailCorrect = true;
          currentemail = list[i].email;
          currentpasssword = list[i].password;
          currentID = list[i].id;
          issuperadmin = list[i].issuperAdmin;
          isviewonly = list[i].isviewonly;
        }
      }
    }
    // if (Allemails.contains(model.email)) {
    if (isEmailCorrect) {
      if (isPasswordCorrect) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool("login", true);
        preferences.setBool('issuperadmin', issuperadmin!);
        preferences.setBool('isviewonly', isviewonly!);
        preferences.setString('ID', currentID!);
        preferences.setString('Email', model.email!);
        preferences.setString('password', model.password!);
        // shared = await SharedPreferences.getInstance();
        // shared!.setString('islogin', 'login');
        Get.offAll(DisktopDashedBoardScreen(
          email: currentemail,
          isSuperAdmin: issuperadmin,
        ));
      } else {
        Get.snackbar('Error', "Incorrect Password",
            backgroundColor: themeBlue,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            maxWidth: 300,
            margin: EdgeInsets.all(40));
      }
    } else {
      Get.snackbar('Error', "Incorrect Email",
          backgroundColor: themeBlue,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 300,
          margin: EdgeInsets.all(40));
    }
  }
}

Future<List<adminModel>> getSaloonData() async {
  List<adminModel> list = [];
  try {
    QuerySnapshot snapshot = await firebaseFireStore.collection('admin').get();
    if (snapshot.docs.isNotEmpty) {
      for (var element in snapshot.docs) {
        // print('AppUser length ===>${list.length}');
        // print('AppUser length ===>${element.data()}');
        list.add(adminModel.fromJson(element, element.id));
      }
    } else {
      print("No Users found");
    }
  } catch (e) {
    print('Exception@DatabaseServices/getAllAppUsers ==> $e');
  }
  return list;
}
