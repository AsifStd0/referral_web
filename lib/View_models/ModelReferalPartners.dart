import 'package:flutter/material.dart';

class ModelReferalPartners {
  final String Name;
  final String Referrals;
  final String JobsSold;
  final String TotalInvoiced;
  final String AvgReferralInvoice;
  final IconData eyeIcon;
  final String editImage;

  ModelReferalPartners(
      {required this.Name,
      required this.Referrals,
      required this.JobsSold,
      required this.TotalInvoiced,
      required this.AvgReferralInvoice,
      required this.editImage,
      required this.eyeIcon});
}
