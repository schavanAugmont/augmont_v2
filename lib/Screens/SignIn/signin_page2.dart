import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Models/StateModel.dart';
import '../../Network/ErrorHandling.dart';
import '../../Utils/colors.dart';
import '../../Utils/print_logs.dart';
import '../../Utils/strings.dart';
import 'Components/RoundedTextField.dart';
import 'Components/TextFieldContainer.dart';
import 'Components/signIn_otpview.dart';
import 'Components/signup_personalview.dart';

class SignInPage2 extends StatefulWidget {
  const SignInPage2({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignInPageState2();
  }
}

class SignInPageState2 extends State<SignInPage2> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
              child: Scaffold(
            bottomNavigationBar: Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              // Adjust padding as needed
              child: ElevatedButton(
                  onPressed: () {
                    if (controller.isCustomer) {
                      if (controller.enableOtpButton.value) {
                          controller.signIn();
                      } else {
                        ErrorHandling.showToast(Strings.enterOtp);
                      }
                    } else {
                      if (controller.validateBasciInformation()) {
                        if (controller.enableOtpButton.value) {
                          controller.signUp();
                        } else {
                          ErrorHandling.showToast(Strings.enterOtp);
                        }
                      }
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  child: Text(
                      controller.isCustomer
                          ? Strings.verifyOtp
                          : Strings.submit,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: const Icon(
                            size: 15,
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onTap: () {
                            controller.onBackPress();
                          },
                        ),
                        Spacer(),
                        Text("Step 2 0f 3",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ))
                      ],
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey,
                      margin: EdgeInsets.symmetric(vertical: 30),
                    ),
                    SignInOTPView()
                  ],
                ),
              ),
            ),
          )));
    });
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
                              isState
                                  ? Strings.selectState
                                  : Strings.selectCity,
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                                value.name,
                                                value.id.toString());
                                          } else {
                                            controller.setSelectedCity(
                                                value.name,
                                                value.id.toString());
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
}
