import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:augmont_v2/Bindings/signin_binding.dart';
import 'package:augmont_v2/Screens/SignIn/forgotpin_page.dart';
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
import '../Screens/SignIn/Components/SignInComponents.dart';
import '../Screens/SignIn/signin_page2.dart';
import '../Screens/SignIn/signin_page3.dart';
import '../Utils/Validator.dart';
import '../Utils/colors.dart';
import '../Utils/device_util.dart';
import '../Utils/dialog_helper.dart';
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';
import '../bindings/forgotpin_binding.dart';
import '../network/ErrorHandling.dart';

class SignInController extends GetxController with StateMixin<dynamic> {
  late LocalAuthentication _localAuthentication;

  static SignInController get to => Get.find();
  var canCheckBiometrics = false.obs;
  var isUserAuthenticated = false.obs;

  var isTimeOnGoing = false.obs;

  var isStateSelected = false.obs;
  var isCitySelected = false.obs;
  var isCustomer = true;
  var isPinAdded = false.obs;
  var isBiometricAdded = false.obs;
  var isBiometricClick = false.obs;
  var isBiometricAvl = false.obs;

  var selectedState = "".obs;
  var selectedCity = "".obs;
  var selectedStateId = "".obs;
  var selectedCityId = "".obs;

  List<StateModel> listOfStates = [];

  List<StateModel> listOfCities = [];

  //late final TextEditingController otpTextController;
  //late OTPTextEditController otpTextController;
  late TextEditingController otpTextController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController refernceController;
  late TextEditingController stateController;
  late TextEditingController cityController;
  late TextEditingController searchController;
  late TextEditingController mobileTextController = TextEditingController();
  late GlobalKey<FormState> formKey;

  //late OTPInteractor otpInteractor;

  late String referenceCode;

  late TextEditingController pinTextController;
  late TextEditingController reenterpinTextController;

  var enableOtpButton = false.obs;
  var enableSubmitOtpButton = false.obs;
  var enableGenrateOtpButton = false.obs;
  var enablePINButton = false.obs;
  var enableMobileView = true.obs;
  var enableOtpView = false.obs;

  var isFirstNameError = false.obs;
  var isLastNameError = false.obs;
  var isStateError = false.obs;
  var isCityError = false.obs;
  var isEmailError = false.obs;
  var isForgotPIN = false.obs;

  var pinError = false.obs;
  var repinError = false.obs;

  Timer? _timer;
  var timerValue = 60.obs;
  int remainingSeconds = 1;
  final time = '00:00'.obs;

  late CountdownTimerController countdownTimerController;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  SignInModel? model;

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  Future<void> onInit() async {
    pinTextController = TextEditingController();
    reenterpinTextController = TextEditingController();
    otpTextController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    emailController = TextEditingController();
    searchController = TextEditingController();
    refernceController = TextEditingController();
    formKey = GlobalKey<FormState>();

    setPinData();

    countdownTimerController = CountdownTimerController(
      endTime: endTime,
      onEnd: onEndTimer,
    );

    _localAuthentication = LocalAuthentication();
    checkingForBioMetrics();

    fetchStateList();
    super.onInit();
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

  void setForgotData(bool isForgot, String refCode) {
    isForgotPIN(isForgot);
    referenceCode = refCode;
    update();
  }

  void setMobileView() {
    enableMobileView(true);
    enableOtpView(false);
    //mobileTextController.clear();
    otpTextController.clear();
    firstNameController.clear();
    lastNameController.clear();
    stateController.clear();
    cityController.clear();
    emailController.clear();
    selectedState = "".obs;
    selectedCity = "".obs;
    selectedStateId = "".obs;
    selectedCityId = "".obs;
    isLastNameError(false);
    isFirstNameError(false);
    isEmailError(false);
    isStateError(false);
    isCityError(false);
    isCustomer = true;
    update();
    Get.back();
  }

  void setOTPView() {
    enableOtpView(true);
    enableMobileView(false);

    update();
  }

  void setSelectedState(value, id) {
    isStateSelected(true);
    isCitySelected(false);
    isStateError(false);
    selectedState(value);
    selectedStateId(id);
    selectedCity("");
    selectedCityId("-1");
    fetchCityList();

    update();
  }

  void setSelectedCity(value, id) {
    isCitySelected(true);
    isCityError(false);
    selectedCity(value);
    selectedCityId(id);
    update();
  }

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    PrintLogs.printData(canCheckBiometrics.toString());
    this.canCheckBiometrics(canCheckBiometrics);
    isBiometricAvl(canCheckBiometrics);
    update();
    return canCheckBiometrics;
  }

  void authenticateMe() async {
    bool authenticated = false;
    try {
      _isAuthenticating = true;
      _authorized = 'Authenticating';
      update();
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      _isAuthenticating = false;
      _authorized = 'Authenticating';
      update();
    } on PlatformException catch (e) {
      print(e);
      _isAuthenticating = false;
      _authorized = 'Error - ${e.message}';

      update();
      return;
    }
    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    _authorized = message;
    ErrorHandling.showToast(_authorized);
    if (authenticated) {
      verifyPin(false);
    }
    update();
  }

  void signIn() async {
    DialogHelper.showLoading();
    model = null;
    var mobileNo = mobileTextController.text.toString();
    var otp = otpTextController.text.toString();
    SignInProvider().signIn(mobileNo, otp, referenceCode).then((value) async {
      var jsonMap = jsonDecode(value);
      DialogHelper.dismissLoader();
      model = SignInModel.fromJson(jsonMap);
      if (model != null) {
        cancelTimer();
        onEndTimer();
        SessionManager.setToken(model!.token!);
        SessionManager.setMobileNumber(mobileNo);
        SessionManager.setIsPinAdded(model!.customerDetails!.isPinAdded!);
        SessionManager.setDeviceId(model!.customerDetails!.deviceId!);
        SessionManager.setIsLoggedIn(true);
        SessionManager.setIsBiometricAdded(
            model!.customerDetails!.isBiometricEnable!);
        isPinAdded(model!.customerDetails!.isPinAdded);
        update();
        if (model!.customerDetails!.isPinAdded! && isCustomer) {
          ErrorHandling.showToast("User logged in successfully");
          navigateToPinSetup();
        } else if (!model!.customerDetails!.isPinAdded! && isCustomer) {
          ErrorHandling.showToast("User logged in successfully");
          navigateToPinSetup();
        } else if (!model!.customerDetails!.isPinAdded! && !isCustomer) {
          navigateToBasicDetails();
        }
      }
    }, onError: (error) {
      if (error is InvalidInputException) {
        otpTextController.text = "";
      }
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
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
    print("isFo ${isForgotPIN.value}");
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
    SignInProvider().generateOtp(mobileNo, isVoice).then(
      (value) {
        var jsonMap = jsonDecode(value);

        var model = GenerateOtpModel.fromJson(jsonMap);
        referenceCode = model.referenceCode;
        isCustomer = model.isCustomer;
        update();
        setstartTime();
        if (isOtpView) {
          // setOTPView();
          Get.to(
            () => const SignInPage2(),
          );
        }
        ErrorHandling.showToast(model.message);
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
    //await otpTextController.stopListen();
    countdownTimerController.dispose();
    mobileTextController.dispose();
    cancelTimer();
    //   otpTextController.dispose();
    super.dispose();
  }

  void clearSessionFields() async {
    SessionManager.setIsGoldSelected(true);
    SessionManager.setIsAmountEdited(false);
    SessionManager.setIsGramEdited(false);
    SessionManager.setQuickValue("");
    SessionManager.setAfterSignInScreen("");
  }

  bool validateBasciInformation() {
    var isValid = true;

    if (firstNameController.text.trim().isEmpty) {
      isFirstNameError(true);
      isValid = false;
    } else if (lastNameController.text.trim().isEmpty) {
      isFirstNameError(false);
      isLastNameError(true);
      isValid = false;
    } else if (!Validator.validateEmailAddress(emailController.text.trim())) {
      isLastNameError(false);
      isFirstNameError(false);
      isEmailError(true);
      isValid = false;
    } else if (selectedState.trim().isEmpty) {
      isLastNameError(false);
      isFirstNameError(false);
      isEmailError(false);
      isStateError(true);
      isValid = false;
    } else if (selectedCity.trim().isEmpty) {
      isLastNameError(false);
      isFirstNameError(false);
      isEmailError(false);
      isStateError(false);
      isCityError(true);
      isValid = false;
    } else {
      isLastNameError(false);
      isFirstNameError(false);
      isEmailError(false);
      isStateError(false);
      isCityError(false);
      isValid = true;
    }

    update();

    return isValid;
  }

  bool validatePINChange() {
    var isValid = true;

    if (pinTextController.text.trim().isEmpty) {
      pinError(true);
      isValid = false;
    } else if (reenterpinTextController.text.trim().isEmpty) {
      pinError(false);
      repinError(true);
      isValid = false;
    } else if (reenterpinTextController.text.trim() !=
        pinTextController.text.trim()) {
      pinError(false);
      repinError(true);
      isValid = false;
    } else {
      pinError(false);
      repinError(false);
      isValid = true;
    }

    update();

    return isValid;
  }

  void onBackPress() {
    Get.back();
  }

  void navigateToBasicDetails() {
    Get.to(
      () => const SignInPage2(),
    );
  }

  void showBiomatricPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  child: Image.asset(
                    Platform.isAndroid
                        ? 'assets/images/ic_fingerprint.png'
                        : 'assets/images/ic_face_id.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                mainDescp(Platform.isAndroid
                    ? Strings.unlockWithFinger
                    : Strings.unlockWithFcID),
                SizedBox(
                  height: 5,
                ),
                // maintitle(Strings.keepurAssets),
                Text(Strings.keepurAssets,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      isBiometricClick(true);
                      update();
                      Get.back();
                      setPin();
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: shadowColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        height: 40,
                        child: Center(
                            child: Text('Proceed',
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ))))),
                GestureDetector(
                  onTap: () {
                    isBiometricClick(false);
                    update();
                    Get.back();
                    setPin();
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 20),
                      height: 40,
                      child: Center(
                          child: Text('Not Now',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )))),
                )
              ],
            ),
          ),
        ); // Show custom popup
      },
    );
  }

  void fetchStateList() async {
    SignInProvider().getStateList().then((value) {
      var jsonMap = jsonDecode(value);

      listOfStates.clear();
      var data = jsonMap["data"];
      listOfStates =
          List<StateModel>.from(data.map((x) => StateModel.fromJson(x)));
    }, onError: (error) {
      ErrorHandling.handleErrors(error);
    });
  }

  void fetchCityList() async {
    SignInProvider().getCityList(selectedStateId.value).then((value) {
      var jsonMap = jsonDecode(value);

      var data = jsonMap["data"];
      listOfCities.clear;
      listOfCities =
          List<StateModel>.from(data.map((x) => StateModel.fromJson(x)));
    }, onError: (error) {
      ErrorHandling.handleErrors(error);
    });
  }

  void fetchPersonalDetails() async {
    SignInProvider().getPersonalDetails().then((value) {
      var jsonMap = jsonDecode(value);
      var details = PersonalInfoModel.fromJson(jsonMap);
      SessionManager.setUserDetail(value);
      SessionManager.setCustomerId(details.data!.id.toString());
      //UserinfoUpdateService.userInfo.getOccupation();
    }, onError: (error) {
      ErrorHandling.handleErrors(error);
    });
  }

  void fetchPassbookDetails() async {
    SignInProvider().getPassbookDetails().then((value) {
      try {
        var jsonMap = jsonDecode(value);

        var details = PassbookDetailsModel.fromJson(jsonMap);
        fetchPersonalDetails();
        fetchCustomerDetails();
      } catch (e) {
        DialogHelper.dismissLoader();
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      if (error is UnProcessableEntity) {
        existentCustomer();
      } else {
        ErrorHandling.handleErrors(error);
      }
    });
  }

  void existentCustomer() async {
    SignInProvider().existentCustomer().then((value) {
      var jsonMap = jsonDecode(value);
      var details = ApiMessage.fromJson(jsonMap);
      fetchPassbookDetails();
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  void fetchCustomerDetails() async {
    SignInProvider().getCustomerDetails().then((value) {
      DialogHelper.dismissLoader();

      var jsonMap = jsonDecode(value);

      var details = CustomerDetailsModel.fromJson(jsonMap);
      if (details.result.data.cityId?.id == -1) {
      } else {
        Get.offAll(
          () => const MainScreen(),
          binding: MainScreenBinding(),
          transition: Transition.rightToLeft,
        );
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  void navigateToPinSetup() {
    Get.to(() => SignInPage3(
          isForgot: false,
          refCode: referenceCode,
        ));
  }

  void setPin() async {
    DialogHelper.showLoading();
    SignInProvider().setPIN(pinTextController.text.toString()).then((value) {
      try {
        DialogHelper.dismissLoader();
        var jsonMap = jsonDecode(value);
        SessionManager.setIsPinAdded(true);

        update();
        ErrorHandling.showToast("PIN set successfully");
        debugPrint(jsonEncode(jsonMap));
        if (isBiometricClick.value) {
          setBiometric();
        } else {
          fetchPassbookDetails();
        }
      } catch (e) {
        DialogHelper.dismissLoader();
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  void resetPin() async {
    DialogHelper.showLoading();
    SignInProvider()
        .resetPIN(pinTextController.text.toString(), referenceCode)
        .then((value) {
      try {
        DialogHelper.dismissLoader();
        var jsonMap = jsonDecode(value);
        SessionManager.setIsPinAdded(true);
        debugPrint(jsonEncode(jsonMap));
        ErrorHandling.showToast("PIN reset successfully");
        fetchPassbookDetails();
      } catch (e) {
        DialogHelper.dismissLoader();
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  void verifyPin(bool isVerifyByPin) async {
    DialogHelper.showLoading();
    SignInProvider()
        .setValidatePIN(pinTextController.text.toString(), isVerifyByPin)
        .then((value) {
      try {
        DialogHelper.dismissLoader();
        var jsonMap = jsonDecode(value);
        debugPrint(jsonEncode(jsonMap));
        ErrorHandling.showToast(isVerifyByPin
            ? "PIN verify successfully"
            : "Biometric verified successfully");
        fetchPassbookDetails();
      } catch (e) {
        DialogHelper.dismissLoader();
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  void signUp() async {
    DialogHelper.showLoading();
    SignInProvider()
        .signUp(
      firstNameController.text.toString(),
      lastNameController.text.toString(),
      mobileTextController.text.toString(),
      selectedCityId.toString(),
      selectedStateId.toString(),
      otpTextController.text.toString(),
      referenceCode,
    )
        .then((value) {
      var jsonMap = jsonDecode(value);

      var model = SignInModel.fromJson(jsonMap);
      SessionManager.setToken(model!.token!);
      SessionManager.setMobileNumber(mobileTextController.text.toString());
      SessionManager.setIsLoggedIn(true);
      isPinAdded(false);
      update();
      ErrorHandling.showToast("User register successfully");
      navigateToPinSetup();
    }, onError: (error) {
      DialogHelper.dismissLoader();
      if (error is InvalidInputException) {
        otpTextController.text = "";
      }
      ErrorHandling.handleErrors(error);
    });
  }

  void setPinData() {
    var isPin = SessionManager.getIsPinAdded();
    var isBiomatric = SessionManager.getIsBiometricAdded();
    isPinAdded(isPin);
    isBiometricAdded(isBiomatric);
    update();
  }

  Future<void> enableForgotPIN() async {
    await Get.offAll(
      () => const ForgotPinPage(),
      binding: ForgotpinBiding(),
      transition: Transition.rightToLeft,
    );
  }

  void setBiometric() {
    DialogHelper.showLoading();
    SignInProvider().setBioMetric(true).then((value) {
      try {
        DialogHelper.dismissLoader();
        var jsonMap = jsonDecode(value);
        SessionManager.setIsBiometricAdded(true);
        SessionManager.setDeviceId(DeviceUtil.instance.deviceId.toString());
        debugPrint(jsonEncode(jsonMap));
        ErrorHandling.showToast("Biometric register successfully");
        fetchPassbookDetails();
      } catch (e) {
        DialogHelper.dismissLoader();
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  Future<void> showAuthPopup() async {
    var sessionDevice = await SessionManager.getDeviceId();
    bool isValidDevice = false;
    if (sessionDevice == DeviceUtil.instance.deviceId.toString()) {
      isValidDevice = true;
    }

    if (SignInController.to.isBiometricAdded.value &&
        !SignInController.to.isForgotPIN.value &&
        SignInController.to.isBiometricAvl.value &&
        isValidDevice) {
      SignInController.to.authenticateMe();
    }
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
