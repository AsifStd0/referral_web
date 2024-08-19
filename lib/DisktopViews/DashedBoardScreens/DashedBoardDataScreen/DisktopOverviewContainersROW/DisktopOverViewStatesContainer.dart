import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:referral_admin_web/GlobalWidgets/Colors/Colours.dart';
import 'package:referral_admin_web/GlobalWidgets/PoppinText.dart';

class DisktopOverViewStatesContainer extends StatelessWidget {
  DisktopOverViewStatesContainer(
      {Key? key,
      required this.title,
      required this.titleValue,
      this.w,
      required this.pLeft,
      required this.pRight})
      : super(key: key);
  String title, titleValue;
  double? w;
  double pLeft, pRight;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 96.h,
        width: w ?? 328.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ContainerBackground,
        ),
        padding: EdgeInsets.only(left: pLeft, right: pRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinText(
              text: "$title",
              colour: themeBlue,
              fs: 22.sp,
              fw: FontWeight.w400,
            ),
            Container(
              child: AutoSizeText(
                "$titleValue",
                maxLines: 1,
                style: GoogleFonts.poppins(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: blackColors),
              ),
            ),
          ],
        ));
  }
}
