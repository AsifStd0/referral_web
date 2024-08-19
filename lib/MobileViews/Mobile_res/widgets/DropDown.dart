import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/DashedBoardScreen.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/Colors/Colours.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/PoppinText.dart';

String selectedItem = "Paid";
String LeadListSelectedItem = "Sold";

class DropDown extends StatefulWidget {
  DropDown({super.key, required this.list});

  List<String> list;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40.h,
      width: selectedItem == 'Not \nQualified' ? 120.w : 103.w,
      padding: EdgeInsets.only(
          left: widget.list == paidList ? 4.w : 8.w, right: 4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: whiteColors,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1.r,
              offset: Offset(
                4.0,
                4.0,
              ),
            )
          ]),
      child: DropdownButton(
        dropdownColor: ContainerBackground,
        underline: Divider(
          color: Colors.transparent,
        ),
        // selectedItem=='Not Qualified'
        isDense: widget.list == paidList
            ? selectedItem == 'Not \nQualified' || selectedItem == "Not Paid"
                ? false
                : true
            : true,
        isExpanded: true,
        hint: PoppinText(
          text: widget.list == paidList ? selectedItem : LeadListSelectedItem,
          colour: blackColors,
          fs: selectedItem == 'Not \nQualified' ? 16.5 : 19,
        ),
        // value: selectedItem,
        borderRadius: BorderRadius.circular(15.r),
        items: widget.list.map((item) {
          return DropdownMenuItem(
            alignment: AlignmentDirectional.center,
            child: PoppinText(
              text: item,
              colour: blackColors,
              fs: 19,
            ),
            value: item,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            widget.list == paidList
                ? selectedItem = value!.toString()
                : LeadListSelectedItem = value!.toString();
          });
        },
      ),
    );
  }
}
