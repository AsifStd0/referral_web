import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/Colors/Colours.dart';
import 'package:referral_admin_web/DisktopViews/Disktop_res/widgets/PoppinText.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/global%20Lists/GlobalList.dart';

class ReferralPartnersLiewViewContainer extends StatelessWidget {
  const ReferralPartnersLiewViewContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 237.w,
                  child: PoppinText(
                      text: referralPartnersList[index].Name,
                      colour: blackColors,
                      fs: 18)),
              // SizedBox(
              //   width: 183.w,
              // ),
              Container(
                  width: 160.w,
                  child: PoppinText(
                      text: referralPartnersList[index].Referrals,
                      colour: blackColors,
                      fs: 18)),

              Container(
                  width: 190.w,
                  child: PoppinText(
                      text: referralPartnersList[index].JobsSold,
                      colour: blackColors,
                      fs: 18)),
              Container(
                  width: 269.w,
                  child: PoppinText(
                      text: referralPartnersList[index].TotalInvoiced,
                      colour: blackColors,
                      fs: 18)),
              Container(
                  width: 494.w,
                  child: PoppinText(
                      text: referralPartnersList[index].AvgReferralInvoice,
                      colour: blackColors,
                      fs: 18)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<ReferalPartnerProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return InkWell(
                        onTap: () {
                          // Get.to(PartnerDoesreferralReportScreen());
                          value.setValue(1);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             PartnerDoesreferralReportScreen()));
                        },
                        child: Icon(
                          referralPartnersList[index].eyeIcon,
                          size: 28.sp,
                          color: lightGrey,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 29.w,
                  ),
                  Image.asset(
                    referralPartnersList[index].editImage,
                    color: lightGrey,
                    scale: 5,
                  )
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
