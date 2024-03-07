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

class GoldGiftScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoldGiftScreen();
  }
}

class _GoldGiftScreen extends State<GoldGiftScreen> {
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
                  controller.accessContactAlert(context);
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
            child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              giftCardTemplates(controller),
              giftDetailsWidget(controller)
            ],
          ),
        )),
      ));
    });
  }

  Widget giftCardTemplates(GoldGiftController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: kycProductBackgroundColor),
          ),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                color: kycProductBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          child: Image.asset('assets/images/auglogo.png'),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text("* Card Preview *",
                                maxLines: 2,
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            ImageIcon(
                              AssetImage("assets/images/ic_image.png"),
                              size: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Align(
                      child: Text(controller.messageTextController.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          )),
                    ),

                    Spacer(),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Gold Gift Card of ",
                            style: CustomTheme.style(size: 10)),
                        TextSpan(
                          text: "${controller.selectedgram} gm",
                          style: CustomTheme.style(
                              size: 11, weight: FontWeight.bold),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        GestureDetector(onTap: (){
          Get.to(()=>GoldThemeScreen(),binding: GiftingBinding());
        },child: Align(
          child: Text(Strings.changeGiftCard,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              )),
        ),)
      ],
    );
  }

  Widget giftDetailsWidget(GoldGiftController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Divider(
          height: 0.2,
          color: kycProductBackgroundColor,
        ),
        SizedBox(
          height: 30,
        ),
        maintitle(Strings.entergiftDEtails),
        SizedBox(
          height: 15,
        ),
        subtitle(Strings.enterQuantity),
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
          controller: controller.quantityTextController,
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
            hintText: Strings.enterQuantity,
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
        SizedBox(
            height: 35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.gramList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.selectedgram = controller.gramList[index];
                        controller.quantityTextController.text =
                            controller.selectedgram;
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: controller.selectedgram ==
                                      controller.gramList[index]
                                  ? primaryTextColor
                                  : Colors.grey),
                        ),
                        child: Text("${controller.gramList[index]} gm",
                            style: TextStyle(
                              color: controller.selectedgram ==
                                      controller.gramList[index]
                                  ? primaryTextColor
                                  : Colors.grey,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ))),
                  );
                })),
        SizedBox(
          height: 25,
        ),
        subtitle1(Strings.writeMessage),
        Container(
          margin: EdgeInsets.only(top: 7),
          color: kycProductBackgroundColor,
          height: 100,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.start,
            maxLength: 200,
            maxLines: null,
            controller: controller.messageTextController,
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
              hintText: Strings.writeMessage,
            ),
            style: TextStyle(
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: primaryTextColor,
            ),
          ),
        )
      ],
    );
  }
}
