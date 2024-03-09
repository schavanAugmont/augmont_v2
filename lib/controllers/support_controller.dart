import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';

class SupportController extends GetxController with StateMixin<dynamic> {
  String suppoprtvalue = 'Select a reason for getting in touch';

  var supportList = [
    'Select a reason for getting in touch',
    'Select a reason for getting in touch1',
    'Select a reason for getting in touch2'
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void onBack() {
    Get.back();
  }


}
