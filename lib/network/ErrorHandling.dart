import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';
import 'ApiMessage.dart';
import 'app_exception.dart';

class ErrorHandling {
  static bool showError = true;
  static const String DIGI_KYC = "digiKyc";

  static bool isAlreadyOnLogout = false;

  static void handleErrors(error,
      {bool isForKyc = false, bool isForCancelOrder = false}) {
    if (error is UnAuthorisedException) {
      if (!isAlreadyOnLogout) {
        logout();
      }
    } else if (error is SocketException) {
      showErrorPopUp("ERROR", Strings.connectionError, Strings.closeApp, "");
    } else if (error is UnProcessableEntity) {
      try {
        var jsonMap = jsonDecode(error.toString());
        var msg = ApiMessage.fromJson(jsonMap);
        if (isForKyc) {
          showErrorPopUp("ERROR", msg.message, Strings.ok, DIGI_KYC);
        } else if (isForCancelOrder) {
          showErrorPopUp("ERROR", msg.message, Strings.ok, "CancelOrder");
        } else {
          showErrorPopUp("ERROR", msg.message, Strings.ok, "");
        }
      } catch (e) {
        if (isForKyc) {
          showErrorPopUp(
              "ERROR", Strings.somethingWentWrong, Strings.ok, DIGI_KYC);
        } else if (isForCancelOrder) {
          showErrorPopUp(
              "ERROR", Strings.somethingWentWrong, Strings.ok, "CancelOrder");
        } else {
          showErrorPopUp("ERROR", Strings.somethingWentWrong, Strings.ok, "");
        }
      }
    } else {
      try {
        var jsonMap = jsonDecode(error.toString());

        var msg = ApiMessage.fromJson(jsonMap);
        showErrorPopUp("ERROR", msg.message, Strings.ok, "");
      } catch (e) {
        showErrorPopUp("ERROR", Strings.somethingWentWrong, Strings.ok, "");
      }
    }
  }

  static void showErrorPopUp(
      String title, String message, String buttonText, String condition) {
    //if (showError) {
    bool isOpen = Get.isDialogOpen!;
    if (!isOpen) {
      //showError = false;
      Get.defaultDialog(
          title: title,
          middleText: message,
          titleStyle: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            fontSize: 16,
          ),
          middleTextStyle: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
            fontSize: 16,
          ),
          textConfirm: buttonText,
          confirmTextColor: primaryTextColor,
          buttonColor: primaryColor,
          barrierDismissible: false,
          onConfirm: () {
            //showError = true;
            if (condition == "back") {
              Get.back();
              Get.back(id: 0);
            } else {
              Get.back();
            }
          },
          onWillPop: () async {
            return false;
          });
    }
  }

  static void showCancelableErrorPopUp(String title, String message,
      String confirmButtonText, String cancelButtonText) {
    //if (showError) {
    bool isOpen = Get.isDialogOpen!;
    if (!isOpen) {
      //showError = false;
      Get.defaultDialog(
          title: title,
          middleText: message,
          titleStyle: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            fontSize: 16,
          ),
          middleTextStyle: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
            fontSize: 16,
          ),
          textConfirm: confirmButtonText,
          confirmTextColor: primaryTextColor,
          buttonColor: primaryColor,
          barrierDismissible: false,
          onConfirm: () {
            //showError = true;
            if (confirmButtonText == Strings.update) {
              // StoreRedirect.redirect(
              //     androidAppId: "com.augmont.gold_for_all",
              //     iOSAppId: "1619051011");
            } else {
              Get.back();
            }
          },
          onWillPop: () async {
            return false;
          },
          textCancel: cancelButtonText,
          cancelTextColor: primaryTextColor,
          onCancel: () {
            //showError = true;
            Get.back();
          });
    }
  }

  static void logout() {
    isAlreadyOnLogout = true;
    SessionManager.clearAll();
    showToast(Strings.yourAccIsCurrentlyLoggedInOnAnotherDevice);
  }

  static void showToast(String msg) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.black54,
      padding: const EdgeInsets.all(12),
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.down,
      margin: const EdgeInsets.all(20),
      messageText: Row(
        children: [
          const Icon(Icons.check_circle_rounded, size: 24, color: Colors.white54),
          const SizedBox(width: 12),
          Flexible(child: Text(msg, textAlign: TextAlign.start)),
        ],
      ),
    ));
  }
}
