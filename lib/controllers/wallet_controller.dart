import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';

class WalletController extends GetxController with StateMixin<dynamic> {
  var isWalletAmout = false.obs;
  var isPersonalDetailsExpanded = true.obs;
  var selectedamount = '';
  List<String> amountList = ['500', '1000', '20000', '5000', '6000'];
  late TextEditingController priceTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void onBack() {
    Get.back();
  }

  void updateWallet() {
    isWalletAmout(true);
    update();
  }

  void onPersonalExpand() {
    if (isPersonalDetailsExpanded.value) {
      isPersonalDetailsExpanded(false);
    } else {
      isPersonalDetailsExpanded(true);
    }
    update();
  }

  void addamoutDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height * 0.50,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/add_wallet.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text("Top-Up your Augmont Wallet by",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 35,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: amountList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedamount = amountList[index];
                                  priceTextController.text = selectedamount;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color:
                                            selectedamount == amountList[index]
                                                ? primaryTextColor
                                                : Colors.grey),
                                  ),
                                  child: Text("₹ ${amountList[index]}",
                                      style: TextStyle(
                                        color:
                                            selectedamount == amountList[index]
                                                ? primaryTextColor
                                                : Colors.grey,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ))),
                            );
                          })),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 100,color: Colors.grey,height: 1,),
                      Text("  OR  ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ) ),
                      Container(width: 100,color: Colors.grey,height: 1,),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.start,
                    maxLength: 10,
                    maxLines: 1,
                    controller: priceTextController,
                    onChanged: (value) {},
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: kycProductBackgroundColor,
                      filled: true,
                      counterText: "",
                      hintText: Strings.enterCustomPrice,
                    ),
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.topup,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
