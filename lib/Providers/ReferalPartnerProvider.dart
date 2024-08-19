import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:referral_admin_web/core/database_service/database_service.dart';
import 'package:referral_admin_web/core/model/user_model.dart';

class ReferalPartnerProvider with ChangeNotifier {
  ReferalPartnerProvider() {
    //getallUser();
    // GetAcceptedUser();
    // print(refferelPartnerMainScreenProvider.)
  }

  /// RefferelPartnerMainScreenProvider refferelPartnerMainScreenProvider =
  ///   RefferelPartnerMainScreenProvider();
  // List<userModel> alluser = [];
  List<userModel> AcceptedUser = [];
  DatabaseServices databaseServices = DatabaseServices();

  GetAcceptedUser() async {
    final user = await databaseServices.AcceptedUser();
    print('this is  AcceptedUser length ${user.length} ');
    for (int i = 0; i < user.length; i++) {
      AcceptedUser.add(user[i]);
      log('this is refferel ${AcceptedUser[i].refferals}');
    }
    print('this is AcceptedUser  length ${AcceptedUser.length}');
  }

  int PartnerDoesScreen = 0;
  bool newReferralPartner = false;
  bool EditReferralPartner = false;

  get getPartnerDoesreferralReportScreen => PartnerDoesScreen;
  get getNewReferralPartner => PartnerDoesScreen;
  get getEditReferralPartner => EditReferralPartner;

  setValue(int PartnerDoesScreen1) {
    PartnerDoesScreen = PartnerDoesScreen1;
    notifyListeners();
  }

  setNewReferralValue(bool trueOrFalse) {
    newReferralPartner = trueOrFalse;
    notifyListeners();
  }

  setEditReferralPartner(bool trueOrFalse) {
    EditReferralPartner = trueOrFalse;
    notifyListeners();
  }
}
