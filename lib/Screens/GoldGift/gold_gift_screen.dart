import 'package:augmont_v2/controllers/goldgift_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

class GoldGiftScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _GoldGiftScreen();
  }
}


class _GoldGiftScreen extends State<GoldGiftScreen>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoldGiftController>(builder: (controller) {
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
                  child: Text(Strings.giftGold,
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

                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55.0),
                        backgroundColor: Colors.black),
                    child: Text(Strings.next,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))),
            body: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            ),
          ));
    });
  }
}