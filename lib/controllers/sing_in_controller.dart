import 'dart:async';
import 'dart:convert';
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

class SignInController extends GetxController with StateMixin<dynamic> {
  late LocalAuthentication _localAuthentication;

  var canCheckBiometrics = false.obs;
  var isUserAuthenticated = false.obs;

  var isTimeOnGoing = false.obs;

  var isStateSelected = false.obs;
  var isCitySelected = false.obs;
  var isCustomer = false;
  var isPinAdded = false.obs;

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
  late TextEditingController mobileTextController;
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

  var pinError = false.obs;
  var repinError = false.obs;

  late CountdownTimerController countdownTimerController;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  SignInModel? model;

  @override
  Future<void> onInit() async {
    pinTextController = TextEditingController();
    reenterpinTextController = TextEditingController();
    mobileTextController = TextEditingController();
    otpTextController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    emailController = TextEditingController();
    searchController = TextEditingController();
    refernceController = TextEditingController();
    formKey = GlobalKey<FormState>();

    countdownTimerController = CountdownTimerController(
      endTime: endTime,
      onEnd: onEndTimer,
    );

    _localAuthentication = LocalAuthentication();
    checkingForBioMetrics();
    fetchStateList();
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
    update();
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
        SessionManager.setToken(model!.token!);
        SessionManager.setMobileNumber(mobileNo);
        debugPrint("object ${model!.isPinAdded} $isCustomer");
        isPinAdded(model!.isPinAdded);
        update();
        if (model!.isPinAdded! && isCustomer) {
          navigateToPinSetup();
        } else if (!model!.isPinAdded! && isCustomer) {
          navigateToPinSetup();
        } else if (!model!.isPinAdded! && !isCustomer) {
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

  void clearBackStack() {
    Get.until((route) => route.isFirst);
    Get.until((route) => route.isFirst, id: 0);
  }

  void startTimer(bool isVoice, bool isOtpView) {
    if (isOtpView) {
      setOTPView();
    }
    otpTextController.clear();
    sendOtp(mobileTextController.text.trim(), isVoice);
  }

  void setstartTime() {
    countdownTimerController.endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    countdownTimerController.start();
    isTimeOnGoing(true);
    update();
  }

  void onEndTimer() {
    isTimeOnGoing(false);
    update();
  }

  Future<void> sendOtp(String mobileNo,bool isVoice) async {
    SignInProvider().generateOtp(mobileNo, isVoice).then(
      (value) {
        var jsonMap = jsonDecode(value);

        var model = GenerateOtpModel.fromJson(jsonMap);
        referenceCode = model.referenceCode;
        isCustomer = model.isCustomer;
        setstartTime();
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
    } else if (reenterpinTextController.text.trim() != pinTextController.text.trim()) {
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
    Get.to(() => const SignInPage2());
  }

  void showBiomatricPopup(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Image.asset(
                  'assets/images/ic_lock.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  void fetchStateList() async {
    SignInProvider().getStateList().then((value) {
      var jsonMap = jsonDecode(value);

      listOfStates.clear();
      var data = jsonMap["data"];
      listOfStates = List<StateModel>.from(data.map((x) => StateModel.fromJson(x)));
    }, onError: (error) {
      ErrorHandling.handleErrors(error);
    });
  }

  void fetchCityList() async {
    SignInProvider().getCityList(selectedStateId.value).then((value) {
      var jsonMap = jsonDecode(value);

      var data = jsonMap["data"];
      listOfCities.clear;
      listOfCities = List<StateModel>.from(data.map((x) => StateModel.fromJson(x)));
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
    Get.to(() => const SignInPage3());
  }

  void setPin() async {
    SessionManager.setIsLoggedIn(true);
    SignInProvider().setPIN(pinTextController.text.toString()).then((value) {
      try {
        var jsonMap = jsonDecode(value);
        debugPrint(jsonEncode(jsonMap));
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

  void verifyPin() async {
    SessionManager.setIsLoggedIn(true);
    SignInProvider().setValidatePIN(pinTextController.text.toString(), true).then((value) {
      try {
        var jsonMap = jsonDecode(value);
        debugPrint(jsonEncode(jsonMap));
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
    SignInProvider().signUp(
      firstNameController.text.toString(),
      lastNameController.text.toString(),
      mobileTextController.text.toString(),
      selectedCityId.toString(),
      selectedStateId.toString(),
      otpTextController.text.toString(),
      referenceCode,
    ).then((value) {
      var jsonMap = jsonDecode(value);

      var model = SignInModel.fromJson(jsonMap);
      SessionManager.setToken(model!.token!);
      SessionManager.setMobileNumber(mobileTextController.text.toString());
      navigateToPinSetup();
    }, onError: (error) {
      DialogHelper.dismissLoader();
      if (error is InvalidInputException) {
        otpTextController.text = "";
      }
      ErrorHandling.handleErrors(error);
    });
  }
}
