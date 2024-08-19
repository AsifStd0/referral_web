import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';

class OverViewProvider extends ChangeNotifier {
  DateTimeRange? selectedDate;
  OverViewProvider() {
    GetRefferel();
  }
  final firebaseFireStore = FirebaseFirestore.instance;
  double aveJobNumber = 0.0;
  bool SpecificScreen = false;
  int? avejob;
  int totelrefferel = 0;
  int totelreffereltest = 0;
  int? toteljob = 0;
  double totelinvoiced = 0;
  int totelinvoiced1 = 0;
  int firstime = 0;
  List<Map> dowaloadList = [];
  List<Map> rangList = [];
  List<Order> orders = [];
  selectdate(DateTimeRange selectedDateRange) {
    selectedDate = selectedDateRange;
    notifyListeners();
  }

  GetRefferel() async {
    dowaloadList = [];
    SpecificScreen = true;
    notifyListeners();
    totelinvoiced = 0;
    totelrefferel = 0;
    toteljob = 0;

    try {
      var snapshot = await firebaseFireStore
          .collection('Users')
          .orderBy('DateTime', descending: true)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) async {
          var snapshot1 = await firebaseFireStore
              .collection('Users')
              .doc(element.id)
              .collection('Refferals')
              .orderBy('DateTime', descending: true)
              .get();
          if (snapshot1.docs.length > 0) {
            snapshot1.docs.forEach((element1) {
              dowaloadList.add(
                {
                  'Refferer fname': element.data()["FirstName"],
                  'Refferer lname': element.data()["LastName"],
                  'phone': element.data()["Phone"],
                  'address': element.data()["Address"],
                  'w9form': element.data()["W9Form"],
                  'email': element.data()["Email"],
                  'company': element.data()["CompanyName"],
                  'referral': snapshot1.docs.length,
                  'customer name': element1.data()["CustomerName"],
                  'customer phone': element1.data()["CustomerPhone"],
                  'customer address': element1.data()["CustomerAddress"],
                  'Date': element1.data()["DateTime"].toDate(),
                  'job number': element1.data()["JobNumber"],
                  'customer company': element1.data()["CustomerCompany"],
                  'customer email': element1.data()["CustomerEmail"],
                  'invoice amount': element1.data()["InvoicedAmount"],
                  'lead': element1.data()["Lead"],
                  'payment': element1.data()["Payment"],
                  'Description': element1.data()["DescriptionOfLoss"],
                },
              );
              if (element1.data()["Lead"] == "Lost") {
                toteljob = toteljob! + 0;
              } else if (element1.data()["Lead"] == "Sold") {
                totelinvoiced =
                    totelinvoiced + element1.data()['InvoicedAmount'];
                toteljob = toteljob! + 1;
              }
              totelrefferel = totelrefferel + 1;
              notifyListeners();
            });
            notifyListeners();
          }
        });
      }
      notifyListeners();
    } catch (e) {}
    SpecificScreen = false;
    notifyListeners();
  }

  void rangGenerateCSV() {
    for (int i = 0; i < dowaloadList.length; i++) {
      if (dowaloadList[i]["Date"].compareTo(selectedDate!.start) > 0 &&
          dowaloadList[i]["Date"].compareTo(selectedDate!.end) < 0) {
        //invoice amount
        //  log('invoice amount ${dowaloadList[i]["invoice amount"]}');
        rangList.add({
          "Refferer fname":
              "${dowaloadList[i]["Refferer fname"]} ${dowaloadList[i]["Refferer lname"]}",
          'phone': "${dowaloadList[i]["phone"]}",
          'address': "${dowaloadList[i]["address"]}",
          'w9form':
              "${dowaloadList[i]["w9form"] ? "submitted" : "not submitted"}",
          'Email': "${dowaloadList[i]["email"]}",
          'CompanyName': "${dowaloadList[i]["company"]}", //referral
          'referrals': "${dowaloadList[i]["referral"]}",
          'CustomerName': "${dowaloadList[i]["customer name"]}",
          'CustomerPhone': "${dowaloadList[i]["customer phone"]}",
          'CustomerAddress': "${dowaloadList[i]["customer address"]}",
          'DateTime': '${dowaloadList[i]["Date"]}',
          'JobNumber': "${dowaloadList[i]["job number"]}",
          'CustomerCompany': "${dowaloadList[i]["customer company"]}",
          'CustomerEmail':
              "${dowaloadList[i]["customer email"]}", //invoice amount
          'InvoicedAmount': "${dowaloadList[i]["invoice amount"] ?? 0}",
          'Lead': "${dowaloadList[i]["lead"]}",
          'Payment': "${dowaloadList[i]["payment"]}",
          'DescriptionOfLoss': "${dowaloadList[i]["Description"]}",
        });
      }
      //print('this is select date start ${selectedDate!.start}');
    }

    // for (int i = 0; i < rangList.length; i++) {
    //   print('first name ${rangList[i]["Refferer fname"]} ');
    //   print('CustomerName  ${rangList[i]["CustomerName"]}');
    //   print('InvoiceAmount is  ${rangList[i]["InvoicedAmount"]}');
    // }
    log('rang generate csv function called ${rangList.length}');
    List<String> rowHeader = [
      "Sr No.",
      "Referrer Name",
      "Referrer phone",
      "Referrer Address",
      "W9Form",
      "Referrer Email",
      "Referrer Company",
      "Customer Name",
      "Customer Phone",
      "Customer Address",
      "Date",
      "Job Number",
      "Customer Company",
      "Customer Email",
      "Invoice Amount",
      "Lead",
      "Payment",
      "Referral",
      "Description",
    ];
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);
    //Now lets add 5 data rows
    for (var order in orders) {}

    if (rangList.isNotEmpty) {
      for (int i = 0; i < rangList.length; i++) {
        print('name of ${rangList[i]["CustomerName"]}');
        // String number = dowaloadList[i].phone.toString() + '\t';
        //everytime loop executes we need to add new row
        List<dynamic> dataRow = [];
        dataRow.add("${i + 1} ");
        dataRow.add("${rangList[i]["Refferer fname"]}");
        dataRow.add("${rangList[i]["phone"]}");
        dataRow.add("${rangList[i]["address"]}");
        dataRow.add("${rangList[i]["w9form"]}");
        dataRow.add("${rangList[i]["Email"]}");
        dataRow.add("${rangList[i]["CompanyName"]}");
        dataRow.add("${rangList[i]["CustomerName"]}");
        dataRow.add("${rangList[i]["CustomerPhone"]}");
        dataRow.add("${rangList[i]["CustomerAddress"]}");
        dataRow.add("${
            // DateFormat('MM/dd/yyyy').format(
            rangList[i]["DateTime"]
            //)
            }");
        dataRow.add("${rangList[i]["JobNumber"]}");
        dataRow.add("${rangList[i]["CustomerCompany"]}");
        dataRow.add("${rangList[i]["CustomerEmail"]}");
        dataRow.add("${rangList[i]["InvoicedAmount"] ?? 0}");
        dataRow.add("${rangList[i]["Lead"]}");
        dataRow.add("${rangList[i]["Payment"]}");
        dataRow.add("${rangList[i]["referrals"]}");
        dataRow.add("${rangList[i]["DescriptionOfLoss"]}");

        //lastly add dataRow to our 2d list
        rows.add(dataRow);
      }
//now convert our 2d array into the csvlist using the plugin of csv
      String csv = const ListToCsvConverter().convert(rows);
      //this csv variable holds entire csv data
      //Now Convert or encode this csv string into utf8
      final bytes = utf8.encode(csv);
      //NOTE THAT HERE WE USED HTML PACKAGE
      final blob = html.Blob([bytes]);
      //It will create downloadable object
      final url = html.Url.createObjectUrlFromBlob(blob);
      //It will create anchor to download the file
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'referral_partner.csv';
      //finally add the csv anchor to body
      html.document.body!.children.add(anchor);
      // Cause download by calling this function
      anchor.click();
      //revoke the object
      html.Url.revokeObjectUrl(url);
      //exportedOrders = [];
      // AcceptedUser = [];
    }
  }

  void generateCSV() {
    List<String> rowHeader = [
      "Sr No.",
      "Referrer Name",
      "Referrer phone",
      "Referrer Address",
      "W9Form",
      "Referrer Email",
      "Referrer Company",
      "Customer Name",
      "Customer Phone",
      "Customer Address",
      "Date",
      "Job Number",
      "Customer Company",
      "Customer Email",
      "Invoice Amount",
      "Lead",
      "Payment",
      "Referral",
      "Description",
    ];
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);
    //Now lets add 5 data rows
    for (var order in orders) {}

    if (dowaloadList.isNotEmpty) {
      for (int i = 0; i < dowaloadList.length; i++) {
        // String number = dowaloadList[i].phone.toString() + '\t';
        //everytime loop executes we need to add new row
        List<dynamic> dataRow = [];
        dataRow.add("${i + 1} ");
        dataRow.add(
            "${dowaloadList[i]["Refferer fname"]} ${dowaloadList[i]["Refferer lname"]}");
        dataRow.add("${dowaloadList[i]["phone"]}");
        dataRow.add("${dowaloadList[i]["address"]}");
        dataRow.add(dowaloadList[i]["w9form"] ? "submitted" : "not submitted");
        dataRow.add("${dowaloadList[i]["email"]}");
        dataRow.add("${dowaloadList[i]["company"]}");
        dataRow.add("${dowaloadList[i]["customer name"]}");
        dataRow.add("${dowaloadList[i]["customer phone"]}");
        dataRow.add("${dowaloadList[i]["customer address"]}");
        dataRow
            .add("${DateFormat('MM/dd/yyyy').format(dowaloadList[i]["Date"])}");
        dataRow.add("${dowaloadList[i]["job number"]}");
        dataRow.add("${dowaloadList[i]["customer company"]}");
        dataRow.add("${dowaloadList[i]["customer email"]}");
        dataRow.add("${dowaloadList[i]["invoice amount"]}");
        dataRow.add("${dowaloadList[i]["lead"]}");
        dataRow.add("${dowaloadList[i]["payment"]}");
        dataRow.add("${dowaloadList[i]["referral"]}");
        dataRow.add("${dowaloadList[i]["Description"]}");

        //lastly add dataRow to our 2d list
        rows.add(dataRow);
      }
//now convert our 2d array into the csvlist using the plugin of csv
      String csv = const ListToCsvConverter().convert(rows);
      //this csv variable holds entire csv data
      //Now Convert or encode this csv string into utf8
      final bytes = utf8.encode(csv);
      //NOTE THAT HERE WE USED HTML PACKAGE
      final blob = html.Blob([bytes]);
      //It will create downloadable object
      final url = html.Url.createObjectUrlFromBlob(blob);
      //It will create anchor to download the file
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'referral_partner.csv';
      //finally add the csv anchor to body
      html.document.body!.children.add(anchor);
      // Cause download by calling this function
      anchor.click();
      //revoke the object
      html.Url.revokeObjectUrl(url);
      //exportedOrders = [];
      // AcceptedUser = [];
    }
  }
}
