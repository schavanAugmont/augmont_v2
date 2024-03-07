import 'package:augmont_v2/Screens/GoldGift/gift_summary_screen.dart';
import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:augmont_v2/bindings/gifting_binding.dart';
import 'package:augmont_v2/controllers/goldgift_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../Utils/themes.dart';
import 'gift_themes_screen.dart';

class GiftContactScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GiftContactScreen();
  }
}

class _GiftContactScreen extends State<GiftContactScreen> {
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
                     Get.to(()=> GiftSummaryScreen(),binding: GiftingBinding());
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55.0),
                        backgroundColor: Colors.black),
                    child: Text(Strings.proceed,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))),
            body: SingleChildScrollView(
                child: Column(
                    children: [
                      giftCardTemplates(controller),
                      giftDetailsWidget(controller)
                    ],
                  ),
                ),
          ));
    });
  }

  Widget giftCardTemplates(GoldGiftController controller) {
    return Container(
      height: MediaQuery.sizeOf(context).height/2.5,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: kycProductBackgroundColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: kycProductBackgroundColor),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            color: shadowColor,
            height: 100,
            width: 100,
          ),
          SizedBox(height: 15,),
          maintitle("Select from Contact"),
          mainDescp("Allow Augmont to access contacts"),
          SizedBox(height: 10,),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: const BorderSide(
                width: 1.0,
                color: primaryTextColor,
              ),
            ),
            onPressed: () {

            },
            child: Text(Strings.allow,
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
          )

        ],
      ),
    );
  }

  Widget giftDetailsWidget(GoldGiftController controller) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        maintitle("Send to"),
        SizedBox(
          height: 15,
        ),
        subtitle1(Strings.enterMobileNumber),
        SizedBox(
          height: 7,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          textAlign: TextAlign.start,
          maxLength: 10,
          maxLines: 1,
          controller: controller.mobileTextController,
          onChanged: (value) {
            setState(() {
              controller.selectedgram = value;
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
            hintText: Strings.enterMobileNumber,
          ),
          style: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: primaryTextColor,
          ),
        ),

      ],
    ));
  }
}
