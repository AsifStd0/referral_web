import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

bool newReferralPartner = false;

class NewUserButton extends StatelessWidget {
  const NewUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: themeBlue, width: 0.5)),
      padding: EdgeInsets.only(left: 16.w, right: 26.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add,
            color: themeBlue,
          ),
          PoppinText(text: "New User", colour: themeBlue, fs: 20)
        ],
      ),
    );
  }
}
