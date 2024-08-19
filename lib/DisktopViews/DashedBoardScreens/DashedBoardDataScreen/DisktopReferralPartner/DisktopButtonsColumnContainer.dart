import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/DisktopDropDown.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class DisktopButtonsColumnContainer extends StatefulWidget {
  DisktopButtonsColumnContainer({
    Key? key,
    required this.heading1,
    required this.heading2,
    required this.list,
    // required this.list2
  }) : super(key: key);
  String heading1, heading2;
  List<String> list;
  // List<String> list2;
  @override
  State<DisktopButtonsColumnContainer> createState() =>
      _DisktopButtonsColumnContainerState();
}

class _DisktopButtonsColumnContainerState
    extends State<DisktopButtonsColumnContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinText(
            text: widget.heading1,
            colour: lightGrey,
            fs: 14,
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            height: 40.h,
            width: 69.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: blackColors.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: whiteColors)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: whiteColors)),
                border: InputBorder.none,
                hintText: "01",
                fillColor: whiteColors,
                filled: true,
                contentPadding: EdgeInsets.only(left: 20.w, right: 10.w),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          PoppinText(
            text: widget.heading2,
            colour: lightGrey,
            fs: 14,
          ),
          SizedBox(
            height: 12.h,
          ),
          DisktopDropDown(
            list: widget.list,
          ),
        ],
      ),
    );
  }
}
