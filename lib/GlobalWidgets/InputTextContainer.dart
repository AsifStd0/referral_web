import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';

class InputTextContainer extends StatelessWidget {
  InputTextContainer(
      {Key? key,
      required this.hintText,
      required this.icon,
      this.ContainerColor,
      required this.iconBackColor,
      //this.controller,
      this.valid,
      this.w,
      required this.change,
      this.isobsecure,
      required this.iconColor})
      : super(key: key);
  String hintText;
  IconData icon;
  FormFieldValidator<String>? valid;
  Color iconColor, iconBackColor;
  Color? ContainerColor;
  final isobsecure;
  //TextEditingController controller;
  double? w;
  final change;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 91.h,
      width: w ?? 526.w,
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
              radius: 20.r,
              backgroundColor: iconBackColor,
              child: Icon(
                icon,
                size: 30.sp,
                color: iconColor,
              )),
          SizedBox(
            width: 30.w,
          ),
          Flexible(
            child: TextFormField(
              validator: valid,
              obscureText: isobsecure ?? false,
              onChanged: change,
              keyboardType: TextInputType.name,
              //  controller: controller,
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
