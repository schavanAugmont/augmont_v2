

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/CusomerInfoQuestionModel.dart';
import '../models/CustomerQuestionIdModel.dart';
import '../network/Providers/PersonalizQusProvider.dart';

class PersonalizeQuestionController extends GetxController with StateMixin<dynamic>{

  List<CusomerInfoQuestion>? cusomerInfoQuestion;
  List<int>? customerQuestionId = [];
  int counter = 0;
   int maxCount=0;
  final commonController = TextEditingController();
  var social = false.obs;


  @override
  void onInit() {
  fetchCustomerQuestion("");
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

        maxCount=cusomerInfoQuestion!.length;
        update();


      }
    }, onError: (error) {});
  }

  void incrementCounter() {
    if(counter!=(maxCount-1)) {
      counter < maxCount ? counter++ : counter = maxCount;
      update();
    }
  }
}


