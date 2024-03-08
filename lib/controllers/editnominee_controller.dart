import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNomineeController extends GetxController with StateMixin<dynamic> {
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController dobController = TextEditingController();
  String gendervalue = 'Father';

  var genderList = [
    'Father',
    'Mother',
    'Son',
    'Daughter',
    'Wife'
  ];

  var isFirstNameError = false.obs;
  var isDOBError = false.obs;
  late DateTime currentDate;
  var selectedDate = "".obs;
  var errorMessage = "".obs;
  var dobErrorMessage = "".obs;
  var isPANError = false.obs;

  @override
  void onInit() {

    dobController = TextEditingController(text: selectedDate.value);
    currentDate = DateTime.now();
    super.onInit();
  }


  void onBack() {
    Get.back();
  }

  Future<void> selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1950),
        lastDate: currentDate);
    if (picked != null && picked != currentDate) {
      selectedDate(
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}");
      dobController.text = selectedDate.value;
      update();
    }
  }
}
