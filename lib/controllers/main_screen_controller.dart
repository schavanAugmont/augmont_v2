import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Bindings/signin_binding.dart';
import '../Screens/SignIn/Components/SignInComponents.dart';
import '../Screens/SignIn/signin_page1.dart';
import '../Utils/colors.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';

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

  void showSignupPopup(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        //3
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.30,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: DraggableScrollableSheet(
              expand: true,
              initialChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Stack(
                      children: [
                        Positioned(
                          top: -24,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: context.width,
                            height: context.height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                colors: [
                                  Colors.amber.withOpacity(0.2),
                                  Colors.amber.withOpacity(0.1),
                                  Colors.amber.withOpacity(0.05),
                                  Colors.amber.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(
                                height: 10,
                              ),
                              // maintitle(Strings.keepurAssets),
                              Text("Onboard to Augmont!",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily:
                                    Strings.fontfamilyCabinetGrotesk,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  )),

                              Center(
                                child: mainDescp("Register yourself quickly to avail the world class services awaiting you on other side."),
                              ),

                              SizedBox(
                                height:40,
                              ),
                              Container(
                                  height: 40,

                                  // Adjust padding as needed
                                  child:
                                  // controller.enableMobileView.value ?
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        deliveryDescTextColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                        Get.offAll(
                                              () => const SignInPage1(),
                                          binding: SignInBiding(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Register/Sign-In Now",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                Strings.fontFamilyName,
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
                    );
                  },
                );
              },
            ),
          ),
        );


        //   Container(
        //   height: MediaQuery.sizeOf(context).height*0.35,
        //   margin: const EdgeInsets.only(top: 55),
        //   color: Colors.transparent,
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(10.0),
        //         topRight: Radius.circular(10.0),
        //       ),
        //     ),
        //     child: DraggableScrollableSheet(
        //       expand: true,
        //       initialChildSize: 1.0,
        //       builder:
        //           (BuildContext context, ScrollController scrollController) {
        //         return StatefulBuilder(
        //           builder: (BuildContext context, StateSetter setState) {
        //             return Padding(
        //               padding: EdgeInsets.all(20),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: <Widget>[
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Container(
        //                       decoration: new BoxDecoration(
        //                         color: Colors.white,
        //                         shape: BoxShape.circle,
        //                         border: Border.all(
        //                           width: 2,
        //                           color: Colors.black,
        //                           style: BorderStyle.solid,
        //                         ),
        //                       ),
        //                       margin: EdgeInsets.only(right: 10),
        //                       padding: EdgeInsets.all(15),
        //                       child: ImageIcon(
        //                         AssetImage('assets/images/ic_add_user.png'),
        //                         size: 30,
        //                         color: Colors.black,
        //                       )),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Text("Onboard to Augmont!",
        //                       style: TextStyle(
        //                         color: primaryTextColor,
        //                         fontFamily: Strings.fontFamilyName,
        //                         fontWeight: FontWeight.w600,
        //                         fontSize: 14,
        //                       )),
        //                   SizedBox(
        //                     height: 8,
        //                   ),
        //                   Text(
        //                       "Register yourself quickly to avail the world class services awaiting you on other side.",
        //                       maxLines: 5,
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(
        //                         color: primaryTextColor,
        //                         fontFamily: Strings.fontFamilyName,
        //                         fontWeight: FontWeight.normal,
        //                         fontSize: 13,
        //                       )),
        //
        //                   Container(
        //                       width: MediaQuery.of(context).size.width,
        //                       decoration: BoxDecoration(
        //                         color: Colors.black,
        //                         border: Border.all(color: Colors.black),
        //                         borderRadius:
        //                         BorderRadius.circular(5.0),
        //                       ),
        //                       margin:
        //                       EdgeInsets.only(bottom: 10, top: 15),
        //                       height: 40,
        //                       child: Center(
        //                           child: Text('Register/Sign-In Now',
        //                               style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontFamily:
        //                                 Strings.fontFamilyName,
        //                                 fontWeight: FontWeight.w600,
        //                                 fontSize: 14,
        //                               ))))
        //                 ],
        //               ),
        //             );
        //           },
        //         );
        //       },
        //     ),
        //   ),
        // );
      },
    );
  }
}
