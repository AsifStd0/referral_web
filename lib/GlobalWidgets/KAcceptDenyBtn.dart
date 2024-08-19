import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class KAcceptDenyBtn extends StatelessWidget {
  KAcceptDenyBtn(
      {Key? key,
      required this.btnText,
      this.textColour,
      this.fs,
      this.onPressed,
      this.btnColor})
      : super(key: key);
  String btnText;
  Color? textColour, btnColor;
  VoidCallback? onPressed;
  double? fs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 33.h,
        width: 65.w,
        decoration: BoxDecoration(
          color: btnColor ?? whiteColors,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1.r,
              offset: Offset(
                4.0,
                0.0,
              ),
            )
          ],
        ),
        child: Center(
          child: PoppinText(
              text: btnText,
              colour: textColour ?? greenAceptColor,
              fs: fs ?? 12),
        ),
      ),
    );
  }
}
