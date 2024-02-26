import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin<dynamic>,GetSingleTickerProviderStateMixin{

  late TabController tabController;

  var sortBy = "Sort by".obs;

  @override
  void onInit() {
    tabController  = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement dispose
    super.onClose();
  }

}