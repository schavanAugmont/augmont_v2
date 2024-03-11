import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanProcessController extends GetxController with StateMixin<dynamic>{
  late PageController pageController;

  //PersonalAddressDetailPage
  final fullNameController = TextEditingController();
  final mobileController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  //LocationPage
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final address3Controller = TextEditingController();
  final dateController = TextEditingController();

  var list = [
    (0, 'Personal \n Address'),
    (1, "Service \nType"),
    (2, "Location\n "),
    (3, "Summary\n "),
  ];

  var timeSlot = [
    '11 AM - 12 PM',
    '12 PM - 1 PM',
    '2 PM - 3 PM',
    '3 PM - 4 PM',
    '4 PM - 5 PM',
  ];

  var currentIndex = 0;
  var selectedServiceType;
  var selectedSlot;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex);
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
    // if(index==3){
    //
    //   return;
    // }
    currentIndex = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    update();
  }

}