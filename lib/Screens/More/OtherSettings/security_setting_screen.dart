import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/policies_controller.dart';
import '../../../widgets/text_component.dart';

class SecuritySettingScreen extends StatefulWidget {
  const SecuritySettingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SecuritySettingState();
  }
}

class _SecuritySettingState extends State<SecuritySettingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoliciesController>(builder: (controller) {
      return PopScope(
          canPop: false, //It should be false to work
          onPopInvoked: (didPop) {
            if (didPop) {
              return;
            }
            controller.onBack();
          },
          child: SafeArea(
              child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0.0,
              leading: IconButton(
                onPressed: () {
                  controller.onBack();
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
                  child: Text(Strings.securitySetting,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: kycProductBackgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: shadowColor),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              textComponent(
                                  Strings.biometricUnlock, 13, FontWeight.w600),
                              textComponent(
                                  Strings.enabled, 10, FontWeight.normal),
                            ],
                          ),
                          Spacer(),
                          Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                value: true,
                                onChanged: (value) {},
                                activeTrackColor: primaryTextColor,
                                activeColor: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: kycProductBackgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: shadowColor),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          textComponent(
                              Strings.changePIN, 13, FontWeight.w600),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 11,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )));
    });
  }
}
