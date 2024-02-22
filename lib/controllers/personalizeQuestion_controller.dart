import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Bindings/main_screen_binding.dart';
import '../Network/ErrorHandling.dart';
import '../Screens/Main/main_screen.dart';
import '../Utils/dialog_helper.dart';
import '../models/CusomerInfoQuestionModel.dart';
import '../models/CustomerQuestionIdModel.dart';
import '../network/Providers/PersonalizQusProvider.dart';

class PersonalizeQuestionController extends GetxController
    with StateMixin<dynamic> {
  var selectedOption = <String>[].obs;
  List<CusomerInfoQuestion>? cusomerInfoQuestion=[];
  List<int>? customerQuestionId = [];
  int counter = 0;
  int maxCount = 0;
  final commonController = TextEditingController();
  var social = false.obs;

  @override
  void onInit() {
    fetchCustomerAnsQuestion("");
    super.onInit();
  }

  void fetchCustomerAnsQuestion(String trigerPoint) async {
    customerQuestionId = [];
    PersonalizQusProvider().customerAnsQuestion().then((value) {
      var jsonMap = jsonDecode(value);
      CustomerQuestionIdModel customerQuestionIdModel =
          CustomerQuestionIdModel.fromJson(jsonMap);
      if (customerQuestionIdModel.customerQuestionId!.isNotEmpty) {
        customerQuestionId!
            .addAll(customerQuestionIdModel!.customerQuestionId!);
        customerQuestionId = customerQuestionId!.toSet().toList();
        fetchCustomerQuestion(trigerPoint);
      } else {
        fetchCustomerQuestion(trigerPoint);
      }
    }, onError: (error) {});
  }

  void fetchCustomerQuestion(String trigerPoint) async {
    // customerQuestionId= await fetchCustomerAnsQuestions();
    cusomerInfoQuestion = <CusomerInfoQuestion>[];
    print(customerQuestionId);
    PersonalizQusProvider().customerInfoQuestion().then((value) {
      var jsonMap = jsonDecode(value);
      CusomerInfoQuestionModel cusomerInfoQuestionModel =
          CusomerInfoQuestionModel.fromJson(jsonMap);
      if (cusomerInfoQuestionModel != null) {
        cusomerInfoQuestion!
            .addAll(cusomerInfoQuestionModel!.cusomerInfoQuestion!);
        print(cusomerInfoQuestion!.length);

        if (customerQuestionId!.isNotEmpty && cusomerInfoQuestion!.isNotEmpty) {
          for (var q in customerQuestionId!) {
            cusomerInfoQuestion!.removeWhere((item) => item.id == q);
          }
        }

        maxCount = cusomerInfoQuestion!.length;
        update();
      }
    }, onError: (error) {});
  }

  void incrementCounter() {
    if (cusomerInfoQuestion![counter].option == null) {
      var hint = cusomerInfoQuestion![counter].question!;
      if (commonController.text.isEmpty) {
        ErrorHandling.showToast('$hint');
      } else if (commonController.text.isNotEmpty &&
          social.value == false &&
          hint.contains('link') &&
          !GetUtils.isURL(commonController.text.trim())) {
        ErrorHandling.showToast('Invalid profile url');
      } else if (commonController.text.isNotEmpty &&
          hint.contains('email') &&
          !GetUtils.isEmail(commonController.text.trim())) {
        ErrorHandling.showToast('Invalid email address');
      } else if (commonController.text.isNotEmpty &&
          (hint.contains('pincode') || hint.contains('postal')) &&
          commonController.text.length != 6) {
        ErrorHandling.showToast('Invalid pin-code');
      } else {
        setQuesAns(cusomerInfoQuestion![counter].id.toString(),
            commonController.text.trim());
      }
    } else {
      if (selectedOption.isEmpty) {
        ErrorHandling.showToast('Please select at least one option');
      } else {
        setQuesAns(cusomerInfoQuestion![counter].id.toString(),
            selectedOption.join(','));
      }
    }

    // if (counter != (maxCount - 1)) {
    //   counter < maxCount ? counter++ : counter = maxCount;
    //   update();
    // }
  }

  void setQuesAns(String quesId, String answ) {
    DialogHelper.showLoading();
    try {
      PersonalizQusProvider().customeraddAns(quesId, answ).then((value) {
        var jsonMap = jsonDecode(value);
        DialogHelper.dismissLoader();
        if (jsonMap != null) {
          commonController.clear();
          social(false);
          selectedOption.clear();
          update();
          if (counter != (maxCount - 1)) {
            counter < maxCount ? counter++ : counter = maxCount;
            update();
          } else {
            goToHomeScreen();
          }
        }
      }, onError: (error) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(error);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }


  void goToHomeScreen(){
    Get.offAll(
          () => const MainScreen(),
      binding: MainScreenBinding(),
      transition: Transition.rightToLeft,
    );
  }

}
