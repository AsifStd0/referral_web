// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopHeadingsContainer.dart';
// import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/refferel_pertner_main_screen_provider.dart';
// import 'package:referral_admin_web/GlobalWidgets/NewUserButton.dart';
// import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopReferralPartnersLiewViewContainer.dart';
// import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
// import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';
// import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';

// String Globalid = '';

// class DisktopReferralPartnerMainScreen extends StatefulWidget {
//   const DisktopReferralPartnerMainScreen({
//     Key? key,
//     required this.deviceWidth,
//     this.isviewonly,
//   }) : super(key: key);

//   final double deviceWidth;
//   final isviewonly;

//   @override
//   State<DisktopReferralPartnerMainScreen> createState() =>
//       _DisktopReferralPartnerMainScreenState();
// }

// class _DisktopReferralPartnerMainScreenState
//     extends State<DisktopReferralPartnerMainScreen> {
  
//   @override
//   void initState()  {
//     //  initialize scroll controllers
//     //  _scrollController = ScrollController();
   
//     super.initState();
//   }

//   DateTimeRange? picked;
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => RefferelPartnerMainScreenProvider(),
//       child: Consumer<RefferelPartnerMainScreenProvider>(
//           builder: (BuildContext context, model, Widget? child) {
//         return Container(
//           color: Colors.transparent,
//           width: widget.deviceWidth * 0.8,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 23.h,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 34.w, right: 34.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         model.testfunction();
//                       },
//                       child: PoppinText(
//                         text: "Referral Partners",
//                         colour: blackColors,
//                         fs: 24,
//                         fw: FontWeight.bold,
//                       ),
//                     ),
//                     GestureDetector(
//                         onTap: () async {
//                           // test = 0;
//                           //_selectDateRange(context);
//                           model.rangOfCSV = [];
//                           picked = await showDateRangePicker(
//                             context: context,
//                             firstDate: DateTime(DateTime.now().year - 1),
//                             lastDate: DateTime(DateTime.now().year + 1),
//                           );

//                           if (picked != null) {
//                             model.selectdate(picked!);
//                           }
//                         },
//                         child: Icon(
//                           Icons.calendar_month_outlined,
//                           color: themeBlue,
//                         )),
//                     model.selectedDate?.start != null
//                         ? Row(
//                             children: [
//                               Container(
//                                 height: 20,
//                                 width: 200.w,
//                                 child: Center(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Start Date",
//                                         style: TextStyle(color: whiteColors),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         "${DateFormat('MM/dd/yyyy').format(model.selectedDate!.start)}",
//                                         style: TextStyle(color: whiteColors),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                     color: themeBlue,
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(10.r))),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Container(
//                                 height: 20,
//                                 width: 200.w,
//                                 child: Center(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "End Date",
//                                         style: TextStyle(color: whiteColors),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         "${DateFormat('MM/dd/yyyy').format(model.selectedDate!.end)}",
//                                         style: TextStyle(color: whiteColors),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                     color: themeBlue,
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(10.r))),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {});
//                                   model.selectedDate = null;
//                                   // model.selectedDate!.start =
//                                   //     DateTime(0, 0, 0);
//                                   //model.GetRefferel();
//                                 },
//                                 child: Container(
//                                   height: 20,
//                                   width: 60,
//                                   child: Center(
//                                     child: Text(
//                                       'Reset',
//                                       style: TextStyle(color: whiteColors),
//                                     ),
//                                   ),
//                                   decoration: BoxDecoration(
//                                       color: themeBlue,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(10.r))),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : SizedBox(),
//                     GestureDetector(
//                       onTap: () {
//                         model.selectedDate == null
//                             ? model.generateCSV()
//                             : model.ranggenerateCSV();
//                         //  model.GetAcceptedUser();
//                         model.RefferelUser();
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: themeBlue.withOpacity(.9),
//                           borderRadius: BorderRadius.all(Radius.circular(5.r)),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Download CSV',
//                             style: TextStyle(color: whiteColors),
//                           ),
//                         ),
//                         height: 40.h,
//                         width: 150.w,
//                       ),
//                     ),
//                     if (!widget.isviewonly)
//                       Consumer<ReferalPartnerProvider>(builder:
//                           (BuildContext context, value, Widget? child) {
//                         return InkWell(
//                             onTap: () {
//                               value.setValue(2);
//                             },
//                             child: NewUserButton());
//                       }),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 13.h,
//               ),

//               ///
//               ///------> Heading
//               ///
//               DisktopHeadingsContainer(
//                 model: model,
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 40.w, right: 10.h),
//                 child: TextFormField(
//                   keyboardType: TextInputType.text,
//                   onChanged: (val) {
//                     model.searchfunction(val);
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     hintText: 'Search City',
//                     hintStyle: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFFD8D4D4),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide(
//                         width: 1.5.w,
//                         color: Color(0xFFD8D4D4),
//                         // style: BorderStyle.none,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide(
//                         width: 1.5.w,
//                         color: Color(0xFFD8D4D4),
//                         // style: BorderStyle.none,
//                       ),
//                     ),
//                     filled: true,
//                     contentPadding: EdgeInsets.all(16),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 18.h,
//               ),
//               Container(
//                 height: 750.h,
//                 child: model.loaded == false
//                     ? Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : model.nouser
//                         ? Center(child: Text(""))
//                         : Scrollbar(
//                             thumbVisibility: true,
//                             thickness: 8,
//                             child: ListView.builder(
//                                 itemCount: model.AcceptedUser.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   if (model.searchCity.isEmpty
//                                       // && model.selectedDate?.start == null
//                                       ) {
//                                     return DisktopReferralPartnersLiewViewContainer(
//                                       startdate:
//                                           model.selectedDate?.start.toString(),
//                                       enddate:
//                                           model.selectedDate?.end.toString(),
//                                       model: model,
//                                       index: index,
//                                       isviewonly: widget.isviewonly,
//                                       index1: index,
//                                       date: model.AcceptedUser[index].Datetime,
//                                       id: model.temp[index]["id"],
//                                       isadmin:
//                                           model.AcceptedUser[index].IsAdmin,
//                                       ondelettap: () {
//                                         Get.defaultDialog(
//                                             title: "Alert Dialog",
//                                             middleText:
//                                                 "Do you really want to delete ${model.temp[index]["fname"]} ${model.temp[index]["lname"]}?",
//                                             backgroundColor: themeBlue,
//                                             titleStyle:
//                                                 TextStyle(color: Colors.white),
//                                             middleTextStyle:
//                                                 TextStyle(color: Colors.white),
//                                             buttonColor: whiteColors,
//                                             confirmTextColor: themeBlue,
//                                             cancelTextColor: Colors.white,
//                                             onConfirm: () {
//                                               Get.back();
//                                               print('user deleted');
//                                               model.ondeletfunction(
//                                                   model.AcceptedUser[index].id,
//                                                   model.AcceptedUser[index]
//                                                       .email);
//                                               model.GetAcceptedUseronSecondtime(
//                                                   index);
//                                             },
//                                             onCancel: () {
//                                               Get.back();
//                                             });
//                                       },
//                                     );
//                                   } else {
//                                     if (model.AcceptedUser[index].city
//                                         .toString()
//                                         .toLowerCase()
//                                         .contains(model.searchCity
//                                             .toString()
//                                             .toLowerCase())) {
//                                       return DisktopReferralPartnersLiewViewContainer(
//                                         model: model,
//                                         startdate: model.selectedDate?.start
//                                             .toString(),
//                                         enddate:
//                                             model.selectedDate?.end.toString(),
//                                         isviewonly: widget.isviewonly,
//                                         index: index,
//                                         index1: index,
//                                         id: model.AcceptedUser[index].id,
//                                         isadmin:
//                                             model.AcceptedUser[index].IsAdmin,
//                                         date:
//                                             model.AcceptedUser[index].Datetime,
//                                         ondelettap: () {
//                                           Get.defaultDialog(
//                                               title: "Alert Dialog",
//                                               middleText:
//                                                   "Do you really want to delete ${model.temp[index]["fname"]} ${model.temp[index]["lname"]}?",
//                                               backgroundColor: themeBlue,
//                                               titleStyle: TextStyle(
//                                                   color: Colors.white),
//                                               middleTextStyle: TextStyle(
//                                                   color: Colors.white),
//                                               buttonColor: whiteColors,
//                                               confirmTextColor: themeBlue,
//                                               cancelTextColor: Colors.white,
//                                               onConfirm: () {
//                                                 Get.back();
//                                                 print('user deleted');
//                                                 model.ondeletfunction(
//                                                     model
//                                                         .AcceptedUser[index].id,
//                                                     model.AcceptedUser[index]
//                                                         .email);
//                                                 model
//                                                     .GetAcceptedUseronSecondtime(
//                                                         index);
//                                               },
//                                               onCancel: () {
//                                                 Get.back();
//                                               });
//                                         },
//                                       );
//                                     }
//                                     return Container(
//                                       height: 0,
//                                     );
//                                   }
//                                 }),
//                           ),
//                 //),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
