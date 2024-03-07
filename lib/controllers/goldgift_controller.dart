import 'package:augmont_v2/Screens/GoldGift/contact_screen.dart';
import 'package:augmont_v2/bindings/gifting_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/SignIn/Components/SignInComponents.dart';
import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';

class GoldGiftController extends GetxController with StateMixin<dynamic>{
  List<String> gramList = ['1', '2', '5', '10'];

  List<String> giftList = ['Augmont Gift Card', 'Happy New Year', 'Marry Christmas', 'Happy Engaggment'];
  late TextEditingController quantityTextController = TextEditingController();
  late TextEditingController mobileTextController = TextEditingController();

  late TextEditingController messageTextController = TextEditingController();
  var selectedgram= '';
  var selectedGift=0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> accessContactAlert(BuildContext context) async {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          maxheight: MediaQuery.of(context).size.height * 0.25,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                maintitle(Strings.accessContact),
                const SizedBox(
                  height: 10,
                ),
                mainDescp(Strings.accessContactDescp),
                const SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                            Get.to(()=>GiftContactScreen(),binding: GiftingBinding());
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 40.0),
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 2.0,
                              color: primaryTextColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              // <-- Radius
                            ),
                          ),
                          child: Text(Strings.enterManually,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 40.0),
                            backgroundColor: primaryTextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          child: Text(Strings.allow,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ))),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }



}