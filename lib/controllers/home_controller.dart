import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  late SessionManager sessionManager;

  @override
  void onInit() {
    sessionManager = SessionManager();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }


}
