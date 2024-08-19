import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';

class MobileInputTextContainer extends StatelessWidget {
  MobileInputTextContainer(
      {Key? key,
      required this.hintText,
      required this.icon,
      this.ContainerColor,
      required this.iconBackColor,
      required this.controller,
      this.w,
      required this.iconColor})
      : super(key: key);
  String hintText;
  IconData icon;
  Color iconColor, iconBackColor;
  Color? ContainerColor;
  TextEditingController controller;
  double? w;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 91.h,
      width: w ?? 350.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ContainerBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 37.w,
          ),
          CircleAvatar(
              radius: 25.r,
              backgroundColor: iconBackColor,
              child: Icon(
                icon,
                size: 40.sp,
                color: iconColor,
              )),
          SizedBox(
            width: 30.w,
          ),
          Flexible(
            child: TextField(
              keyboardType: TextInputType.name,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                    fontSize: deviceWidth * 0.011, color: lightGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
