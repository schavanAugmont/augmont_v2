import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Screens/SignIn/Components/SignInComponents.dart';
import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';
import '../widgets/text_component.dart';

class MyAgentController extends GetxController with StateMixin<dynamic> {

  List<String> unassignList=['Daily sales call from his end','He is not clear about what he is making me buy','He is forcing me to buy '];

  @override
  void onInit() {
    super.onInit();
  }

  void onBack() {
    Get.back();
  }

  void unassignAgentDailog(BuildContext context) {
    var _pauseValue = '';
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height * 0.90,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Specify reason for un-assigning",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                  SizedBox(
                    height: 10,
                  ),

                  Expanded(
                      child: ListView.builder(
                        controller: ScrollController(),
                        itemCount: unassignList.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: kycProductBackgroundColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                            title: Text(unassignList[index],
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                )),
                            value: unassignList[index],
                            groupValue: _pauseValue,
                            onChanged: (value) {
                              setState(() {
                                _pauseValue = value.toString();
                              });
                            },
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  subtitle1("Tell us the reason"),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    color: kycProductBackgroundColor,
                    height: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.start,
                      maxLength: 200,
                      maxLines: null,
                     // controller: controller.messageTextController,
                      onChanged: (value) {
                        setState(() {

                        });
                      },
                      validator: (value) {
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: kycProductBackgroundColor,
                        filled: true,
                        counterText: "",
                        hintText: 'Specify the reason....',
                      ),
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                        unassignAgentSuccessDailog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.unassignAgent,
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


  void unassignAgentSuccessDailog(BuildContext context) {
    var _pauseValue = '';
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0), color: shadowColor),
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/referral_icon.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textComponent('Agent Un-Assign', 11, FontWeight.normal),
                  SizedBox(
                    height: 5,
                  ),
                  textComponent('Agent has been un-Assigned successfully!', 13, FontWeight.w600),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text("Okay, Thanks!",
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

}
