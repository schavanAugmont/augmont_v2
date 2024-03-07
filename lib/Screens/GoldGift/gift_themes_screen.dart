import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:augmont_v2/controllers/goldgift_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../Utils/themes.dart';

class GoldThemeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoldThemeScreen();
  }
}

class _GoldThemeScreen extends State<GoldThemeScreen> {
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
              child: Text(Strings.giftCartThemes,
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
            child:  Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 40.0),
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          width: 2.0,
                          color: primaryTextColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          // <-- Radius
                        ),
                      ),
                      child: Text("Discard",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.saveChange,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                )
              ],
            )),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              giftCardTemplates(controller),
            ],
          ),
        )),
      ));
    });
  }

  Widget giftCardTemplates(GoldGiftController controller) {
    return  ListView.builder(
      itemCount: controller.giftList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return  Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(8),
          width: MediaQuery.sizeOf(context).width,
          height: 150,
          color: kycProductBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    child: Image.asset('assets/images/auglogo.png'),
                  ),
                  Spacer(),
                  Radio(
                    value: index,
                    groupValue: controller.giftList[index],
                    onChanged: (val) {
                      setState(() {
                        controller.selectedGift = index;
                        controller.update();
                      });
                    },
                  ),
                ],
              ),

              Spacer(),
              Text(controller.giftList[index],
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ))
            ],
          ),
        );
      },
    );
  }


}
