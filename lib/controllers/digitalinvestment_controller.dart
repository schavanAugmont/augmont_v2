import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Screens/SignIn/Components/SignInComponents.dart';
import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/strings.dart';

class DigitalInvestmentController extends GetxController {
  bool isGoldSelected = true;
  bool isSwitched = false;
  bool enableEditButton = false;
  late TextEditingController priceTextController = TextEditingController();
  int amount = 1;
  int radioId = 1;
  int year = 1;
  var selectedTime = '';
  var selectedamount='';
  List<String> listTime = ['1D', '1W', '1M', '3M', '6M', '1Y', '5Y', '10Y'];
  List<String> timelineList = ['One Time', 'Daily', 'Weekly', 'Monthly'];
  List<String> amountList=['500','1000','20000','5000','6000'];
  var timeline = 'One Time';

  void onViewTap(bool bool) {
    isGoldSelected = bool;
    update();
  }

  void priceAlertsDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          maxheight: MediaQuery.sizeOf(context).height / 2.2,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            height: MediaQuery.sizeOf(context).height / 2.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                maintitle(Strings.setPriceAlert),
                const SizedBox(
                  height: 10,
                ),
                mainDescp(Strings.enterCustomPrice),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.start,
                    maxLength: 10,
                    maxLines: 1,
                    controller: priceTextController,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        enableEditButton = true;
                      } else {
                        enableEditButton = false;
                      }
                    },
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
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 40, top: 15),
                  color: kycProductBackgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Strings.goldPrice,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('₹ 6000/gm',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'assets/images/ic_increment.png',
                            width: 10,
                            color: Colors.green,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(Strings.youwillNotify,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ))),
                SizedBox(
                  height: 8,
                ),
                // ElevatedButton(
                //     onPressed: (){},
                //     style: ElevatedButton.styleFrom(
                //         minimumSize: Size(double.infinity, 40.0),
                //         backgroundColor: primaryTextColor,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10), // <-- Radius
                //       ),
                //     ),
                //     child: Text(Strings.setAlert,
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontFamily: Strings.fontFamilyName,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 14,
                //         ))),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
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
                          child: Text(Strings.disableAlert,
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 40.0),
                            backgroundColor: primaryTextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          child: Text(Strings.saveChange,
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

  void chooseInvestGrowthDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height / 1.2,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  maintitle(Strings.chooseyourInvestment),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    color: kycProductBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryTextColor),
                            ),
                            Spacer(),
                            Radio(
                              value: 1,
                              groupValue: radioId,
                              onChanged: (val) {
                                setState(() {
                                  radioId = 1;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("11%* returns on your investement",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            )),
                        Text(
                            "Invest in gold and avail returns with the best possibale deals in business",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    color: kycProductBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryTextColor),
                            ),
                            Spacer(),
                            Radio(
                              value: 2,
                              groupValue: radioId,
                              onChanged: (val) {
                                setState(() {
                                  radioId = 2;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("16%* returns on your investement",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            )),
                        Text(
                            "Earn an additional 5% interest annually with Gold+ lease your gold to repatued jewellers and opt out whenever you want extra",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            )),
                        Text("Learn More",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            )),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.proceed,
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
