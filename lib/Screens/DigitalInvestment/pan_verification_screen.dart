import 'package:augmont_v2/Screens/DigitalInvestment/goldagreement_screen.dart';
import 'package:augmont_v2/Screens/DigitalInvestment/linechart_widget.dart';
import 'package:augmont_v2/controllers/digitalinvestment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../bindings/digitalinvestment_binding.dart';
import '../../controllers/dgsip_controller.dart';
import '../Home/Components/home_components.dart';
import '../SignIn/Components/RoundedTextField.dart';
import '../SignIn/Components/SignInComponents.dart';
import 'barchart_widget.dart';
import 'donutchart_widget.dart';

class PanVerificationScreen extends StatefulWidget {
  const PanVerificationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PanVerificationState();
  }
}

class _PanVerificationState extends State<PanVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DgSIPController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
            //replace with our own icon data.
          ),
          title: Transform(
              // you can forcefully translate values left side using Transform
              transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
              child: Text(Strings.panVerification,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
        bottomNavigationBar: Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // Adjust padding as needed
            child: ElevatedButton(
                onPressed: () {
                  // if (controller.validatePAn()) {}

                  Get.back();
                  Get.to(() => GoldAgreementScreen(),
                      binding: DigitalInvestmentBiding());
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55.0),
                    backgroundColor: Colors.black),
                child: Text(Strings.verify,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    )))),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 300,
                    color: shadowColor,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Spacer(),
                        Center(
                            child: Text('Verify Yourself',
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ))),
                        Center(
                            child: Text('Verify Yourself via your PAN number',
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                )))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  subtitle(Strings.panCard),
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
                    controller: controller.panCardController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
                    ],
                    isEnabled: true,
                    hint: Strings.enterPanCard,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (controller.isPANError.value)
                    Text(
                      controller.panCardController.text.isEmpty
                          ? Strings.fieldRequired
                          : controller.errorMessage.value,
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
                  subtitle(Strings.dateOfBirth),
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
                    controller: controller.dobController,
                    inputFormatters: const [],
                    onTap: () {
                      controller.selectDateOfBirth(context);
                    },
                    hint: Strings.enterDateOfBirth,
                    textInputAction: TextInputAction.next,
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (controller.isPANError.value)
                    Text(
                      controller.dobController.text.isEmpty
                          ? Strings.fieldRequired
                          : controller.dobErrorMessage.value,
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
                ],
              )),
        ),
      ));
    });
  }
}
