import 'package:augmont_v2/Controllers/main_screen_controller.dart';
import 'package:augmont_v2/Screens/Home/Components/home_components.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controllers/home_controller.dart';
import '../../Utils/session_manager.dart';
import '../../Utils/strings.dart';
import '../../Utils/themes.dart';
import '../../dialog/emi_due_dialog.dart';
import '../MetalPice/metal_price_screen.dart';
import 'Components/HeaderWalletView.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGoldSelected = true;

  bool isAmountEdited = false;

  bool isGramEdited = false;

  String value = "";

  late SessionManager sessionManager;

  @override
  void initState() {
    sessionManager = SessionManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = const MediaQueryData().size;
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Scaffold(
              body: GestureDetector(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderWalletView(
                        walletAmount: '',
                        onPressed: () {},
                        isLoggedIn: false,
                      ),
                      MetalPriceScreen(),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: kycProductBackgroundColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  color: shadowColor,
                                  shape: BoxShape.circle,
                                ),
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.all(15),
                                child: ImageIcon(
                                  AssetImage('assets/images/ic_user.png'),
                                  size: 20,
                                  color: Colors.black,
                                )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Strings.createProfile,
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(Strings.createProfileDec,
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    )),
                              ],
                            )),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  MainScreenController()
                                      .showSignupPopup(context);
                                },
                                child: Text(Strings.signUp,
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ))),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          border: Border.all(color: kycProductBackgroundColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 30,
                                  color: kycProductBackgroundColor,
                                ),
                                Center(
                                    child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(color: shadowColor),
                                    color: white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: shadowColor,
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 0.5,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 4.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: isGoldSelected
                                                ? primaryTextColor
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: GestureDetector(
                                              onTap: () {
                                                _onViewTap(true);
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Gold',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Strings.fontFamilyName,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                    color: isGoldSelected
                                                        ? Colors.white
                                                        : Colors.grey,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: isGoldSelected
                                                ? Colors.white
                                                : primaryTextColor,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              _onViewTap(false);
                                            },
                                            child: Center(
                                                child: Text(
                                              'Sliver',
                                              style: TextStyle(
                                                fontFamily:
                                                    Strings.fontFamilyName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: isGoldSelected
                                                    ? Colors.grey
                                                    : Colors.white,
                                              ),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Price',
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11,
                                      )),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(controller.currentGoldBuyRate.value,
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Greate time to buy! lowest price of the week',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("More Details",
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: primaryTextColor,
                                            fontFamily: Strings.fontFamilyName,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11,
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 11,
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.goToInvestmentDashbord();
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        margin: EdgeInsets.only(
                                            bottom: 10, top: 30),
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                                'Invest to earn 16% p.a',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      Strings.fontFamilyName,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                )))),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: lightColor, width: 1.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: lightColor,
                                  borderRadius: BorderRadius.circular(6.0)),
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/coin.png",
                                  width: 40),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Augmont Gold Coin",
                                    style: CustomTheme.style(
                                        size: 15, weight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Order ID : 3456",
                                    style: CustomTheme.style(
                                        size: 13, weight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Status : ",
                                        style: CustomTheme.style(
                                            size: 13, weight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Booked",
                                        style: CustomTheme.style(
                                            size: 13,
                                            weight: FontWeight.w600,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: lightColor,
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Upcoming EMI Date : 08/03/2024",
                                            style: CustomTheme.style(
                                                size: 10,
                                                weight: FontWeight.w500),
                                            maxLines: 3,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.dialog(const EmiDueDialog());
                                          },
                                          child: Text(
                                            "Pay Now",
                                            style: CustomTheme.style(
                                                size: 12,
                                                weight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      setfdView(context),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: nudgetWid(
                                    "Get gold loan at 6% p.a.*",
                                    "Get Started",
                                    "assets/images/ic_loan.png",
                                    false,
                                    controller,
                                    context)),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: nudgetWid(
                                    "Looking to Sell your gold?",
                                    "Get Started",
                                    "assets/images/ic_money.png",
                                    false,
                                    controller,
                                    context))
                          ],
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Shop at Augmont",
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  Spacer(),
                                  Text("View More",
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  height: 150.0,
                                  child: ListView.builder(
                                      //here your code
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return shopListItem();
                                      }))
                            ],
                          )),
                      setWalletView(context),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: nudgetWid(
                                    "Gift Gold to your loved once",
                                    "Gift Now",
                                    "assets/images/ic_giftbox.png",
                                    true,
                                    controller,
                                    context)),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: nudgetWid(
                                    "Refer and earn gold up to 10,000",
                                    "Get Started",
                                    "assets/images/ic_speaker.png",
                                    true,
                                    controller,
                                    context))
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kycProductBackgroundColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Invest in Silver",
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    )),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(controller.currentSilverBuyRate.value,
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Grow your wealth by 9% p.a*",
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11,
                                    )),
                              ],
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Start Investing",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget nudgetWid(String title, String actn, String logo, bool bool,
      HomeController controller, BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bool ? kycProductBackgroundColor : Colors.white,
          border: Border.all(color: kycProductBackgroundColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 170,
        child: GestureDetector(
          onTap: () {
            if (actn == "Gift Now") {
              controller.sendGiftDailog(context);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,
                  maxLines: 2,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: 40,
                child: FittedBox(
                  child: ImageIcon(
                    AssetImage(logo),
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(actn,
                      maxLines: 2,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 11,
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget shopListItem() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: kycProductBackgroundColor,
        border: Border.all(color: kycProductBackgroundColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 150,
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage("assets/images/ic_image.png"),
                size: 12,
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward,
                size: 12,
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text("Gold Coins",
              maxLines: 2,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              )),
          Text("Starting From \n\u{20B9} 10000",
              maxLines: 2,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              )),
        ],
      ),
    );
  }

  void _onViewTap(bool bool) {
    setState(() {
      isGoldSelected = bool;
    });
  }
}
