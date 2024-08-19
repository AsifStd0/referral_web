import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

String selectedItem = "Paid";
String LeadListSelectedItem = "Sold";

class DisktopDropDown extends StatefulWidget {
  DisktopDropDown({super.key, required this.list});

  List<String> list;

  @override
  State<DisktopDropDown> createState() => _DisktopDropDownState();
}

class _DisktopDropDownState extends State<DisktopDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40.h,
      width: selectedItem == 'Not \nQualified' ? 120.w : 120.w,
      padding: EdgeInsets.only(
        left: widget.list == paidList ? 12.w : 12.w,
        right: 4.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: whiteColors,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 4.r,
              offset: Offset(
                1.0,
                1.0,
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
            ? selectedItem == 'Not \nQualified'
                ? false
                : true
            : true,
        isExpanded: true,
        hint: PoppinText(
          text: widget.list == paidList ? selectedItem : LeadListSelectedItem,
          colour: blackColors,
          fs: selectedItem == 'Not \nQualified' ? 15 : 15,
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
