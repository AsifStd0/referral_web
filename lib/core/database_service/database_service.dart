import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referral_admin_web/core/model/user_model.dart';

class DatabaseServices {
  final firebaseFireStore = FirebaseFirestore.instance;

  /// Get all user data

  Future<List<userModel>> GetAllUser() async {
    final List<userModel> list = [];
    try {
      QuerySnapshot snapshot = await firebaseFireStore
          .collection('Users')
          .where("Accepted", isEqualTo: "Pending")
          .orderBy('DateTime', descending: true)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          list.add(userModel.fromJson(element, element.id));

          print('AppUser length ===>${element.id}');
        });
      } else {
        print("No Users found");
      }
    } catch (e) {
      print('Exception@DatabaseServices/getAllAppUsers ==> $e');
    }
    return list;
  }

  /// Get all user data

  Future<List<userModel>> AcceptedUser() async {
    final List<userModel> list = [];
    try {
      QuerySnapshot snapshot = await firebaseFireStore
          .collection('Users')
          .where("Accepted", isEqualTo: "Accepted")
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          list.add(userModel.fromJson(element, element.id));

          // print('AppUser length ===>${element.id}');
        });
      } else {
        print("No Users found");
      }
    } catch (e) {
      print('Exception@DatabaseServices/getAllAppUsers ==> $e');
    }
    return list;
  }

  ///
  ///----->accept or reject user
  ///
  AcceptFunction(id) {
    try {
      log('come to try area');
      firebaseFireStore
          .collection('Users')
          .doc(id)
          .update({'Accepted': 'Accepted'});
    } catch (e) {}
  }

  ///
  ///----->accept or reject user
  ///
  RejectFunction(id) {
    try {
      firebaseFireStore.collection('Users').doc(id).delete();
      //print('this is database print this id is deleted $id');
      //.update({'Accepted': 'deny'}
      // );
    } catch (e) {}
  }
}
