import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:referral_admin_web/TabletViews/TabletDashedBoardScreens/DashedBoardDataScreen/DashedBoardScreen.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/Colors/Colours.dart';
import 'package:referral_admin_web/TabletViews/Tablet_res/widgets/PoppinText.dart';
import 'package:referral_admin_web/global%20Lists/GlobalList.dart';

class ReferralPartnersLiewViewContainer extends StatelessWidget {
  const ReferralPartnersLiewViewContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 150.w,
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  child: PoppinText(
                    text: referralPartnersList[index].Name,
                    colour: blackColors,
                    fs: 16,
                    fw: FontWeight.w400,
                  )),
              // SizedBox(
              //   width: 183.w,
              // ),
              Container(
                  width: 160.w,
                  child: PoppinText(
                    text: referralPartnersList[index].Referrals,
                    colour: blackColors,
                    fs: 16,
                    fw: FontWeight.w300,
                  )),

              Container(
                  width: 160.w,
                  child: PoppinText(
                    text: referralPartnersList[index].JobsSold,
                    colour: blackColors,
                    fs: 16,
                    fw: FontWeight.w300,
                  )),
              Container(
                  width: 200.w,
                  child: PoppinText(
                    text: referralPartnersList[index].TotalInvoiced,
                    colour: blackColors,
                    fs: 16,
                    fw: FontWeight.w300,
                  )),
              Container(
                  width: 220.w,
                  child: PoppinText(
                    text: referralPartnersList[index].AvgReferralInvoice,
                    colour: blackColors,
                    fs: 16,
                    fw: FontWeight.w300,
                  )),
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
