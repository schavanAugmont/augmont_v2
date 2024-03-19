import 'package:augmont_v2/Controllers/intro_controller.dart';
import 'package:augmont_v2/Screens/SignIn/signin_page1.dart';
import 'package:augmont_v2/Utils/scaffold_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Bindings/signin_binding.dart';
import '../../Models/ScreenDataModel.dart';
import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(builder: (controller) {
      return ScaffoldView(
          child: controller.allinonboardlist.isEmpty
              ? Container()
              : Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60, right: 10, bottom: 20),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(
                              controller.allinonboardlist.length,
                              (index) => controller.buildDot(index: index),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            child: Text("Skip",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                            onTap: () {
                              controller.goToNavigation();
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: PageView.builder(
                          controller: controller.pageController,
                          onPageChanged: (value) {
                            setState(() {
                              controller.currentIndex = value;
                            });
                          },
                          itemCount: controller.allinonboardlist.length,
                          itemBuilder: (context, index) {
                            return PageBuilderWidget(
                              screenDataModel:
                                  controller.allinonboardlist[index],
                            );
                          }),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 40,
                              width: double.maxFinite, // set width to maxFinite
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (controller.currentIndex !=
                                        controller.allinonboardlist.length -
                                            1) {
                                      controller.pageChanged(
                                          controller.currentIndex + 1);
                                    } else {
                                      controller.goToNavigation();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                      ),
                                      primary: lightgreenshede1,
                                      backgroundColor: deliveryDescTextColor),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          controller.currentIndex !=
                                                  controller.allinonboardlist
                                                          .length -
                                                      1
                                              ? Strings.next
                                              : Strings.getStarted,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: Strings.fontFamilyName,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          )),
                                      Image.asset(
                                        "assets/images/arrow_right.png",
                                        height: 20,
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    )
                  ],
                ));
    });
  }
}

class PageBuilderWidget extends StatelessWidget {
  ScreenData screenDataModel;

  PageBuilderWidget({Key? key, required this.screenDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
              child: Container(
            height: 250,
            margin: const EdgeInsets.only(top: 20),
            child: screenDataModel.url!.isEmpty
                ? Image.asset(screenDataModel!.image!)
                : Image.network( screenDataModel!.url!),
          )),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          // Text(title,
          //     style: TextStyle(
          //       color: primaryTextColor,
          //       fontFamily: Strings.fontfamilyCabinetGrotesk,
          //       fontWeight: FontWeight.w700,
          //       fontSize: 30,
          //     )),
          RichText(
              text: TextSpan(
            children: getStyledTextSpan(screenDataModel!.title!, "Gold"),
          )),
          const SizedBox(
            height: 10,
          ),
          //discription
          Text(screenDataModel!.description!,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ))
        ],
      ),
    );
  }

  List<InlineSpan> getStyledTextSpan(String sentence, String dynamicWord) {
    List<InlineSpan> spans = [];
    List<String> words = sentence.split(" ");

    for (String word in words) {
      if (word == dynamicWord || word == "\n$dynamicWord") {
        // Change the style for the dynamic word
        spans.add(
          TextSpan(
            text: word + " ",
            style: TextStyle(
              color: primaryColor,
              fontFamily: Strings.fontfamilyCabinetGrotesk,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: word + " ",
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontfamilyCabinetGrotesk,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
        );
      }
    }

    return spans;
  }
}
