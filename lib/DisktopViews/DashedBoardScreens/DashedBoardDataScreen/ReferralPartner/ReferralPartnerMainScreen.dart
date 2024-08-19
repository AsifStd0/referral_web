import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/ReferralPartner/HeadingsContainer.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/ReferralPartner/NewUserButton.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/ReferralPartner/ReferralPartnersLiewViewContainer.dart';
import 'package:referral_admin_web/global%20Lists/GlobalList.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/Colors/Colours.dart';
import 'package:referral_admin_web/MobileViews/Mobile_res/widgets/PoppinText.dart';

class ReferralPartnerMainScreen extends StatelessWidget {
  const ReferralPartnerMainScreen({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: 23.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 34.w, right: 34.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PoppinText(
                    text: "Referral Partners",
                    colour: blackColors,
                    fw: FontWeight.bold,
                    fs: 20),
                Consumer<ReferalPartnerProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return InkWell(
                      onTap: () {
                        value.setValue(2);
                      },
                      child: NewUserButton());
                }),
              ],
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          HeadingsContainer(),
          SizedBox(
            height: 18.h,
          ),
          Container(
            height: 830.h,
            child: ListView.builder(
                itemCount: referralPartnersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReferralPartnersLiewViewContainer();
                }),
          ),
        ],
      ),
    );
  }
}
