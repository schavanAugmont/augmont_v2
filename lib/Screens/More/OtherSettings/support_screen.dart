import 'package:augmont_v2/controllers/support_controller.dart';
import 'package:augmont_v2/controllers/wallets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../widgets/text_component.dart';
import '../../SignIn/Components/TextFieldContainer.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SupportState();
  }
}

class _SupportState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(builder: (controller) {
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
                  child: Text(Strings.getIntouch,
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
                    supportHeader(context, controller),
                    supportFooter(context, controller)
                  ],
                ),
              ),
            ),
          )));
    });
  }

  Widget supportHeader(BuildContext context, SupportController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          textComponent("GET IN TOUCH", 14, FontWeight.normal),
          SizedBox(
            height: 5,
          ),
          textComponent("Get A CallBack?", 18, FontWeight.w600),
          SizedBox(
            height: 5,
          ),
          textComponent("Write to us and we will get back to within 24 hours",
              12, FontWeight.normal),
          SizedBox(
            height: 15,
          ),
          Image.asset("assets/images/support_img.png"),
          SizedBox(
            height: 15,
          ),
          TextFieldContainer(
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
            isExpanded: true,
            value: controller.suppoprtvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: controller.supportList.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: primaryTextColor,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                controller.suppoprtvalue = newValue!;
              });
            },
          ))),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                color: Colors.grey,
                height: 1,
              ),
              Text("  OR  ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  )),
              Container(
                width: 100,
                color: Colors.grey,
                height: 1,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
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
                setState(() {});
              },
              validator: (value) {
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: kycProductBackgroundColor,
                filled: true,
                counterText: "",
                hintText: 'Mention your reason for getting in touch...',
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
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text("Raise a Request",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )))
        ],
      ),
    );
  }

  Widget supportFooter(BuildContext context, SupportController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        textComponent("Quarries", 14, FontWeight.w600),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: kycProductBackgroundColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child:  Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      textComponent("Placed on: 12/03/24", 13,
                          FontWeight.normal),
                      Spacer(),
                      Text(
                        "Status:",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily:
                          Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ), Text(
                        "Active",
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily:
                          Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  textComponent("Quarry Reason:Statment...", 13,
                      FontWeight.w600),


                ],
              ),
            );
          },
        )
      ],
    );
  }
}
