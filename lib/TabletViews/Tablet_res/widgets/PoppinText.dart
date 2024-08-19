import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinText extends StatelessWidget {
  PoppinText(
      {Key? key,
      required this.text,
      required this.colour,
      required this.fs,
      this.fw})
      : super(key: key);
  FontWeight? fw;
  double fs;
  String text;
  Color colour;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontSize: fs.sp, fontWeight: fw ?? FontWeight.normal, color: colour),
    );
  }
}
