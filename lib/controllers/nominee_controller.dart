import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NomineeController extends GetxController with StateMixin<dynamic> {
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController dobController = TextEditingController();
  String gendervalue = 'Male';

  var genderList = [
    'Male',
    'Female',
    'Other'
  ];

  var isFirstNameError = false.obs;
  var isLastNameError = false.obs;
  var isEmailError = false.obs;
  var isDOBError = false.obs;
  late DateTime currentDate;
  var selectedDate = "".obs;
  var errorMessage = "".obs;
  var dobErrorMessage = "".obs;
  var isPANError = false.obs;
  var isNomineeAdded=false.obs;

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

  void updateNominee() {
    isNomineeAdded(true);
    update();
  }
}
