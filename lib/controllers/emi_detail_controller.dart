import 'package:augmont_v2/Screens/emi/emi_cancel_summary_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiDetailController extends GetxController with StateMixin<dynamic>{

  final cancellationScrollController = ScrollController();

  PaymentMethod? paymentMethod;
  RefundMode? refundMode;

  var detailList = [
    ("EMI Tenure","9 Months"),
    ("EMI per Month","₹15,600"),
    ("Downpayment","₹9,700"),
    ("Amount Remaining","₹25,000"),
  ];
  var tenureList = [
    ("July 2023","Paid",greenColor),
    ("August 2023","Paid",greenColor),
    ("September 2023","Pending",redColor),
    ("October 2023","Paid",greenColor),
    ("November 2023","Paid",greenColor),
    ("December 2023","Paid",greenColor),
    ("January 2024","Paid",greenColor),
    ("February 2024","Paid",greenColor),
    ("March 2024","Upcoming",orangeColor),
  ];

  var details = [
    ("SKU","AS56Y3GH78"),
    ("Metal Type","Gold"),
  ];

  var selectedTenure = ''.obs;
  Set<String> cancelTenure = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    cancellationScrollController.dispose();
    super.onClose();
  }

  void cancelBooking(){
    Get.to(()=> const EmiCancelSummaryScreen(),transition: Transition.rightToLeft);
  }

}