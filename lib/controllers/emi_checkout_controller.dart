import 'package:augmont_v2/Screens/Shop/product_list_screen.dart';
import 'package:augmont_v2/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiCheckoutController extends GetxController with StateMixin<dynamic>{

  late PageController pageController;
  var currentStep = 0;

  PaymentMethod? paymentMethod;

  Purpose purpose = Purpose.emi;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentStep);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanges(int index){
    currentStep = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    update();
  }
  void  onPaymentSelected(PaymentMethod method){
    paymentMethod = method;
    update();
  }

}