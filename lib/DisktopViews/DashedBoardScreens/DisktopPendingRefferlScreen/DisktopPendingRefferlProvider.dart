import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_admin_web/core/database_service/database_service.dart';
import 'package:referral_admin_web/core/model/user_model.dart';

import '../../../GlobalWidgets/Colors/Colours.dart';

class DesktopPendingRefferlProvider extends ChangeNotifier {
  DesktopPendingRefferlProvider() {
    getallUser();
  }

  List<userModel> alluser = [];
  bool loading = true;
  DatabaseServices databaseServices = DatabaseServices();

  ///
  ///get all user
  ///
  getallUser() async {
    final user = await databaseServices.GetAllUser();
    //print('this is  user length ${user.length}');
    for (int i = 0; i < user.length; i++) {
      alluser.add(user[i]);
    }
    loading = false;
    print('this is all user length ${alluser.length}');
    notifyListeners();
  }

  ///
  ///request  reject function
  ///
  Reject(id, index) async {
    print('$id is going to chnage');
    alluser.removeAt(index);
    await databaseServices.RejectFunction(id);
    log('${alluser.length}');
    Get.snackbar('', 'user is rejected', backgroundColor: whiteColors);
    notifyListeners();
  }

  ///
  ///request  Accept function
  ///
  bool load = false;
  Accept(id, index) async {
    load = true;
    print('$id is going to chnage');
    alluser.removeAt(index);
    await databaseServices.AcceptFunction(id);
    log('${alluser.length}');
    Get.snackbar('', 'user is accepted', backgroundColor: whiteColors);
    load = false;
    notifyListeners();
  }
}
