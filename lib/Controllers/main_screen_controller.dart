import 'dart:collection';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/session_manager.dart';

class MainScreenController extends GetxController with StateMixin<dynamic> {
  int selectedIndex = 0;

  final ListQueue<int> navigationQueue = ListQueue();

  late SessionManager sessionManager;

  static MainScreenController get to => Get.find();

  @override
  void onInit() {
    sessionManager = SessionManager();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onTap(int index) async {
    // if (index == 1) {
    //   var flag = await sessionManager.isLoggedIn();
    //   // if (!flag) {
    //   //   SessionManager().setSelectedProduct(Strings.moduleOther);
    //   //   Get.offAll(
    //   //         () => const SignInScreen(),
    //   //     binding: SignInBinding(),
    //   //     transition: Transition.rightToLeft,
    //   //   );
    //   //   return;
    //   // }
    //   // MyProfileController.to.checkLogin();
    //   // Future.delayed(const Duration(seconds: 1),(){
    //   //   UserinfoUpdateService.userInfo.checkUserForm('profile');
    //   // });
    // }
    if (index != selectedIndex) {
      navigationQueue.removeWhere((element) => element == index);
      navigationQueue.addLast(index);

      selectedIndex = index;
      update();
    } else {
      Get.until((route) => route.isFirst, id: selectedIndex);
    }
  }

  void updateIndex(int index) {
    if (index == 0) {
      navigationQueue.clear();
    } else {
      navigationQueue.removeWhere((element) => element == index);
    }

    selectedIndex = index;

    update();
  }
}
