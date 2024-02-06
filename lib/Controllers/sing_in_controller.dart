import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../Models/SignInModel.dart';
import '../Models/generateOtpModel.dart';
import '../Network/Providers/SignInProvider.dart';
import '../Network/app_exception.dart';
import '../Utils/dialog_helper.dart';
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../network/ApiMessage.dart';
import '../network/ErrorHandling.dart';


class SignInController extends GetxController with StateMixin<dynamic> {
  late LocalAuthentication _localAuthentication;

  var canCheckBiometrics = false.obs;
  var isUserAuthenticated = false.obs;

  var isTimeOnGoing = false.obs;

  //late final TextEditingController otpTextController;
 //late OTPTextEditController otpTextController;
  late TextEditingController otpTextController;
  late final TextEditingController mobileTextController;
  late GlobalKey<FormState> formKey;

  //late OTPInteractor otpInteractor;

  late String referenceCode;

  var enableOtpButton = false.obs;
  var enableSubmitOtpButton = false.obs;
  var enableGenrateOtpButton= false.obs;
  var enableMobileView=true.obs;
  var enableOtpView=false.obs;

  late SessionManager sessionManager;

  late CountdownTimerController countdownTimerController;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  SignInModel? model;

  @override
  Future<void> onInit() async {
    sessionManager = SessionManager();

    // otpInteractor = OTPInteractor();
    // getSignature();
    // otpTextController = OTPTextEditController(
    //     codeLength: 4,
    //     onCodeReceive: (code) async {
    //       PrintLogs.printData('Your Application receive code - $code');
    //       try {
    //         SignUpController.to.setOtpCode(code);
    //       } catch (e) {
    //         PrintLogs.printException(e);
    //       }
    //       await otpTextController.stopListen();
    //     },
    //     otpInteractor: otpInteractor);

    mobileTextController = TextEditingController();
    otpTextController = TextEditingController();
    formKey = GlobalKey<FormState>();

    countdownTimerController = CountdownTimerController(
      endTime: endTime,
      onEnd: onEndTimer,
    );

    _localAuthentication = LocalAuthentication();
    checkingForBioMetrics();

    super.onInit();
  }

  void setEnableOtpButton(bool boo) {
    enableOtpButton(boo);
    update();
  }

  void setEnableGenrateOtpButton(bool boo) {
    enableGenrateOtpButton(boo);
    update();
  }

  void setEnableSubmitOtpButton(bool boo) {
    enableSubmitOtpButton(boo);
    update();
  }

  void setMobileView(){
    enableMobileView(true);
    enableOtpView(false);
    otpTextController.clear();
    update();
  }

  void setOTPView(){
    enableOtpView(true);
    enableMobileView(false);
    update();
  }

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    PrintLogs.printData(canCheckBiometrics.toString());
    this.canCheckBiometrics(canCheckBiometrics);
    update();
    return canCheckBiometrics;
  }

  void authenticateMe() async {
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    var authenticated = false;

    authenticated = await authenticateForSignUp();
    isUserAuthenticated(authenticated);
    update();
  }

  Future<bool> authenticateForSignUp() async {
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    var authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: "Authentication is necessary for SignIn and SignUp",
      );
    } on PlatformException catch (e) {
      // if (e.code == auth.notAvailable) {
      //   authenticated = true;
      //   return authenticated;
      // }
      return authenticated;
      PrintLogs.printException(e);
    }

    return authenticated;
  }

  Future<void> generateOTP(String mobileNo, BuildContext context) async {
    otpTextController.clear();

    // await otpTextController.stopListen();
    // getSignature();
    // startListening();

    DialogHelper.showLoading();
    SignInProvider().generateOtp(mobileNo, false).then(
      (value) async {
        DialogHelper.dismissLoader();
        var jsonMap = jsonDecode(value);
        var model = GenerateOtpModel.fromJson(jsonMap);
        referenceCode = model.referenceCode;

        if (model.isCustomer) {
          /*if (canCheckBiometrics.value) {
            authenticateMe();
          } else {
            isUserAuthenticated(true);
            update();
          }*/

          isUserAuthenticated(true);
          update();
          setstartTime();
        } else {
          /*if (canCheckBiometrics.value) {
            bool isAuth = await authenticateForSignUp();
            if (isAuth) {
              navigateToSignUp(model);
            }
          } else {
            navigateToSignUp(model);
          }*/
          navigateToSignUp(model);
        }
        showSnackBar(context, model.message);
      },
      onError: (error) {
        DialogHelper.dismissLoader();
        if (error is BadRequestException) {
          var object = jsonDecode(error.toString());

          showSnackBar(context, object['message']);
        } else {
          ErrorHandling.handleErrors(error);
        }
      },
    );
  }

  void signIn(String mobileNo, String otp, BuildContext context) async {
    DialogHelper.showLoading();
    model = null;
    SignInProvider().signIn(mobileNo, otp, referenceCode).then((value) async {
      var jsonMap = jsonDecode(value);

      model = SignInModel.fromJson(jsonMap);
      if (model != null) {
        await sessionManager.setIsLoggedIn(true, model!.token!);
        await sessionManager.setMobileNumber(mobileNo);
      }
    }, onError: (error) {
      if (error is InvalidInputException) {
        otpTextController.text = "";
      }
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }


  void clearBackStack() {
    Get.until((route) => route.isFirst);
    Get.until((route) => route.isFirst, id: 0);
  }

  void startTimer(
    BuildContext context,
    bool isVoice,
  ) {
    setstartTime();
    resendOtp(mobileTextController.text.trim(), context, isVoice);
  }

  void setstartTime() {
    otpTextController.clear();
    countdownTimerController.endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    countdownTimerController.start();
    isTimeOnGoing(true);
    update();
  }

  void onEndTimer() {
    isTimeOnGoing(false);
    update();
  }

  Future<void> resendOtp(
      String mobileNo, BuildContext context, bool isVoice) async {
    // await otpTextController.stopListen();
    // getSignature();
    // startListening();
    SignInProvider().generateOtp(mobileNo, isVoice).then(
      (value) {
        var jsonMap = jsonDecode(value);

        var model = GenerateOtpModel.fromJson(jsonMap);
        referenceCode = model.referenceCode;

        showSnackBar(context, model.message);
      },
      onError: (error) {
        if (error is BadRequestException) {
          var object = jsonDecode(error.toString());
          showSnackBar(context, object['message']);
        } else {
          ErrorHandling.handleErrors(error);
        }
      },
    );
  }

  @override
  Future<void> onClose() async {
  //  await otpTextController.stopListen();
    super.onClose();
  }

  @override
  Future<void> dispose() async {
   //await otpTextController.stopListen();
    countdownTimerController.dispose();
    mobileTextController.dispose();
 //   otpTextController.dispose();
    super.dispose();
  }

  void clearSessionFields() async {
    sessionManager.setIsGoldSelected(true);
    sessionManager.setIsAmountEdited(false);
    sessionManager.setIsGramEdited(false);
    sessionManager.setQuickValue("");
    sessionManager.setAfterSignInScreen("");
  }

  void navigateToSignUp(GenerateOtpModel model) {
    // Get.to(
    //   () => SignUpScreens(
    //     mobileNo: mobileTextController.text.trim().toString(),
    //     referenceCode: model.referenceCode,
    //   ),
    //   binding: SignUpBinding(),
    //   transition: Transition.rightToLeft,
    // );
  }

  void showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(milliseconds: 2000),
        ),
      );
    }
  }

  void showToast(String message) {
    if (message.isNotEmpty) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }
  }

  // void startListening() {
  //   if (Platform.isAndroid) {
  //     otpTextController.startListenUserConsent(
  //       (code) {
  //         final exp = RegExp(r'(\d{4})');
  //         return exp.stringMatch(code ?? '') ?? '';
  //       },
  //     );
  //   }
  // }
  //
  // Future<void> getSignature() async {
  //   if (Platform.isAndroid) {
  //     await otpInteractor
  //         .getAppSignature()
  //         //ignore: avoid_print
  //         .then((value) => PrintLogs.printData('signature - $value'));
  //   }
  // }
}
