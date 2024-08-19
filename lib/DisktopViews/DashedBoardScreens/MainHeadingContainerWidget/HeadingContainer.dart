import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

class HeadingContainer extends StatefulWidget {
  HeadingContainer(
      {Key? key,
      required this.headingText,
      required this.image,
      required this.clickedIndex,
      required this.onPressed})
      : super(key: key);
  String image, headingText;
  VoidCallback onPressed;
  int clickedIndex;
  @override
  State<HeadingContainer> createState() => _HeadingContainerState();
}

class _HeadingContainerState extends State<HeadingContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 55.h,
        color: index == widget.clickedIndex
            ? Color(0xffF5F5F5)
            : Colors.transparent,
        padding: EdgeInsets.only(left: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              widget.image,
              color: index == widget.clickedIndex ? themeBlue : lightGrey,
              scale: 5,
            ),
            SizedBox(
              width: 16.sp,
            ),
            PoppinText(
              text: widget.headingText,
              colour: index == widget.clickedIndex ? themeBlue : lightGrey,
              fs: 20,
              // fw: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
