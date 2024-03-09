import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController with StateMixin<dynamic> {
  final searchQuery = TextEditingController();
  List<String> wishlistList = ['All', 'Gold Coins', 'Chains', 'Rings','Pendant'];
  var selectedWishlist="All";
  @override
  void onInit() {
    super.onInit();
  }


  void onBack() {
    Get.back();
  }

  void setWishlist(int index) {
    selectedWishlist = wishlistList[index];
    update();
  }


}
