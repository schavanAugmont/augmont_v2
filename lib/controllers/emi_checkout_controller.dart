import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiCheckoutController extends GetxController with StateMixin<dynamic>{

  late PageController pageController;
  var currentStep = 0;

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
    pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

}