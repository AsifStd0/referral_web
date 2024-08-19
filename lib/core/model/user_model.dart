import 'package:cloud_firestore/cloud_firestore.dart';

class userModel {
  String? id;
  String? refderedBy;
  String? password;
  DateTime? Datetime;
  String? lastName;
  String? avatar;
  String? accepted;
  String? address;
  String? jobTittle;
  String? companyName;

  ///
  ///---> part will implement after cleaning the database
  ///
  String? city;
  bool? emailVerified;
  String? firstName;
  bool? w9Form;
  String? phone;
  int? refferals;
  bool? verified;
  bool? loading = false;
  String? udid;
  int? avgJobValue;
  String? email;
  List<int>? jobsold = [];
  bool? IsAdmin;

  userModel(
      {this.refderedBy,
      this.id,
      this.password,
      this.lastName,
      this.avatar,
      this.accepted,
      this.Datetime,
      this.address,
      this.jobTittle,
      this.companyName,
      this.city,
      this.emailVerified,
      this.firstName,
      this.w9Form,
      this.phone,
      this.refferals,
      this.verified,
      this.udid,
      this.loading,
      this.avgJobValue,
      this.jobsold,
      this.IsAdmin,
      this.email});

  userModel.fromJson(json, id) {
    this.id = id;
    refderedBy = json['RefderedByName'];
    var timestamp = json['DateTime'] as Timestamp;
    Datetime = timestamp.toDate();
    password = json['Password'];
    lastName = json['LastName'];
    city = json['city'];
    avatar = json['Avatar'];
    accepted = json['Accepted'];
    address = json['Address'];
    jobTittle = json['JobTittle'];
    companyName = json['CompanyName'];
    emailVerified = json['EmailVerified'];
    firstName = json['FirstName'];
    w9Form = json['W9Form'];
    phone = json['Phone'];
    refferals = json['Refferals'];
    verified = json['Verified'];
    udid = json['Udid'];
    IsAdmin = json['IsAdmin'];
    avgJobValue = json['AvgJobValue'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RefderedBy'] = this.refderedBy;
    data['Password'] = this.password;
    data['LastName'] = this.lastName;
    data['city'] = this.city;
    data['DateTime'] = this.Datetime;
    data['Avatar'] = this.avatar;
    data['Accepted'] = this.accepted;
    data['Address'] = this.address;
    data['JobTittle'] = this.jobTittle;
    data['CompanyName'] = this.companyName;
    data['EmailVerified'] = this.emailVerified;
    data['FirstName'] = this.firstName;
    data['W9Form'] = this.w9Form;
    data['Phone'] = this.phone;
    data['Refferals'] = this.refferals;
    data['Verified'] = this.verified;
    data['Udid'] = this.udid;
    data['AvgJobValue'] = this.avgJobValue;
    data['Email'] = this.email;
    data['IsAdmin'] = this.IsAdmin;
    return data;
  }
}
