import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/Colors/Colours.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/PoppinText.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/KAcceptDenyBtn.dart';

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
                width: 16.w,
              ),
              Container(
                width: 195.w,
                child:
                    PoppinText(text: "Adam Smith", colour: blackColors, fs: 18),
              ),
              Container(
                width: 185.w,
                child: PoppinText(text: "Roberto", colour: blackColors, fs: 18),
              ),
              Container(
                width: 206.w,
                child: PoppinText(
                    text: "+1-344-9876123", colour: blackColors, fs: 18),
              ),
              Container(
                width: 220.w,
                child: PoppinText(
                    text: "Designation here", colour: blackColors, fs: 18),
              ),
              Container(
                width: 248.w,
                child: PoppinText(text: "Initech", colour: blackColors, fs: 18),
              ),
              Container(
                width: 256.w,
                child: PoppinText(
                    text: "user1234@email.com", colour: blackColors, fs: 18),
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
