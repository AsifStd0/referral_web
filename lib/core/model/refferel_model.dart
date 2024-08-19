import 'package:cloud_firestore/cloud_firestore.dart';

class refferelModel {
  String? payment;
  String? id;
  DateTime? dateTime;
  String? customerCompany;
  String? customerAddress;
  int? invoicedAmount;
  String? jobNumber;
  String? customerEmail;
  String? customerName;
  String? customerPhone;
  String? descriptionOfLoss;
  String? lead;

  refferelModel(
      {this.payment,
      this.dateTime,
      this.id,
      this.customerCompany,
      this.customerAddress,
      this.invoicedAmount,
      this.jobNumber,
      this.customerEmail,
      this.customerName,
      this.customerPhone,
      this.descriptionOfLoss,
      this.lead});

  refferelModel.fromJson(json, id) {
    this.id = id;
    payment = json['Payment'];
     var timestamp = json['DateTime'] as Timestamp;
     dateTime = timestamp.toDate();
  // dateTime = json['DateTime'];
    customerCompany = json['CustomerCompany'];
    customerAddress = json['CustomerAddress'];
    invoicedAmount = json['InvoicedAmount'];
    jobNumber = json['JobNumber'];
    customerEmail = json['CustomerEmail'];
    customerName = json['CustomerName'];
    customerPhone = json['CustomerPhone'];
    descriptionOfLoss = json['DescriptionOfLoss'];
    lead = json['Lead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Payment'] = this.payment;
    data['DateTime'] = this.dateTime;
    data['CustomerCompany'] = this.customerCompany;
    data['CustomerAddress'] = this.customerAddress;
    data['InvoicedAmount'] = this.invoicedAmount;
    data['JobNumber'] = this.jobNumber;
    data['CustomerEmail'] = this.customerEmail;
    data['CustomerName'] = this.customerName;
    data['CustomerPhone'] = this.customerPhone;
    data['DescriptionOfLoss'] = this.descriptionOfLoss;
    data['Lead'] = this.lead;
    return data;
  }
}
