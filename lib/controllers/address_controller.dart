import 'package:augmont_v2/bottomsheet/state_city_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController with StateMixin<dynamic>{

  final fullNameController = TextEditingController();
  final mobileController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final address3Controller = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  var isDefault = false.obs;

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
    // TODO: implement onClose
    super.onClose();
  }

  void onSelectState(){
    var data = ["Maharashtra","Madhya Pradesh","Uttar Pradesh","New Delhi"];
    Get.bottomSheet( StateCityBottomSheet(data: data,),isScrollControlled: true,enableDrag: true).then((value){
      if(value!=null){
        stateController.text = value;
        update();
      }
    });
  }

  void onSelectCity(){
    var data = ["Mumbai","New Mumbai","Thane","Vasai"];
    Get.bottomSheet( StateCityBottomSheet(data: data,),isScrollControlled: true,enableDrag: true).then((value){
      if(value!=null){
        cityController.text = value;
        update();
      }
    });
  }

}