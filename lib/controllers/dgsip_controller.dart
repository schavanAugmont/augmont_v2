import 'package:augmont_v2/Screens/DigitalInvestment/OneTime/onetime_summary_screen.dart';
import 'package:augmont_v2/Screens/DigitalInvestment/pan_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Screens/SignIn/Components/SignInComponents.dart';
import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';
import '../Utils/utils.dart';
import '../bindings/digitalinvestment_binding.dart';

class DgSIPController extends GetxController {
  bool isGoldSelected = true;
  bool isSwitched = false;
  var selectedPartner=0;
  late TextEditingController priceTextController = TextEditingController();
  var selectedTime = '';
  var selectedamount = '';
  List<String> amountList = ['500', '1000', '20000', '5000', '6000'];
  List<String> timelineList = ['One Time', 'Daily', 'Weekly', 'Monthly'];
  List<String> stepupAmtList = ['20', '50', '100', '200', '500'];
  List<String> stepupPercList = ['5%', '10%', '6%', '15%', '20%'];
  List<String> stepupIntervalList = ['6 months', '1 year', '2 years'];
  var timeline = 'Daily';

  late TextEditingController panCardController;
  late TextEditingController dobController;

  late TextEditingController investmentController;
  late TextEditingController startDateController;

  var isPANError = false.obs;
  var isDOBError = false.obs;
  late DateTime currentDate;
  var selectedDate = "".obs;
  var errorMessage = "".obs;
  var dobErrorMessage = "".obs;

  var isInvestError = false.obs;
  var isSelectDateError = false.obs;

  @override
  void onInit() {
    panCardController = TextEditingController();

    investmentController = TextEditingController();
    startDateController = TextEditingController();

    dobController = TextEditingController(text: selectedDate.value);
    currentDate = DateTime.now();
    super.onInit();
  }

  void onViewTap(bool bool) {
    isGoldSelected = bool;
    update();
  }

  void enableGoldPlusDailog(BuildContext context) {
    bool _isSwitched = false;
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height * 0.40,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Enable Gold+",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                          "Get higher returns on your investment by leasing gold without any lock-in peroid!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    color: kycProductBackgroundColor,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                _isSwitched
                                    ? Strings.goldplusEnablemsg
                                    : Strings.switchgoldmsg,
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                )),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                                _isSwitched
                                    ? Strings.goldplusEnabledecp
                                    : Strings.switchgolddscp,
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                )),
                          ],
                        )),
                        Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: _isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched = value;
                                });
                              },
                              activeTrackColor: primaryTextColor,
                              activeColor: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  if (!_isSwitched)
                    Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(
                              width: 1.0,
                              color: primaryTextColor,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(Strings.proceedWithGoldpl,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )),
                        )),
                  if (_isSwitched)
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 40.0),
                          backgroundColor: primaryTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                        child: Text(Strings.continuetxt,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ))),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void enableLeasingDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height * 0.40,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Start Leasing Now!",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                          "Investing a minimum amout of 5000 would initiate Growth+ immediately. You don't have to if you don't want to. ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  mainDescp(Strings.enterAmount),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.start,
                    maxLength: 10,
                    maxLines: 1,
                    controller: priceTextController,
                    onChanged: (value) {},
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: kycProductBackgroundColor,
                      filled: true,
                      counterText: "",
                      hintText: Strings.enterAmount,
                    ),
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => PanVerificationScreen(),
                            binding: DigitalInvestmentBiding());
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.continuetxt,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void otgDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height * 0.30,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Minimum amount needed!",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                          "One timebuying in growth needs a minimum amount to initiate (500) ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => OneTimeSummaryScreen(),
                            binding: DigitalInvestmentBiding());
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.continuetxt,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void goldAggrementDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return  Popover(
            maxheight: MediaQuery.sizeOf(context).height,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.termCondition,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                 Expanded(child:  Text(
                      "Please read the following terms and conditions before registering on, accessing or using the website www.augmont.com (\"this Website\") or the Augmont mobile application (“this App”) or any similar platform (hereinafter collectively called the Platform). This Website and this App are owned and operated by Augmont Goldtech Private Limited (Formerly Augmont Precious Metals Private Limited).\nWe, Augmont Goldtech Private Limited and/or our designated affiliates (jointly \"Augmont\") provide the Platform features to you, the User/Member/Registered Member/Customer subject to your acceptance of the following Terms and Conditions of Access and Use, constituting an agreement between us (\"Agreement\"). “Product/Bullion” shall mean gold/silver in the form of bars/coins/jewellery or any other form as maybe introduced by Augmont. If you continue to use the Platform or communicate with us, you will be deemed to have accepted these Terms and Conditions of Access and Use. Please read these Terms and Conditions of Access and Use carefully. In addition, when you use any current or future Augmont service or products, you will also be subject to the guidelines, terms and agreements applicable to such service or business (\"Specific Terms\"). If the Terms and Conditions of Access and Use are expressly inconsistent with such Specific Terms, the Specific Terms will prevail.\nAugmont may revise these Terms and Conditions of Access and Use and Specific Terms from time to time and at any time, without notice to you. If you do not agree to be bound by these Terms and Conditions of Access and Use, as modified from time to time, you should leave the Platform immediately. The Terms and Conditions of Access and Use and Specific Terms shall be hereinafter collectively referred to as”Terms and Conditions”.\nThe section titles in these Terms and Conditions are for convenience only and have no legal effect.",
                      textAlign: TextAlign.start,
                     overflow: TextOverflow.ellipsis,
                     maxLines: 20,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ) )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.continuetxt,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ],
              ),
            ),
          );

      },
    );
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

  bool validatePAn() {
    if (Utils().validatePAN(panCardController.text) &&
        panCardController.text.isNotEmpty &&
        dobController.text.isNotEmpty) {
      isPANError(false);
      isDOBError(false);
      update();
      return true;
    } else {
      if (panCardController.text.isEmpty) {
        isPANError(true);
      } else if (!Utils().validatePAN(panCardController.text)) {
        isPANError(true);
        errorMessage("Invalid PAN Number");
      } else {
        isPANError(false);
      }
      if (dobController.text.isEmpty) {
        isDOBError(true);
      } else if (calculateAge() < 18) {
        isDOBError(true);
        dobErrorMessage("Age should be greater than 18 years");
      } else {
        isDOBError(false);
      }
      update();
      return false;
    }
  }

  int calculateAge() {
    var formatter = DateFormat("dd/MM/yyyy");
    DateTime birthDate = formatter.parse(dobController.text);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime initial = DateTime.now().add(const Duration(days: 5));

    if ([29, 30, 31].contains(initial.day)) {
      initial = DateTime.now().add(const Duration(days: 6));
    }

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initial,
        firstDate: initial,
        lastDate: DateTime.now().add(const Duration(days: 371)),
        selectableDayPredicate: (date) {
          return ![29, 30, 31].contains(date.day);
        });
    if (picked != null && picked != DateTime.now()) {
      startDateController.text =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
      update();
    }
  }
}
