import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/admin_model.dart';

class appbarprovider extends ChangeNotifier {
  appbarprovider() {
    getallAdmin();
    print('constructor function called');
  }
  final firebaseFireStore = FirebaseFirestore.instance;
  bool switchvalue = true;
  changeSwitchValue(val) {
    switchvalue = val;
    notifyListeners();
  }

  deletAdmin(id) {
    print('this id data is going to delete $id');
    try {
      firebaseFireStore.collection('admin').doc(id).delete();
    } catch (e) {
      print('get issue while deleting admin');
    }
  }

  List<adminModel> list = [];

  getallAdmin() async {
    list = [];
    try {
      Stream<QuerySnapshot> Snapshot =
          await firebaseFireStore.collection('admin').snapshots();
      Snapshot.listen((event) {
        list = [];
        if (event.docs.length > 0) {
          event.docs.forEach((element) {
            list.add(adminModel.fromJson(element, element.id));
          });
        } else {
          print("No Users found");
        }
        print('this is length of admin ${list.length}');
        notifyListeners();
      });
      // if (snapshot.docs.isNotEmpty) {
      //   for (var element in snapshot.docs) {
      //     list.add(adminModel.fromJson(element, element.id));
      //   }
      // } else {
      //   print("No Users found");
      // }
      // print('this is length of admin ${list.length}');
      notifyListeners();
    } catch (e) {
      print('Exception@DatabaseServices/getAllAppUsers ==> $e');
    }
    notifyListeners();
  }
}
