import 'package:augmont_v2/Screens/SignIn/signin_page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/allinboard_screen.dart';
import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "assets/images/designf.jpg",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
        "Invest in Digital Gold"),
    AllinOnboardModel(
        "assets/images/designs.jpg",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
        "Buy Physical Online"),
    AllinOnboardModel(
        "assets/images/designt.jpg",
        "TLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
        "Loan Against Gold"),
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: allinonboardlist.length,
                itemBuilder: (context, index) {
                  return PageBuilderWidget(
                      title: allinonboardlist[index].titlestr,
                      description: allinonboardlist[index].description,
                      imgurl: allinonboardlist[index].imgStr);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              allinonboardlist.length,
              (index) => buildDot(index: index),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                if (currentIndex == 0)
                  SizedBox(
                      height: 40,
                      width: double.maxFinite, // set width to maxFinite
                      child: ElevatedButton(
                          onPressed: () {
                            pageChanged(currentIndex + 1);
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
                if (currentIndex != 0)
                  Row(
                    children: [
                      Expanded(
                          flex: 1, // set width to maxFinite
                          child: SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    pageChanged(currentIndex - 1);
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
                                        fontFamily: Strings.fontFamilyName,
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
                                    if (currentIndex !=
                                        allinonboardlist.length - 1) {
                                      pageChanged(currentIndex + 1);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor),
                                  child: Text(
                                      currentIndex !=
                                              allinonboardlist.length - 1
                                          ? Strings.next
                                          : Strings.getStarted,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ))))),
                    ],
                  ),
                SizedBox(
                  height: 15,
                ),
              GestureDetector(child:   Text("Skip to Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )),
              onTap: (){
                Get.off(() =>  SignInPage1());
              },)
              ],
            ),
          )
        ],
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
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
            child: Image.asset(imgurl),
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
