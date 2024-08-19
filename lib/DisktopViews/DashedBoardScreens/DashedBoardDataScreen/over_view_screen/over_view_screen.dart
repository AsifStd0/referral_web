import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopListDataContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/over_view_screen/over_view_provider.dart';
import '../../../../GlobalWidgets/PoppinText.dart';
import '../../../../MobileViews/Mobile_res/Colors/Colours.dart';
import '../DisktopOverviewContainersROW/DisktopOverViewStatesContainer.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
    this.isviewonly,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;
  final isviewonly;

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    int totalrefferel = 0;
    int test = 0;
    bool getData = false;
    DateTimeRange? picked;
    DateTime? starteDate;
    DateTime? EndDate;
    List<String> date = [];
    DateTimeRange? _selectedDateRange;
    return ChangeNotifierProvider(
        create: (context) => OverViewProvider(),
        child: Consumer<OverViewProvider>(
            builder: (BuildContext context, model, Widget? child) {
          return Padding(
            padding: EdgeInsets.only(
              left: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widget.deviceWidth * 0.8,
                  height: widget.deviceHeight * .99 - 65.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinText(
                            text: "Overview & Stats",
                            colour: blackColors,
                            fs: 24,
                            fw: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              model.selectedDate == null
                                  ? print(
                                      'generateCSV called ${model.selectedDate}')
                                  : print(
                                      "rangGenerateCSV called ${model.selectedDate}");

                              model.selectedDate == null
                                  ? model.generateCSV()
                                  : model.rangGenerateCSV();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: themeBlue.withOpacity(.9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                              ),
                              child: Center(
                                  child: Text(
                                'Download CSV',
                                style: TextStyle(color: whiteColors),
                              )),
                              height: 40.h,
                              width: 150.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Consumer<OverViewProvider>(
                        builder: (BuildContext context, model, Widget? child) {
                          var f = NumberFormat("###,###", "en_US");
                          String Invoiced = f.format(int.parse(
                              "${model.totelinvoiced.toStringAsFixed(0)}"));
                          String aveRefferel = f.format(int.parse(
                              "${(model.totelinvoiced == 0 ? 0 : model.totelinvoiced / model.totelrefferel!).toStringAsFixed(0)}"));
                          return model.SpecificScreen
                              ? Center(child: CircularProgressIndicator())
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DisktopOverViewStatesContainer(
                                      pLeft: 10.w,
                                      pRight: 10.w,
                                      title: "Referrals",
                                      titleValue:
                                          "${model.totelrefferel.toString()}",
                                    ),
                                    DisktopOverViewStatesContainer(
                                      pLeft: 10.w,
                                      pRight: 10.w,
                                      title: "Jobs Sold",
                                      titleValue: "${model.toteljob}",
                                    ),
                                    DisktopOverViewStatesContainer(
                                      pLeft: 10.w,
                                      pRight: 10.w,
                                      title: "Total Invoiced",
                                      titleValue: "\$$Invoiced",
                                    ),
                                    DisktopOverViewStatesContainer(
                                      pLeft: 10.w,
                                      pRight: 10.w,
                                      title: "Avg. Referral Invoice",
                                      titleValue: model.totelinvoiced == 0
                                          ? 0.toString()
                                          : "\$$aveRefferel",
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    )
                                  ],
                                );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('test');
                              // model.Test1();
                            },
                            child: Container(
                              // color: Colors.amber,
                              child: PoppinText(
                                text: "All Users Referral Leads",
                                colour: blackColors,
                                fs: 20,
                                fw: FontWeight.w300,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          GestureDetector(
                              onTap: () async {
                                model.rangList.clear();
                                test = 0;
                                picked = await showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime(DateTime.now().year - 1),
                                  lastDate: DateTime(DateTime.now().year + 1),
                                );

                                if (picked != null) {
                                  model.selectdate(picked!);
                                }
                              },
                              child: Icon(
                                Icons.calendar_month_outlined,
                                color: themeBlue,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          model.selectedDate?.start != null
                              ? Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 200.w,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Start Date",
                                              style:
                                                  TextStyle(color: whiteColors),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${DateFormat('MM/dd/yyyy').format(model.selectedDate!.start)}",
                                              style:
                                                  TextStyle(color: whiteColors),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: themeBlue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r))),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 200.w,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "End Date",
                                              style:
                                                  TextStyle(color: whiteColors),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${DateFormat('MM/dd/yyyy').format(model.selectedDate!.end)}",
                                              style:
                                                  TextStyle(color: whiteColors),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: themeBlue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r))),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {});
                                        model.selectedDate = null;
                                        // model.selectedDate!.start =
                                        //     DateTime(0, 0, 0);
                                        //model.GetRefferel();
                                        print(
                                            'end date ${model.selectedDate!.end}');
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 60,
                                        child: Center(
                                          child: Text(
                                            'Reset',
                                            style:
                                                TextStyle(color: whiteColors),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: themeBlue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.r))),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                      SizedBox(
                        height: widget.deviceHeight * 0.72 - 52.h,
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Users")
                              .orderBy('DateTime', descending: true)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: Text(""),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return

                                  // ScrollConfiguration(
                                  //   behavior: ScrollConfiguration.of(context)
                                  //       .copyWith(scrollbars: false),
                                  //   child:
                                  ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  // shrinkWrap: true,
                                  // controller: ScrollController(
                                  //     initialScrollOffset: 2.0),
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    String docId =
                                        snapshot.data!.docs[index].id;
                                    return StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection("Users")
                                          .doc(docId)
                                          .collection("Refferals")
                                          .orderBy('DateTime', descending: true)
                                          .snapshots(),
                                      builder: (context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot1) {
                                        if (!snapshot1.hasData) {
                                          return Center(
                                            child: Text(""),
                                          );
                                        } else if (snapshot1.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          int? temp = 0;
                                          return Container(
                                            child: ScrollConfiguration(
                                              behavior: ScrollConfiguration.of(
                                                      context)
                                                  .copyWith(scrollbars: false),
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: snapshot1
                                                      .data!.docs.length,
                                                  itemBuilder:
                                                      (context, index1) {
                                                    // snapshot1.data!.docs[index1]
                                                    //     ['DateTime'];
                                                    if (index1 == 0) {
                                                      print(
                                                          '${totalrefferel + snapshot1.data!.docs.length}');
                                                      totalrefferel =
                                                          totalrefferel +
                                                              snapshot1.data!
                                                                  .docs.length;
                                                      for (int i = 0;
                                                          i <
                                                              snapshot1.data!
                                                                  .docs.length;
                                                          i++) {
                                                        temp = temp! +
                                                            (int.parse(snapshot1
                                                                .data!
                                                                .docs[i][
                                                                    'InvoicedAmount']
                                                                .toString()));
                                                      }
                                                    }

                                                    return Container(
                                                      child: DisktopListDataContainer(
                                                          isviewonly:
                                                              widget.isviewonly,
                                                          index: index1,
                                                          startDate: model
                                                              .selectedDate
                                                              ?.start,
                                                          endtDate: model
                                                              .selectedDate
                                                              ?.end,
                                                          refferelLength:
                                                              snapshot1.data!
                                                                  .docs.length,
                                                          aveJob: temp! /
                                                              snapshot1.data!
                                                                  .docs.length,
                                                          snap1: snapshot1.data!
                                                              .docs[index1],
                                                          snap2: snapshot.data!
                                                              .docs[index],
                                                          deviceWidth: widget
                                                              .deviceWidth),
                                                    );
                                                  }),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                ),
                              );
                              //);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

Future<void> _selectDateRange(BuildContext context) async {
  final DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime(DateTime.now().year - 1),
    lastDate: DateTime(DateTime.now().year + 1),
  );

  if (picked != null) {
    print('Selected date range: ${picked.start} - ${picked.end}');
  }
}
