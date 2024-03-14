import 'dart:convert';

import 'package:augmont_v2/Bindings/main_screen_binding.dart';
import 'package:augmont_v2/Models/ScreenDataModel.dart';
import 'package:augmont_v2/Screens/Main/main_screen.dart';
import 'package:augmont_v2/Utils/session_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Bindings/signin_binding.dart';
import '../Models/allinboard_screen.dart';
import '../Network/ErrorHandling.dart';
import '../Network/Providers/IntroProvider.dart';
import '../Screens/SignIn/signin_page1.dart';
import '../Utils/colors.dart';
import '../Utils/dialog_helper.dart';
import '../utils/print_logs.dart';

class IntroController extends GetxController {
  int currentIndex = 0;
  var allinonboardlist = <ScreenData>[].obs;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void onInit() {
    super.onInit();
    getIntroScreenList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getIntroScreenList() async {
    allinonboardlist.add(ScreenData(
        id: 1,
        title: "Buy \nPhysical Gold \nOnline",
        description: "Grow your wealth, one Gram at a time with Gold SIP.",
        image: "assets/images/dash_img1.png"));

    allinonboardlist.add(ScreenData(
        id: 2,
        title: "Invest In \nThe Digital \nGold",
        description:
            "Augmont  offers turning your digital transactions into tangible investments.",
        image: "assets/images/dash_img2.png"));

    allinonboardlist.add(ScreenData(
        id: 3,
        title: "Loan \nAgainst \nGold",
        description:
            "Monetize your gold assets with a loan against gold, providing a flexible and immediate financial solution.",
        image: "assets/images/dash_img3.png"));

    // DialogHelper.showLoading();
    // IntroProvider().getLoanList("introduction").then((value) {
    //   DialogHelper.dismissLoader();
    //   try {
    //     var jsonMap = jsonDecode(value);
    //     var details = ScreenDataModel.fromJson(jsonMap);
    //     var data = details.data;
    //     if (data != null) {
    //       allinonboardlist.addAll(data);
    //     }
    //     update();
    //   } catch (e) {
    //     PrintLogs.printException(e);
    //   }
    // }, onError: (error) {
    //   DialogHelper.dismissLoader();
    //   ErrorHandling.handleErrors(error);
    // });
  }

  void pageChanged(int index) {
    currentIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    update();
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      // height: 6,
      // width: currentIndex == index ? 20 : 6,
      // decoration: BoxDecoration(
      //   color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
      //   borderRadius: BorderRadius.circular(3),
      // ),

      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:currentIndex == index ?bottomNavigationColor:Colors.transparent,
        ),
        child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentIndex == index ?Colors.white:Colors.transparent,
            ),

            child: CircleAvatar(
              radius: 4,
              backgroundColor: currentIndex == index ?bottomNavigationColor:Colors.grey,
            )),
      ),
    );
  }

  void goToNavigation() {
    SessionManager.setIsDashSelected(true);
    Get.off(() => MainScreen(), binding: MainScreenBinding());
  }
}
