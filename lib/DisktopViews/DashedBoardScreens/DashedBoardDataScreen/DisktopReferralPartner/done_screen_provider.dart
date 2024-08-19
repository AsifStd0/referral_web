import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopReferralPartnerMainScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/test.dart';
import 'package:referral_admin_web/core/model/refferel_model.dart';
import 'package:referral_admin_web/core/model/user_model.dart';

class doneScreenProvider extends ChangeNotifier {
  doneScreenProvider() {
    GetRefferel();
  }

  List<refferelModel> SpecificRefferel = [];
  double aveJobNumber = 0.0;
  double sumJobNumber = 0.0;
  //refferelModel RefferelModel = refferelModel();
  userModel onwer = userModel();
  bool SpecificScreen = false;

  GetRefferel() async {
    log('getreferral function called Globalid $Globalid ;;;');
    SpecificScreen = true;
    final firebaseFireStore = FirebaseFirestore.instance;
    try {
      SpecificRefferel = [];
      aveJobNumber = 0.0;
      sumJobNumber = 0.0;
      log('this is try area');
      var snapshot = await firebaseFireStore
          .collection('Users')
          .doc(Globalid)
          .collection('Refferals')
          .orderBy('DateTime', descending: true)
          .get();
      var snapshot1 =
          await firebaseFireStore.collection('Users').doc(Globalid).get();
      if (snapshot1.exists) {
        onwer = userModel.fromJson(snapshot1.data(), snapshot1.id);
      }
      // print('this is current onwer data ${snapshot1.data()}');
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          print('this is element data ${snapshot.docs.length}');
          sumJobNumber = sumJobNumber + element.data()['InvoicedAmount'];
          // print('CustomerJobNumber ===>${element.data()['JobNumber']}');
          SpecificRefferel.add(refferelModel.fromJson(element, element.id));
          // print('${element.data()['JobNumber']}');
          // print('CustomerAddress ===>${element.data()!['JobNumber']}');
          //log('${element.data()['CustomerAddress']}');
        });

        print('this is SpecificRefferel ${SpecificRefferel.length}');
        print('this is total user length ${snapshot.docs.length}');
        aveJobNumber = sumJobNumber / snapshot.docs.length;
        log('this is ave jobnumber $aveJobNumber');
      } else {
        print("No Users found");
      }

      print('name   onwer ${onwer.firstName}');
    } catch (e) {}
    SpecificScreen = false;
    notifyListeners();
  }
}
