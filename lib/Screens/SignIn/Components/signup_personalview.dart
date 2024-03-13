import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Controllers/sing_in_controller.dart';
import '../../../Models/StateModel.dart';
import '../../../Utils/Validator.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/print_logs.dart';
import '../../../Utils/strings.dart';
import 'OtpView.dart';
import 'RoundedTextField.dart';
import 'SignInComponents.dart';
import 'TextFieldContainer.dart';

class SignUpPersonalView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPersonalViewState();
  }
}

class _SignUpPersonalViewState extends State<SignUpPersonalView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          maintitle(Strings.personalInformation),
          SizedBox(
            height: 5,
          ),
          mainDescp(Strings.personalInformationDesc),
          SizedBox(
            height: 30,
          ),
          subtitle(Strings.firstName),
          const SizedBox(
            height: 10,
          ),
          RoundedTextField(
            onChanged: (value) {
              // controller.isFirstNameError(value.isEmpty);
              // controller.update();
            },
            keyboardType: TextInputType.name,
            validator: (value) {
              return null;
            },
            controller: controller.firstNameController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
            ],
            isEnabled: true,
            hint: Strings.enterFirstName,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isFirstNameError.value)
            Text(
              Strings.fieldRequired,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: Strings.fontFamilyName,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          subtitle(Strings.lastName),
          const SizedBox(
            height: 10,
          ),
          RoundedTextField(
            onChanged: (value) {
              // controller.isFirstNameError(value.isEmpty);
              // controller.update();
            },
            keyboardType: TextInputType.name,
            validator: (value) {
              return null;
            },
            controller: controller.lastNameController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
            ],
            isEnabled: true,
            hint: Strings.enterLastName,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isLastNameError.value)
            Text(
              Strings.fieldRequired,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: Strings.fontFamilyName,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          subtitle(Strings.emailId),
          const SizedBox(
            height: 10,
          ),
          RoundedTextField(
            onChanged: (value) {
              // controller.isFirstNameError(value.isEmpty);
              // controller.update();
            },
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return null;
            },
            controller: controller.emailController,
            inputFormatters: <TextInputFormatter>[],
            isEnabled: true,
            hint: Strings.enterEmailId,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isEmailError.value)
            Text(
              Strings.emailInvalid,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: Strings.fontFamilyName,
              ),
            ),
          SizedBox(
            height: 10,
          ),
          subtitle(Strings.state),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () {
                _showDropDownBottomSheet(context, true, controller,
                    controller.listOfStates, controller.listOfStates);
              },
              child: TextFieldContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.isStateSelected.value
                          ? controller.selectedState.value
                          : Strings.selectState,
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: controller.isStateSelected.value
                            ? primaryTextColor
                            : rateTextFieldHintColor,
                      ),
                    ),
                    Image.asset(
                      'assets/images/ic_arrow_down.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isStateError.value)
            Text(
              Strings.fieldRequired,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: Strings.fontFamilyName,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          subtitle(Strings.city),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () {
                if (controller.isStateSelected.value) {
                  _showDropDownBottomSheet(context, false, controller,
                      controller.listOfCities, controller.listOfCities);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select state first..'),
                    ),
                  );
                }
              },
              child: TextFieldContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.isCitySelected.value
                          ? controller.selectedCity.value
                          : Strings.selectCity,
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: controller.isCitySelected.value
                            ? primaryTextColor
                            : rateTextFieldHintColor,
                      ),
                    ),
                    Image.asset(
                      'assets/images/ic_arrow_down.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isCityError.value)
            Text(
              Strings.fieldRequired,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: Strings.fontFamilyName,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.reference),
          const SizedBox(
            height: 10,
          ),
          RoundedTextField(
            onChanged: (value) {
              // controller.isFirstNameError(value.isEmpty);
              // controller.update();
            },
            keyboardType: TextInputType.text,
            validator: (value) {
              return null;
            },
            controller: controller.refernceController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
            ],
            isEnabled: true,
            hint: Strings.referencedesc,
            textInputAction: TextInputAction.next,
          ),
          RichText(
              text: TextSpan(
            text: "Enter 6-digit OTP sent to  ",
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: controller.mobileTextController.text,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
              WidgetSpan(
                  child: GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    size: 15,
                    Icons.edit,
                    color: primaryTextColor,
                  ),
                ),
                onTap: () {
                  controller.setMobileView();
                },
              )),
            ],
          )),
          SizedBox(
            height: 15,
          ),
          OtpView(
            isError: false,
            controller: controller.otpTextController,
            otpLength: 6,
            isobscureText: false,
            onChanged: (pin) async {
              if (Validator.validateOtp(pin)) {
                controller.setEnableOtpButton(true);
              } else {
                controller.setEnableOtpButton(false);
              }
            },
            keyboardType: TextInputType.number,
            validator: (value) {
              return null;
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => controller.isTimeOnGoing.value
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              Strings.otpExpiresIn,
                              style: TextStyle(
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: primaryTextColor,
                              ),
                            ),
                            CountdownTimer(
                              controller: controller.countdownTimerController,
                              widgetBuilder: (_, CurrentRemainingTime? time) {
                                if (time == null) {
                                  return const SizedBox();
                                }
                                var sec = "00";
                                try {
                                  if (time.sec! < 10) {
                                    sec = "0${time.sec}";
                                  } else {
                                    sec = time.sec!.toString();
                                  }
                                } catch (e) {
                                  if (time.sec != null) {
                                    sec = time.sec!.toString();
                                  }
                                  PrintLogs.printException(e);
                                }
                                return Text(
                                  ' 00 : $sec',
                                  style: TextStyle(
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: primaryTextColor,
                                  ),
                                );
                              },
                            ),
                          ],
                        ))
                    : const SizedBox(
                        height: 0,
                      ),
              ),
              Row(
                children: [
                  Spacer(),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${Strings.didntGetAnOtp} ",
                          style: TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: primaryTextColor,
                          ),
                        ),
                        TextSpan(
                          text: Strings.resend,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  if (!controller.isTimeOnGoing.value)
                                    {controller.startTimer(false, false)}
                                },
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            color: controller.isTimeOnGoing.value
                                ? secondaryTextColor
                                : primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' or ',
                          style: TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: primaryTextColor,
                          ),
                        ),
                        TextSpan(
                          text: Strings.getcall,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  if (!controller.isTimeOnGoing.value)
                                    {controller.startTimer(false, false)}
                                },
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            color: controller.isTimeOnGoing.value
                                ? secondaryTextColor
                                : primaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      );
    });
  }
}

void _showDropDownBottomSheet(
    BuildContext context,
    bool isState,
    SignInController controller,
    List<StateModel> tempListOfCities,
    List<StateModel> listOfCities) {
  try {
    FocusScope.of(context).unfocus();
    tempListOfCities = listOfCities;

    TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        //3
        return Container(
          margin: const EdgeInsets.only(top: 55),
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: DraggableScrollableSheet(
              expand: true,
              initialChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 20,
                          ),
                          child: Text(
                            isState ? Strings.selectState : Strings.selectCity,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    hintText: Strings.search,
                                    hintStyle: TextStyle(
                                      fontFamily: Strings.fontFamilyName,
                                      color: rateTextFieldHintColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(),
                                    ),
                                    suffixIcon: const Icon(Icons.search),
                                  ),
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        if (value.isNotEmpty) {
                                          tempListOfCities = _buildSearchList(
                                              value, listOfCities);
                                        } else {
                                          tempListOfCities = listOfCities;
                                        }
                                      },
                                    );
                                  },
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Strings.fontFamilyName,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                color: black,
                                onPressed: () {
                                  setState(
                                    () {
                                      searchController.clear();
                                      tempListOfCities = listOfCities;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        (tempListOfCities.isNotEmpty)
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: tempListOfCities.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: _showBottomSheetWithSearch(
                                          index, tempListOfCities),
                                      onTap: () {
                                        var value = tempListOfCities[index];

                                        if (isState) {
                                          controller.setSelectedState(
                                              value.name, value.id.toString());
                                        } else {
                                          controller.setSelectedCity(
                                              value.name, value.id.toString());
                                        }

                                        controller.searchController.clear();

                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text(
                                  Strings.noDataAvailable,
                                  style: TextStyle(
                                    color: rateTextFieldHintColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Strings.fontFamilyName,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  } catch (e) {
    PrintLogs.printException(e);
  }
}

Widget _showBottomSheetWithSearch(int index, List<StateModel> listOfCities) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: primaryColor,
        width: 1,
      ),
      color: white,
    ),
    child: Text(
      listOfCities[index].name,
      style: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: Strings.fontFamilyName,
      ),
      textAlign: TextAlign.start,
    ),
  );
}

List<StateModel> _buildSearchList(
    String userSearchTerm, List<StateModel> listOfCities) {
  List<StateModel> _searchList = [];

  for (int i = 0; i < listOfCities.length; i++) {
    String name = listOfCities[i].name;
    if (name.toLowerCase().contains(userSearchTerm.toLowerCase())) {
      _searchList.add(listOfCities[i]);
    }
  }
  return _searchList;
}
