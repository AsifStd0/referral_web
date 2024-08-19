import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/DropDown.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

class ButtonsColumnContainer extends StatefulWidget {
  ButtonsColumnContainer({
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
  State<ButtonsColumnContainer> createState() => _ButtonsColumnContainerState();
}

class _ButtonsColumnContainerState extends State<ButtonsColumnContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
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
                border: Border.all(width: 0.5, color: lightGrey)),
            child: Center(
              child: PoppinText(
                text: "01",
                colour: blackColors,
                fs: 13,
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
          DropDown(
            list: widget.list,
          ),
        ],
      ),
    );
  }
}
