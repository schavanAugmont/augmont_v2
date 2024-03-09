import 'package:augmont_v2/Screens/More/ShopSetting/my_orders_details_screen.dart';
import 'package:augmont_v2/bindings/more_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';

class MyOrdersController extends GetxController with StateMixin<dynamic>,GetSingleTickerProviderStateMixin{
  final searchQuery = TextEditingController();
  var isOrderListEmpty=false;
  var isPersonalDetailsExpanded = true.obs;
  late TabController tabController;
  @override
  void onInit() {
    tabController  = TabController(length: 2, vsync: this);
    super.onInit();
  }

  void onBack() {
    Get.back();
  }

  void onPersonalExpand() {
    if (isPersonalDetailsExpanded.value) {
      isPersonalDetailsExpanded(false);
    } else {
      isPersonalDetailsExpanded(true);
    }
    update();
  }

  void gotoDetailPage() {
    Get.to(()=>  MyOrdersDetailsScreen(),binding: MoreBinding());
  }


}
