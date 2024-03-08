import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQController extends GetxController with StateMixin<dynamic> {
  final searchQuery = TextEditingController();
  List<String> faqList = ['All', 'Withdrawal', 'SIP', 'Gold Buy','Gold Sell'];
  var selectedamount="All";
  @override
  void onInit() {
    super.onInit();
  }


  void onBack() {
    Get.back();
  }


}
