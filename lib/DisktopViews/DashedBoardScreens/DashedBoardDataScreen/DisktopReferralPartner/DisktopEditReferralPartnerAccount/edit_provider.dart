import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopReferralPartnerMainScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/test.dart';
import 'package:referral_admin_web/core/model/user_model.dart';

import '../../../../../GlobalWidgets/Colors/Colours.dart';

class EditProvider extends ChangeNotifier {
  EditProvider() {
    getData();
    print('provider is called');
  }
  bool isdataLoad = false;
  userModel onwer = userModel();
  getData() async {
    print('going to load that of this id $Globalid');
    try {
      isdataLoad = true;
      var snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(Globalid)
          .get();
      if (snapshot.exists) {
        onwer = userModel.fromJson(snapshot.data(), snapshot.id);
        //  print('${onwer.firstName}');
      }
      isdataLoad = false;
      notifyListeners();
    } catch (e) {}
  }

  updateFunction() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(Globalid)
          .update({
        'FirstName': onwer.firstName,
        'LastName': onwer.lastName,
        'Email': onwer.email!.toLowerCase(),
        'Address': onwer.address,
        'CompanyName': onwer.companyName,
        'Password': onwer.password!.toLowerCase()
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
