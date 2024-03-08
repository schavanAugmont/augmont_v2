import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';

class KYCVerifictionController extends GetxController with StateMixin<dynamic> {
  var isPanDetailsExpanded = true.obs;
  var isOtherExpanded = false.obs;
  var isAadharExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onBack() {
    Get.back();
  }


  void onPanExpand() {
    if (isPanDetailsExpanded.value) {
      isPanDetailsExpanded(false);
    } else {
      isPanDetailsExpanded(true);
    }
    update();
  }

  void onAadharExpand() {
    if (isAadharExpanded.value) {
      isAadharExpanded(false);
    } else {
      isAadharExpanded(true);
    }
    update();
  }


  void onOtherExpand() {
    if (isOtherExpanded.value) {
      isOtherExpanded(false);
    } else {
      isOtherExpanded(true);
    }
    update();
  }

}
