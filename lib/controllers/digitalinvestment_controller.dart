import 'dart:async';
import 'dart:convert';

import 'package:augmont_v2/Screens/DigitalInvestment/SIP/sip_details_screen.dart';
import 'package:augmont_v2/Screens/DigitalInvestment/dg_sip_screen.dart';
import 'package:augmont_v2/Utils/RateCalculator.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Network/ErrorHandling.dart';
import '../Screens/MetalPice/metal_price_screen.dart';
import '../Screens/SignIn/Components/SignInComponents.dart';
import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';
import '../bindings/digitalinvestment_binding.dart';
import '../models/GoldRateModel.dart';
import '../models/barchart_model.dart';
import '../network/Providers/HomeProvider.dart';

class DigitalInvestmentController extends GetxController {
  bool isGoldSelected = true;
  bool isSwitched = false;
  bool enableEditButton = false;
  late TextEditingController priceTextController = TextEditingController();
  int amount = 10;
  int radioId = 1;
  int year = 1;
  var selectedTime = '';
  var selectedamount = '';
  List<String> listTime = ['1D', '1W', '1M', '3M', '6M', '1Y', '5Y', '10Y'];
  List<String> timelineList = ['One Time', 'Daily', 'Weekly', 'Monthly'];
  List<String> amountList = ['500', '1000', '20000', '5000', '6000'];
  var timeline = 'One Time';

  var currentGoldBuyRate = "".obs;
  var currentSilverBuyRate = "".obs;
  var currentGoldSellRate = "".obs;
  var currentSilverSellRate = "".obs;
  Timer? timer;
  double goldBuyGstRate = 0.0;
  double silverBuyGstRate = 0.0;
  double goldBuyRate = 0.0;
  double silverBuyRate = 0.0;
  double goldSellRate = 0.0;
  double silverSellRate = 0.0;

  List<BarchartModel> barchartData = [];

  late SessionManager sessionManager;

  @override
  void onInit() {
    sessionManager = SessionManager();
    currentGoldBuyRate('₹ $goldBuyRate/gm');
    currentSilverBuyRate('₹ $silverBuyRate/gm');
    currentGoldSellRate('₹ $goldSellRate/gm');
    currentSilverSellRate('₹ $silverSellRate/gm');
    fetchGoldRate();
    setTimer();

    super.onInit();
  }

  @override
  void onReady() {
    // WalletController.to.fetchPassbookDetails();
    // WalletController.to.getFDDetails();

    // isLoggedIn();
    super.onReady();
  }

  @override
  void onClose() {
    cancelTimer();
    super.onClose();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  checkForNewRatePrice() {
    fetchGoldRate(isFromTimer: true);
  }

  void fetchGoldRate({var isFromTimer = false}) async {
    HomeProvider().getGoldRate().then((value) {
      try {
        var jsonMap = jsonDecode(value);

        var rates = GoldRateModel.fromJson(jsonMap);
        goldBuyRate = double.parse(rates.rate.rates.gBuy);
        silverBuyRate = double.parse(rates.rate.rates.sBuy);

        goldSellRate = double.parse(rates.rate.rates.gSell);
        silverSellRate = double.parse(rates.rate.rates.sSell);

        goldBuyGstRate = double.parse(rates.rate.rates.gBuyGst);
        silverBuyGstRate = double.parse(rates.rate.rates.sBuyGst);

        currentGoldBuyRate('₹ $goldBuyRate/gm');
        currentSilverBuyRate('₹ $silverBuyRate/gm');

        currentGoldSellRate('₹ $goldSellRate/gm');
        currentSilverSellRate('₹ $silverSellRate/gm');

        update();
      } catch (e) {
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      if (!isFromTimer) {
        ErrorHandling.handleErrors(error);
      }
    });
  }

  void onViewTap(bool bool) {
    isGoldSelected = bool;
    update();
  }

  void setTimer() async {
    cancelTimer();

    timer = Timer.periodic(
        const Duration(seconds: 30), (Timer t) => checkForNewRatePrice());
  }

  void cancelTimer() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  Future<void> priceAlertsDailog(BuildContext context) async {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          maxheight: MediaQuery.of(context).size.height * 0.65,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
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

                MetalPriceScreen(
                  metalPrice: "₹ 0,00/gm",
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
                          onPressed: () {
                            Get.back();
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
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.70,
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
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Strings.chooseyourInvestment,
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily:
                                        Strings.fontfamilyCabinetGrotesk,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10, top: 10),
                                decoration: BoxDecoration(
                                  color: radioId==1?borderColor1:Colors.transparent,
                                  border: Border.all(color: radioId==1?primaryColor:borderColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                "11%* returns on your investement",
                                                style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontFamily: Strings
                                                      .fontfamilyCabinetGrotesk,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                )),
                                            Text(
                                                "Invest in gold and avail returns with the best possibale deals in business",
                                                style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontFamily:
                                                      Strings.fontFamilyName,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                )),
                                          ],
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Radio(
                                              value: 1,
                                              groupValue: radioId,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioId = 1;
                                                });
                                              },
                                            ),
                                            10.h,
                                            
                                            Image.asset("assets/images/grow_icon.png")
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10, top: 10),
                                decoration: BoxDecoration(
                                  color: radioId==2?borderColor1:Colors.transparent,
                                  border: Border.all(color: radioId==2?primaryColor:borderColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text("16%* returns on your investement",
                                                style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontFamily: Strings
                                                      .fontfamilyCabinetGrotesk,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                )),
                                            Text(
                                                "Earn an additional 5% interest annually with Gold+ lease your gold to repatued jewellers and opt out whenever you want extra",
                                                style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontFamily: Strings.fontFamilyName,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 11,
                                                )),
                                            // Text("Learn More",
                                            //     style: TextStyle(
                                            //       color: primaryTextColor,
                                            //       fontFamily: Strings.fontFamilyName,
                                            //       fontWeight: FontWeight.w500,
                                            //       fontSize: 10,
                                            //     )),
                                          ],
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                        Radio(
                                          value: 2,
                                          groupValue: radioId,
                                          onChanged: (val) {
                                            setState(() {
                                              radioId = 2;
                                            });
                                          },
                                        ),
                                        10.h,

                                        Image.asset("assets/images/plus_icon.png")
                                      ],
                                    )),
                                    SizedBox(
                                      height: 10,
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.to(() => DgSIPScreen(),
                                        binding: DigitalInvestmentBiding());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 40.0),
                                    backgroundColor: bottomNavigationColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5), // <-- Radius
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(Strings.proceed.toTitleCase(),
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
                                  )),
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
        // return StatefulBuilder(builder: (context, StateSetter setState) {
        //   return Popover(
        //     maxheight: MediaQuery.of(context).size.height * 0.65,
        //     child: Container(
        //       padding: EdgeInsets.all(20),
        //       color: Colors.white,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(Strings.chooseyourInvestment, style: TextStyle(
        //             color: primaryTextColor,
        //             fontFamily: Strings.fontfamilyCabinetGrotesk,
        //             fontWeight: FontWeight.w700,
        //             fontSize: 20,
        //           )),
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(bottom: 10, top: 10),
        //             color: kycProductBackgroundColor,
        //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                       width: 40,
        //                       height: 40,
        //                       decoration: const BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           color: primaryTextColor),
        //                     ),
        //                     Spacer(),
        //                     Radio(
        //                       value: 1,
        //                       groupValue: radioId,
        //                       onChanged: (val) {
        //                         setState(() {
        //                           radioId = 1;
        //                         });
        //                       },
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text("11%* returns on your investement",
        //                     style: TextStyle(
        //                       color: primaryTextColor,
        //                       fontFamily: Strings.fontFamilyName,
        //                       fontWeight: FontWeight.w600,
        //                       fontSize: 13,
        //                     )),
        //                 Text(
        //                     "Invest in gold and avail returns with the best possibale deals in business",
        //                     style: TextStyle(
        //                       color: primaryTextColor,
        //                       fontFamily: Strings.fontFamilyName,
        //                       fontWeight: FontWeight.normal,
        //                       fontSize: 11,
        //                     )),
        //               ],
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(bottom: 10, top: 10),
        //             color: kycProductBackgroundColor,
        //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                       width: 40,
        //                       height: 40,
        //                       decoration: const BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           color: primaryTextColor),
        //                     ),
        //                     Spacer(),
        //                     Radio(
        //                       value: 2,
        //                       groupValue: radioId,
        //                       onChanged: (val) {
        //                         setState(() {
        //                           radioId = 2;
        //                         });
        //                       },
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text("16%* returns on your investement",
        //                     style: TextStyle(
        //                       color: primaryTextColor,
        //                       fontFamily: Strings.fontFamilyName,
        //                       fontWeight: FontWeight.w600,
        //                       fontSize: 13,
        //                     )),
        //                 Text(
        //                     "Earn an additional 5% interest annually with Gold+ lease your gold to repatued jewellers and opt out whenever you want extra",
        //                     style: TextStyle(
        //                       color: primaryTextColor,
        //                       fontFamily: Strings.fontFamilyName,
        //                       fontWeight: FontWeight.normal,
        //                       fontSize: 11,
        //                     )),
        //                 Text("Learn More",
        //                     style: TextStyle(
        //                       color: primaryTextColor,
        //                       fontFamily: Strings.fontFamilyName,
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 10,
        //                     )),
        //               ],
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           ElevatedButton(
        //               onPressed: () {
        //                 Get.back();
        //                 Get.to(() => DgSIPScreen(),
        //                     binding: DigitalInvestmentBiding());
        //               },
        //               style: ElevatedButton.styleFrom(
        //                 minimumSize: Size(double.infinity, 40.0),
        //                 backgroundColor: primaryTextColor,
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(10), // <-- Radius
        //                 ),
        //               ),
        //               child: Text(Strings.proceed,
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontFamily: Strings.fontFamilyName,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 14,
        //                   ))),
        //         ],
        //       ),
        //     ),
        //   );
        // });
      },
    );
  }

  void onBack() {
    Get.back();
  }

  void goToSIpDetails() {
    Get.to(() => SIPDetailsScreen(), binding: DigitalInvestmentBiding());
  }

  Future<void> growthCalculator() async {
    var grams = await RateCalculator.getGramFromCalculation(
        amount.toString(), goldBuyRate, goldBuyGstRate.toString());
    var currentValue = grams * goldBuyRate;
  }
}
