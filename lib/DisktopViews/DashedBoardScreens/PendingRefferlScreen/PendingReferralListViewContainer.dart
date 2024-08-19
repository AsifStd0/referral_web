import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/KAcceptDenyBtn.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';

class PendingReferralListViewContainer extends StatelessWidget {
  const PendingReferralListViewContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 130.w,
                child:
                    PoppinText(text: "Adam Smith", colour: blackColors, fs: 12),
              ),
              Container(
                width: 125.w,
                child: PoppinText(text: "Roberto", colour: blackColors, fs: 12),
              ),
              Container(
                width: 132.w,
                child: PoppinText(
                    text: "+1-344-9876123", colour: blackColors, fs: 12),
              ),
              Container(
                width: 134.w,
                child: PoppinText(
                    text: "Designation here", colour: blackColors, fs: 12),
              ),
              Container(
                width: 95.w,
                child: PoppinText(text: "Initech", colour: blackColors, fs: 12),
              ),
              Container(
                width: 156.w,
                child: PoppinText(
                    text: "user1234@email.com", colour: blackColors, fs: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KAcceptDenyBtn(
                    onPressed: () {},
                    btnText: "Accept",
                    textColour: greenAceptColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  KAcceptDenyBtn(
                    onPressed: () {},
                    btnText: "Deny",
                    textColour: redColor,
                  ),
                ],
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
