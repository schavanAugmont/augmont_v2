import 'package:augmont_v2/Controllers/intro_controller.dart';
import 'package:augmont_v2/Screens/SignIn/signin_page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Bindings/signin_binding.dart';
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
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: controller.allinonboardlist.isEmpty
            ? Container()
            : Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.4,
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
                              title: controller.allinonboardlist[index].title
                                  .toString(),
                              description: controller
                                  .allinonboardlist[index].description
                                  .toString(),
                              imgurl: controller.allinonboardlist[index].url
                                  .toString());
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.allinonboardlist.length,
                      (index) => controller.buildDot(index: index),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        if (controller.currentIndex == 0)
                          SizedBox(
                              height: 40,
                              width: double.maxFinite, // set width to maxFinite
                              child: ElevatedButton(
                                  onPressed: () {
                                    controller.pageChanged(
                                        controller.currentIndex + 1);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: lightgreenshede1,
                                      backgroundColor: primaryColor),
                                  child: Text(Strings.next,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      )))),
                        if (controller.currentIndex != 0)
                          Row(
                            children: [
                              Expanded(
                                  flex: 1, // set width to maxFinite
                                  child: SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            controller.pageChanged(
                                                controller.currentIndex - 1);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              side: const BorderSide(
                                                  width: 2, // the thickness
                                                  color:
                                                      primaryColor // the color of the border
                                                  )),
                                          child: Text(Strings.previous,
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontFamily:
                                                    Strings.fontFamilyName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ))))),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 1, // set width to maxFinite
                                  child: SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (controller.currentIndex !=
                                                controller.allinonboardlist
                                                        .length -
                                                    1) {
                                              controller.pageChanged(
                                                  controller.currentIndex + 1);
                                            }else{
                                              controller.goToNavigation();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor),
                                          child: Text(
                                              controller.currentIndex !=
                                                      controller
                                                              .allinonboardlist
                                                              .length -
                                                          1
                                                  ? Strings.next
                                                  : Strings.getStarted,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    Strings.fontFamilyName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ))))),
                            ],
                          ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          child: Text("Skip to Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              )),
                          onTap: () {
                            controller.goToNavigation();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
      );
    });
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;

  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
             child: Image.asset("assets/images/designf.jpg"),
            // child: FadeInImage.assetNetwork(
            //     placeholder: 'assets/images/designf.jpg', image: imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              )),
          const SizedBox(
            height: 10,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
