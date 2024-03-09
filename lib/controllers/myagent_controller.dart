import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';

class MyAgentController extends GetxController with StateMixin<dynamic> {

  List<String> unassignList=['Daily sales call from his end','He is not clear about what he is making me buy','He is forcing me to buy '];

  @override
  void onInit() {
    super.onInit();
  }

  void onBack() {
    Get.back();
  }

  void pauseSIPDailog(BuildContext context) {
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
                          decoration: BoxDecoration(
                            border: Border.all(color: kycProductBackgroundColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
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
                    height: 20,
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

}
