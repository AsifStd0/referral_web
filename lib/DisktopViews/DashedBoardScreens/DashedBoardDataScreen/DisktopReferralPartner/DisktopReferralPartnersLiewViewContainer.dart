import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopReferralPartnerMainScreen.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/refferel_pertner_main_screen_provider.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/global%20Lists/GlobalList.dart';

class DisktopReferralPartnersLiewViewContainer extends StatelessWidget {
  DisktopReferralPartnersLiewViewContainer({
    Key? key,
    required this.index1,
    this.startdate,
    this.index,
    this.enddate,
    required this.model,
    this.ondelettap,
    this.id,
    this.isviewonly,
    this.isadmin,
    this.date,
  }) : super(key: key);
  int index1;
  final isviewonly;
  RefferelPartnerMainScreenProvider model;

  final index;
  final startdate;
  final enddate;
  final date;
  final id;
  final ondelettap;
  final isadmin;
  @override
  Widget build(BuildContext context) {
    print('this is index $index ${date.runtimeType}');
    // if (model.selectedDate?.start != null) if (date.compareTo(startdate) > 0 &&
    //     date.compareTo(enddate) < 0) {
    //   model.rangOfCSV.add({
    //     "Name": '${model.temp[index]["fname"]} ${model.temp[index]["lname"]}',
    //     "Email": '${model.AcceptedUser[index].email}',
    //     "Address": '${model.AcceptedUser[index].address}',
    //     "Mobile no": '${model.AcceptedUser[index].phone! + '\t'} ',
    //     "Referred By": "${model.AcceptedUser[index].refderedBy}",
    //     "Company Name": "${model.AcceptedUser[index].companyName}",
    //     "Job Title": "${model.AcceptedUser[index].jobTittle}",
    //     "Refferal": "${model.RefferelLength[index]}",
    //     "Jobs Sold": "${model.jobNumber[index]}",
    //     "Total Invoiced": "${model.totalInvoied[index]}"
    //   });
    // }
    return model.selectedDate?.start != null
        ? date.compareTo(startdate) > 0 && date.compareTo(enddate) < 0
            ? Padding(
                padding: EdgeInsets.only(left: 30.w, top: 10.h),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(.19),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 215.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    // color: Colors.blueAccent,
                                    width: 169.w,
                                    child: Column(
                                      children: [
                                        PoppinText(
                                            text: 'Name',
                                            colour: themeBlue,
                                            fs: 18,
                                            fw: FontWeight.w600),
                                        customSizedBox(),
                                        Padding(
                                          padding: EdgeInsets.only(left: 12.w),
                                          child: PoppinText(
                                              text:
                                                  '${model.temp[index]["fname"]} ${model.temp[index]["lname"]}',
                                              colour: blackColors,
                                              fs: 18),
                                        ),
                                      ],
                                    )),
                                Container(
                                    // color: Colors.black,
                                    width: 170.w,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: [
                                          PoppinText(
                                              text: 'City',
                                              colour: themeBlue,
                                              fs: 18,
                                              fw: FontWeight.w600),
                                          customSizedBox(),
                                          PoppinText(
                                              text:
                                                  '${model.temp[index]["city"]}',
                                              colour: blackColors,
                                              fs: 18),
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: 220.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: Column(
                                        children: [
                                          PoppinText(
                                              text: 'referral',
                                              colour: themeBlue,
                                              fs: 18,
                                              fw: FontWeight.w600),
                                          customSizedBox(),
                                          PoppinText(
                                              text: model.RefferelLength
                                                          .length !=
                                                      null
                                                  ? ' ${model.temp[index]["referal"]}'
                                                  : '0',
                                              colour: blackColors,
                                              fs: 18),
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: 220.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 50.w),
                                      child: Column(
                                        children: [
                                          PoppinText(
                                              text: 'Jobs Sold ${model.num}',
                                              colour: themeBlue,
                                              fs: 18,
                                              fw: FontWeight.w600),
                                          customSizedBox(),
                                          PoppinText(
                                              text:
                                                  '${model.temp[index]["jobNumber"]}',
                                              colour: blackColors,
                                              fs: 18),
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: 245.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 70.w),
                                      child: Column(
                                        children: [
                                          PoppinText(
                                              text: 'Total Invoice',
                                              colour: themeBlue,
                                              fs: 18,
                                              fw: FontWeight.w600),
                                          customSizedBox(),
                                          PoppinText(
                                              text:
                                                  '\$${model.temp[index]["invoice"].toStringAsFixed(0)}',
                                              colour: blackColors,
                                              fs: 18),
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: 274.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Column(
                                        children: [
                                          PoppinText(
                                              text: 'Av.Referal invoice',
                                              colour: themeBlue,
                                              fs: 18,
                                              fw: FontWeight.w600),
                                          customSizedBox(),
                                          PoppinText(
                                              text: model.temp[index]
                                                          ["referal"] ==
                                                      0
                                                  ? '0'
                                                  : '\$${(model.temp[index]["invoice"] / model.temp[index]["referal"]).toStringAsFixed(0)}',
                                              colour: blackColors,
                                              fs: 18),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 55.w,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      PoppinText(
                                          text: 'Action',
                                          colour: themeBlue,
                                          fs: 18,
                                          fw: FontWeight.w600),
                                      customSizedBox(),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Consumer<ReferalPartnerProvider>(
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return InkWell(
                                                onTap: isviewonly
                                                    ? () {}
                                                    : () {
                                                        value.setValue(1);
                                                        //  model.GetRefferel(id);
                                                        Globalid = id;
                                                        //print('this is current id $id');
                                                      },
                                                child: Icon(
                                                  referralPartnersList[index]
                                                      .eyeIcon,
                                                  size: 28.sp,
                                                  color: isviewonly
                                                      ? lightGrey
                                                          .withOpacity(.2)
                                                      : lightGrey,
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: 29.w,
                                          ),
                                          GestureDetector(
                                            onTap:
                                                isviewonly ? () {} : ondelettap,
                                            child: Icon(
                                              Icons.delete,
                                              color: isviewonly
                                                  ? Colors.red.withOpacity(.2)
                                                  : Colors.red,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 18.w,
                                          ),
                                          Consumer<ReferalPartnerProvider>(
                                              builder: (BuildContext context,
                                                  value, Widget? child) {
                                            return InkWell(
                                              onTap: isviewonly
                                                  ? () {}
                                                  : () {
                                                      Globalid = id;
                                                      print(
                                                          'this is globle id $Globalid');
                                                      value.setValue(4);
                                                    },
                                              child: Image.asset(
                                                referralPartnersList[index]
                                                    .editImage,
                                                color: isviewonly
                                                    ? lightGrey.withOpacity(.2)
                                                    : lightGrey,
                                                scale: 6,
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    width: 185.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: Column(
                                        children: [
                                          PoppinText(
                                            text: 'Company position',
                                            colour: themeBlue,
                                            fs: 18,
                                            fw: FontWeight.w600,
                                          ),
                                          customSizedBox(),
                                          PoppinText(
                                              text:
                                                  '${model.temp[index]["position"]}',
                                              //'${model.AcceptedUser[index].jobTittle}',
                                              colour: blackColors,
                                              fs: 18),
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: 190.w,
                                    child: Column(
                                      children: [
                                        PoppinText(
                                          text: 'Company',
                                          colour: themeBlue,
                                          fs: 18,
                                          fw: FontWeight.w600,
                                        ),
                                        customSizedBox(),
                                        PoppinText(
                                            text:
                                                '${model.temp[index]["company"]}',
                                            colour: blackColors,
                                            fs: 18)
                                      ],
                                    )),
                                Container(
                                  width: 200.w,
                                  child: Column(
                                    children: [
                                      PoppinText(
                                        text: 'referred by',
                                        colour: themeBlue,
                                        fs: 18,
                                        fw: FontWeight.w600,
                                      ),
                                      customSizedBox(),
                                      PoppinText(
                                          text:
                                              '${model.temp[index]["refderedBy"]}',
                                          colour: blackColors,
                                          fs: 18)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200.w,
                                  child: Column(
                                    children: [
                                      PoppinText(
                                        text: 'Date',
                                        colour: themeBlue,
                                        fs: 18,
                                        fw: FontWeight.w600,
                                      ),
                                      customSizedBox(),
                                      PoppinText(
                                          // text: '',date
                                          text:
                                              '${DateFormat('MM/dd/yyyy').format(model.temp[index]["date"])}',
                                          colour: blackColors,
                                          fs: 18)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 0,
              )
        : Padding(
            padding: EdgeInsets.only(left: 30.w, top: 10.h),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(.19),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 215.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                // color: Colors.blueAccent,
                                width: 169.w,
                                child: Column(
                                  children: [
                                    PoppinText(
                                        text: 'Name',
                                        colour: themeBlue,
                                        fs: 18,
                                        fw: FontWeight.w600),
                                    customSizedBox(),
                                    Padding(
                                      padding: EdgeInsets.only(left: 12.w),
                                      child: PoppinText(
                                          text:
                                              '${model.temp[index]["fname"]} ${model.temp[index]["lname"]}',
                                          colour: blackColors,
                                          fs: 18),
                                    ),
                                  ],
                                )),
                            Container(
                                // color: Colors.black,
                                width: 170.w,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      PoppinText(
                                          text: 'City',
                                          colour: themeBlue,
                                          fs: 18,
                                          fw: FontWeight.w600),
                                      customSizedBox(),
                                      PoppinText(
                                          text: '${model.temp[index]["city"]}',
                                          colour: blackColors,
                                          fs: 18),
                                    ],
                                  ),
                                )),
                            Container(
                                width: 220.w,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Column(
                                    children: [
                                      PoppinText(
                                          text: 'referral',
                                          colour: themeBlue,
                                          fs: 18,
                                          fw: FontWeight.w600),
                                      customSizedBox(),
                                      PoppinText(
                                          text: model.RefferelLength.length !=
                                                  null
                                              ? ' ${model.temp[index]["referal"]}'
                                              : '0',
                                          colour: blackColors,
                                          fs: 18),
                                    ],
                                  ),
                                )),
                            Container(
                                width: 220.w,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 50.w),
                                  child: Column(
                                    children: [
                                      PoppinText(
                                          text: 'Jobs Sold',
                                          colour: themeBlue,
                                          fs: 18,
                                          fw: FontWeight.w600),
                                      customSizedBox(),
                                      PoppinText(
                                          text:
                                              '${model.temp[index]["jobNumber"]}',
                                          colour: themeBlue,
                                          fs: 18),
                                    ],
                                  ),
                                )),
                            Container(
                                width: 245.w,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 70.w),
                                  child: Column(
                                    children: [
                                      PoppinText(
                                          text: 'Total Invoice',
                                          colour: themeBlue,
                                          fs: 18,
                                          fw: FontWeight.w600),
                                      customSizedBox(),
                                      PoppinText(
                                          text:
                                              '\$${model.temp[index]["invoice"].toStringAsFixed(0)}',
                                          colour: blackColors,
                                          fs: 18),
                                    ],
                                  ),
                                )),
                            Container(
                                width: 274.w,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Column(
                                    children: [
                                      PoppinText(
                                          text: 'Av.Referal invoice',
                                          colour: themeBlue,
                                          fs: 18,
                                          fw: FontWeight.w600),
                                      customSizedBox(),
                                      PoppinText(
                                          text: model.temp[index]["referal"] ==
                                                  0
                                              ? '\$0'
                                              : '\$${(model.temp[index]["invoice"] / model.temp[index]["referal"]).toStringAsFixed(0)}',
                                          colour: blackColors,
                                          fs: 18),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 55.w,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  PoppinText(
                                      text: 'Action',
                                      colour: themeBlue,
                                      fs: 18,
                                      fw: FontWeight.w600),
                                  customSizedBox(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Consumer<ReferalPartnerProvider>(
                                        builder: (BuildContext context, value,
                                            Widget? child) {
                                          return InkWell(
                                            onTap: isviewonly
                                                ? () {}
                                                : () {
                                                    value.setValue(1);
                                                    //  model.GetRefferel(id);
                                                    Globalid = id;
                                                    //print('this is current id $id');
                                                  },
                                            child: Icon(
                                              referralPartnersList[index]
                                                  .eyeIcon,
                                              size: 28.sp,
                                              color: isviewonly
                                                  ? lightGrey.withOpacity(.2)
                                                  : lightGrey,
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 23.w,
                                      ),
                                      GestureDetector(
                                        onTap: isviewonly ? () {} : ondelettap,
                                        child: Icon(
                                          Icons.delete,
                                          color: isviewonly
                                              ? Colors.red.withOpacity(.2)
                                              : Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18.w,
                                      ),
                                      Consumer<ReferalPartnerProvider>(builder:
                                          (BuildContext context, value,
                                              Widget? child) {
                                        return InkWell(
                                          onTap: isviewonly
                                              ? () {}
                                              : () {
                                                  Globalid = id;
                                                  print(
                                                      'this is globle id $Globalid');
                                                  value.setValue(4);
                                                },
                                          child: Image.asset(
                                            referralPartnersList[index]
                                                .editImage,
                                            color: isviewonly
                                                ? lightGrey.withOpacity(.2)
                                                : lightGrey,
                                            scale: 6,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                width: 185.w,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Column(
                                    children: [
                                      PoppinText(
                                        text: 'Company position',
                                        colour: themeBlue,
                                        fs: 18,
                                        fw: FontWeight.w600,
                                      ),
                                      customSizedBox(),
                                      PoppinText(
                                          text:
                                              '${model.temp[index]["position"]}',
                                          colour: blackColors,
                                          fs: 18),
                                    ],
                                  ),
                                )),
                            Container(
                                width: 190.w,
                                child: Column(
                                  children: [
                                    PoppinText(
                                      text: 'Company',
                                      colour: themeBlue,
                                      fs: 18,
                                      fw: FontWeight.w600,
                                    ),
                                    customSizedBox(),
                                    PoppinText(
                                        text: '${model.temp[index]["company"]}',
                                        colour: blackColors,
                                        fs: 18)
                                  ],
                                )),
                            Container(
                              width: 200.w,
                              child: Column(
                                children: [
                                  PoppinText(
                                    text: 'referred by',
                                    colour: themeBlue,
                                    fs: 18,
                                    fw: FontWeight.w600,
                                  ),
                                  customSizedBox(),
                                  PoppinText(
                                      text:
                                          '${model.temp[index]["refderedBy"]}',
                                      colour: blackColors,
                                      fs: 18)
                                ],
                              ),
                            ),
                            Container(
                              width: 200.w,
                              child: Column(
                                children: [
                                  PoppinText(
                                    text: 'Date',
                                    colour: themeBlue,
                                    fs: 18,
                                    fw: FontWeight.w600,
                                  ),
                                  customSizedBox(),
                                  PoppinText(
                                      text:
                                          '${DateFormat('MM/dd/yyyy').format(model.temp[index]["date"])}',
                                      colour: blackColors,
                                      fs: 18)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  SizedBox customSizedBox() {
    return SizedBox(
      height: 3.h,
    );
  }
}
