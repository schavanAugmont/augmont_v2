import 'dart:async';
import 'dart:convert';
import 'package:augmont_v2/Bindings/signin_binding.dart';
import 'package:augmont_v2/Screens/SignIn/signin_page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../Bindings/main_screen_binding.dart';
import '../Models/CustomerDetailsModel.dart';
import '../Models/PassbookDetailsModel.dart';
import '../Models/PersonalInfoModel.dart';
import '../Models/SignInModel.dart';
import '../Models/StateModel.dart';
import '../Models/generateOtpModel.dart';
import '../Network/ApiMessage.dart';
import '../Network/Providers/SignInProvider.dart';
import '../Network/app_exception.dart';
import '../Screens/Main/main_screen.dart';
import '../Screens/SignIn/signin_page2.dart';
import '../Screens/SignIn/signin_page3.dart';
import '../Utils/Validator.dart';
import '../Utils/dialog_helper.dart';
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../network/ErrorHandling.dart';

class ForgotPinController extends GetxController with StateMixin<dynamic> {
  static ForgotPinController get to => Get.find();
  late String referenceCode;
  var isTimeOnGoing = false.obs;
  var isCustomer = true;
  late TextEditingController otpTextController;
  late TextEditingController mobileTextController = TextEditingController();
  late GlobalKey<FormState> formKey;
  var enableOtpButton = false.obs;
  var enableSubmitOtpButton = false.obs;
  var enableGenrateOtpButton = false.obs;
  var enablePINButton = false.obs;
  var enableMobileView = true.obs;
  var enableOtpView = false.obs;

  Timer? _timer;
  var timerValue = 60.obs;
  int remainingSeconds = 1;
  final time = '00:00'.obs;

  SignInModel? model;

  @override
  Future<void> onInit() async {
    otpTextController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    var mobile = await SessionManager.getMobileNumber();
    mobileTextController.text = mobile;
    setEnableGenrateOtpButton(true);
    setMobileView();
    super.onReady();
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }

  void setEnableOtpButton(bool boo) {
    enableOtpButton(boo);
    update();
  }

  void setEnableGenrateOtpButton(bool boo) {
    enableGenrateOtpButton(boo);
    update();
  }

  void setPINButton(bool boo) {
    enablePINButton(boo);
    update();
  }

  void setEnableSubmitOtpButton(bool boo) {
    enableSubmitOtpButton(boo);
    update();
  }

  void setMobileView() {
    enableMobileView(true);
    enableOtpView(false);
    otpTextController.clear();
    isCustomer = true;
    cancelTimer();
    update();
  }

  void setOTPView() {
    enableOtpView(true);
    enableMobileView(false);
    update();
  }

  void verifyOTP() async {
    DialogHelper.showLoading();
    model = null;
    var mobileNo = mobileTextController.text.toString();
    var otp = otpTextController.text.toString();
    SignInProvider().verifyOTPResetPin(otp, referenceCode).then((value) async {
      var jsonMap = jsonDecode(value);
      DialogHelper.dismissLoader();
      cancelTimer();
      onEndTimer();
      ErrorHandling.showToast("OTP verified successfully");
      navigateToPinSetup();
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

  Future<void> startTimer(bool isVoice, bool isOtpView) async {
    otpTextController.clear();
    await sendOtp(mobileTextController.text.trim(), isVoice, isOtpView);
  }

  Future<void> setstartTime() async {
    if (mobileTextController.text.isEmpty) {
      mobileTextController.text = await SessionManager.getMobileNumber();
      update();
    }

    timerValue(60);
    cancelTimer();
    isTimeOnGoing(true);
    update();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (timerValue.value == 0) {
        timer.cancel();
        onEndTimer();
      } else {
        timerValue.value--;
        update();
        print("time $timerValue");
      }
    });
  }

  void onEndTimer() {
    isTimeOnGoing(false);
    update();
  }

  Future<void> sendOtp(String mobileNo, bool isVoice, bool isOtpView) async {
    SignInProvider().sendOTPResetPin(mobileNo, isVoice).then(
      (value) {
        var jsonMap = jsonDecode(value);
        referenceCode = jsonMap['referenceCode'];
        isCustomer = true;
        update();
        setstartTime();
        if (isOtpView) {
          setOTPView();
        }
        ErrorHandling.showToast(jsonMap['message']);
      },
      onError: (error) {
        if (error is BadRequestException) {
          var object = jsonDecode(error.toString());
          ErrorHandling.showToast(object['message']);
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
    mobileTextController.dispose();
    cancelTimer();
    super.dispose();
  }

  void navigateToPinSetup() {
    Get.offAll(() =>  SignInPage3(isForgot: true,refCode: referenceCode,), binding: SignInBiding());
  }

  void onBackPress() {
    Get.back();
  }
}
