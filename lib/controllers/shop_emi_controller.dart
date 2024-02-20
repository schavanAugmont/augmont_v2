import 'package:get/get.dart';

class ShopEMIController extends GetxController with StateMixin<dynamic>{

  var features = [
    "Lowest Making\nCharges",
    "With only 10%\ninterest annually",
    "Lowest Monthly\nEMI",
  ];

  var instruction = <(String,String)>[
    ("Book Jewellery at today’s Price","Book jewellery at todays’s price by paying downpayment of 20% and save up-to 5% on gold prices **"),
    ("Choose your EMI Tenure","Choose from 3/6/9 months EMI option."),
    ("Pay your monthly instalments","Pay your monthly instalments....(copy)"),
    ("Get doorstep delivery","One EMI is done you will receive the product"),
  ];

  var selectedTenure = 3;

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

}