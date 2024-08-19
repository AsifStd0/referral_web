import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referral_admin_web/core/database_service/database_service.dart';
import 'package:referral_admin_web/core/model/user_model.dart';
import 'dart:html' as html;

class RefferelPartnerMainScreenProvider extends ChangeNotifier {
  RefferelPartnerMainScreenProvider() {
    // GetAcceptedUser();
    RefferelUser();
    // RefferelUser();
  }

  String searchCity = '';
  int num = 2;
  List<userModel> AcceptedUser = [];
  List<Order> orders = [];
  final List<int> RefferelLength = [];
  List<int> jobNumber = [];
  final List<int> totalInvoied = [];
  List<Map> rangOfCSV = [];
  bool loaded = false;
  bool nouser = false;
  DateTimeRange? selectedDate;

  selectdate(DateTimeRange selectedDateRange) {
    selectedDate = selectedDateRange;
    print('function called');
    print('start date is ${selectedDateRange.start.day}');
    notifyListeners();
  }

  searchfunction(val) {
    searchCity = val;
    notifyListeners();
  }

  final firebaseFireStore = FirebaseFirestore.instance;
  DatabaseServices databaseServices = DatabaseServices();

  List<Map> temp = [];
  getdata() {
    for (int i = 0; i < jobNumber.length; i++) {
      temp.add({
        'jobNumber': jobNumber[i],
        'invoice': totalInvoied[i],
        'referal': RefferelLength[i],
        'fname': AcceptedUser[i].firstName,
        'lname': AcceptedUser[i].lastName,
        'city': AcceptedUser[i].city,
        'id': AcceptedUser[i].id,
        'date': AcceptedUser[i].Datetime,
        'job': AcceptedUser[i].jobTittle,
        'company': AcceptedUser[i].companyName,
        'refderedBy': AcceptedUser[i].refderedBy,
        "email": AcceptedUser[i].email,
        "position": AcceptedUser[i].jobTittle
      });
    }
  }

  sortbyinvoice() {
    temp.sort((a, b) => (a['invoice']).compareTo(b['invoice']));
    notifyListeners();
  }

  sortInvoiceDesending() {
    temp.sort((a, b) => (b['invoice']).compareTo(a['invoice']));
    notifyListeners();
  }

  sortJobNumberAsending() {
    temp.sort((a, b) => (b['jobNumber']).compareTo(a['jobNumber']));
    num = 0;
    print('this is jobnumber');
    for (int i = 0; i < temp.length; i++) {
      print('this is job number ${temp[i]['jobNumber']}');
    }
    notifyListeners();
  }

  sortJobNumberdesending() {
    temp.sort((a, b) => (a['jobNumber']).compareTo(b['jobNumber']));
    num = 1;
    notifyListeners();
  }

  sortrefferelAsending() {
    temp.sort((a, b) => (b['referal']).compareTo(a['referal']));
    print('this is referal function');
    for (int i = 0; i < temp.length; i++) {
      print('this is job number ${temp[i]['referal']}');
    }
    notifyListeners();
  }

  sortreffereldesending() {
    temp.sort((a, b) => (a['referal']).compareTo(b['referal']));
    notifyListeners();
  }

  /// refferel section

  Future RefferelUser() async {
    final List<userModel> list = [];
    jobNumber = [];
    AcceptedUser = [];

    try {
      QuerySnapshot snapshot1 = await FirebaseFirestore.instance
          .collection('Users')
          .orderBy('DateTime', descending: true)
          .where("Accepted", isEqualTo: "Accepted")
          .get();
      if (snapshot1.docs.length > 0) {
        snapshot1.docs.forEach((element) {
          list.add(userModel.fromJson(element, element.id));
          AcceptedUser.add(userModel.fromJson(element, element.id));
        });
        notifyListeners();
      } else {
        nouser = true;
        print("No Users found");
      }
      print("Accepted data loaded now show it ${DateTime.now()}");
      for (int i = 0; i < list.length; i++) {
        log('checking referral in the user list $i accept user ${AcceptedUser.length} ${jobNumber.length}');
        var snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(list[i].id)
            .collection('Refferals')
            .get();
        RefferelLength.add(snapshot.docs.length);
        if (snapshot.docs.length == 0) {
          jobNumber.add(0);
          totalInvoied.add(0);
        } else {
          int? temp = 0;
          int? invoicetemp = 0;
          snapshot.docs.forEach((element) {
            //ALLRefferel.add(refferelModel.fromJson(element.data(), element.id));
            if (element.data()["Lead"] == "Sold") {
              temp = temp! + 1;
              invoicetemp =
                  invoicetemp! + (element.data()['InvoicedAmount']) as int?;
            }
          });
          jobNumber.add(temp!);
          totalInvoied.add(invoicetemp!);
        }
      }
      getdata();
      loaded = true;
      notifyListeners();
    } catch (e) {
      print('Exception@DatabaseServices/getAllAppUsers............. ==> $e');
    }
    // return list;
  }

  ///this is delet function
  ondeletfunction(id, email) async {
    log('delet function called');
    await FirebaseFirestore.instance.collection('Users').doc(id).delete();
  }

  ///
  /// I remove data from list localley and when it rebuild it will also remove from database
  ///
  GetAcceptedUseronSecondtime(index) async {
    AcceptedUser.removeAt(index);
    temp.removeAt(index);
    jobNumber.removeAt(index);
    log('after removel length of AcceptedUser ${AcceptedUser.length}');
    notifyListeners();
  }

  testfunction() {
    log('test function called ${rangOfCSV.length}');
  }

  // List<Order> exportedOrders = [];

  void generateCSV() {
    for (int i = 0; i < AcceptedUser.length; i++) {
      print(
          'Date: ${DateFormat('MM/dd/yyyy').format(AcceptedUser[i].Datetime!)} ');
    }
    // we will declare the list of headers that we want
    List<String> rowHeader = [
      "Sr No.",
      "Name",
      "Email",
      "Address",
      "Mobile no",
      "Referred By",
      "Company Name",
      "Job Title",
      "Refferal",
      "Jobs Sold",
      "Total Invoiced",
      "Date"
    ];
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);
    //Now lets add 5 data rows
    for (var order in orders) {}

    if (AcceptedUser.isNotEmpty) {
      for (int i = 0; i < AcceptedUser.length; i++) {
        String number = AcceptedUser[i].phone.toString() + '\t';
        //everytime loop executes we need to add new row
        List<dynamic> dataRow = [];
        dataRow.add("${i + 1} ");
        dataRow.add("${AcceptedUser[i].firstName} ${AcceptedUser[i].lastName}");
        dataRow.add("${AcceptedUser[i].email}");
        dataRow.add("${AcceptedUser[i].address}");
        dataRow.add("${AcceptedUser[i].phone! + '\t'} ");
        dataRow.add("${AcceptedUser[i].refderedBy}");
        dataRow.add("${AcceptedUser[i].companyName}");
        dataRow.add("${AcceptedUser[i].jobTittle}");
        dataRow.add("${RefferelLength[i]}");
        dataRow.add("${jobNumber[i]}");
        dataRow.add("${totalInvoied[i]}");
        dataRow.add(
            "${DateFormat('MM/dd/yyyy').format(AcceptedUser[i].Datetime!)}");
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
      AcceptedUser = [];
    }
  }

  void ranggenerateCSV() {
    for (int i = 0; i < jobNumber.length; i++) {
      if (selectedDate?.start != null) if (AcceptedUser[i]
                  .Datetime!
                  .compareTo(selectedDate!.start) >
              0 &&
          AcceptedUser[i].Datetime!.compareTo(selectedDate!.end) < 0) {
        rangOfCSV.add({
          "Name": '${temp[i]["fname"]} ${temp[i]["lname"]}',
          "Email": '${AcceptedUser[i].email}',
          "Address": '${AcceptedUser[i].address}',
          "Mobile no": '${AcceptedUser[i].phone! + '\t'} ',
          "Referred By": "${AcceptedUser[i].refderedBy}",
          "Company Name": "${AcceptedUser[i].companyName}",
          "Job Title": "${AcceptedUser[i].jobTittle}",
          "Refferal": "${RefferelLength[i]}",
          "Jobs Sold": "${jobNumber[i]}",
          "Total Invoiced": "${totalInvoied[i]}",
          "Date":
              "${DateFormat('MM/dd/yyyy').format(AcceptedUser[i].Datetime!)}}"
        });
      }
    }
    // we will declare the list of headers that we want

    List<String> rowHeader = [
      "Sr No.",
      "Name",
      "Email",
      "Address",
      "Mobile no",
      "Referred By",
      "Company Name",
      "Job Title",
      "Refferal",
      "Jobs Sold",
      "Total Invoiced",
      "Date"
    ];
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);
    //Now lets add 5 data rows
    for (var order in orders) {}

    if (AcceptedUser.isNotEmpty) {
      for (int i = 0; i < rangOfCSV.length; i++) {
        // String number = AcceptedUser[i].phone.toString() + '\t';
        //everytime loop executes we need to add new row
        List<dynamic> dataRow = [];
        dataRow.add("${i + 1} ");
        dataRow.add("${rangOfCSV[i]['Name']}");
        dataRow.add("${rangOfCSV[i]['Email']}");
        dataRow.add("${rangOfCSV[i]['Address']}");
        dataRow.add("${rangOfCSV[i]['Mobile no'] + '\t'} ");
        dataRow.add("${rangOfCSV[i]['Referred By']}");
        dataRow.add("${rangOfCSV[i]['Company Name']}");
        dataRow.add("${rangOfCSV[i]['Job Title']}");
        dataRow.add("${rangOfCSV[i]['Refferal']}");
        dataRow.add("${rangOfCSV[i]['Jobs Sold']}");
        dataRow.add("${rangOfCSV[i]['Total Invoiced']}");
        dataRow.add("${rangOfCSV[i]['Date']}");
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
      AcceptedUser = [];
    }
  }
}
