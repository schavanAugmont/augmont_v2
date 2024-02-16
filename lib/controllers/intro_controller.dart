import 'dart:convert';

import 'package:augmont_v2/Models/ScreenDataModel.dart';
import 'package:augmont_v2/Utils/session_manager.dart';
import 'package:flutter/cupertino.dart';
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
    DialogHelper.showLoading();
    IntroProvider().getLoanList("introduction").then((value) {
      DialogHelper.dismissLoader();
      try {
        var jsonMap = jsonDecode(value);
        var details = ScreenDataModel.fromJson(jsonMap);
        var data = details.data;
        if(data !=null){
          allinonboardlist.addAll(data);
        }
        update();
      } catch (e) {
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
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
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  void goToNavigation(){
    SessionManager.setIsDashSelected(true);
    Get.off(() => SignInPage1(),binding: SignInBiding());
  }


}
