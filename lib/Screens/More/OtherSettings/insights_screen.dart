import 'package:augmont_v2/controllers/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../Utils/themes.dart';
import '../../../controllers/editnominee_controller.dart';
import '../../../controllers/editprofile_controller.dart';
import '../../../widgets/text_component.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../../SignIn/Components/TextFieldContainer.dart';

class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InsightState();
  }
}

class _InsightState extends State<InsightScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FAQController>(builder: (controller) {
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
                  child: Text(Strings.insights,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            body: SingleChildScrollView(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(20),
                      height: 35,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.faqList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.selectedamount =
                                      controller.faqList[index];
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color: controller.selectedamount ==
                                                controller.faqList[index]
                                            ? primaryTextColor
                                            : Colors.grey),
                                  ),
                                  child: Text("${controller.faqList[index]}",
                                      style: TextStyle(
                                        color: controller.selectedamount ==
                                                controller.faqList[index]
                                            ? primaryTextColor
                                            : Colors.grey,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ))),
                            );
                          })),
                  newsWidget(),
                  articalWidget(),
                  videosWidget(),
                  Container(height: 40,color: Colors.white,),
                  videosWidget()
                ],
              ),
            )),
          )));
    });
  }

  Widget newsWidget() {
    return Container(
      color: kycProductBackgroundColor,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/ic_increment.png',
                width: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              textComponent("Trending News", 15, FontWeight.w600),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 160,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 180,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        height: 100,
                        decoration: BoxDecoration(
                          color: kycProductBackgroundColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Align(
                          child: Icon(Icons.play_circle_filled_rounded),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: textComponent("Reason for investing in Gold SIP",
                            12, FontWeight.w600),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget articalWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              textComponent("Artical", 15, FontWeight.w600),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(2),
                    height: 120,
                    width: MediaQuery.sizeOf(context).width,
                    color: kycProductBackgroundColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/ic_image.png',
                          width: 20,
                        ),
                        Spacer(),
                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child:
                                textComponent("Gold SIP", 12, FontWeight.w600)),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      textComponent("Reason for investing in Gold SIP", 13,
                          FontWeight.w600),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          textComponent(
                              "by Rachel 5 min read", 12, FontWeight.normal),
                          Spacer(),
                          textComponent("11/03/2024", 12, FontWeight.normal),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget videosWidget() {
    return Container(
      color: kycProductBackgroundColor,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.play_circle,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              textComponent("Video", 15, FontWeight.w600),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  color: shadowColor,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      textComponent("Reason for investing in Gold SIP", 13,
                          FontWeight.w600),
                      SizedBox(
                        height: 2,
                      ),
                      textComponent(
                          "Augmont Gold For All", 12, FontWeight.normal),
                      textComponent("10 min", 12, FontWeight.normal),
                    ],
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
