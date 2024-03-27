import 'dart:ffi';

import 'package:augmont_v2/Screens/Home/Components/home_components.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/models/HomeProductModel.dart';
import 'package:augmont_v2/models/stepupsipList_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../Controllers/home_controller.dart';
import '../../Utils/session_manager.dart';
import '../../Utils/strings.dart';
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
    return GetBuilder<HomeController>(initState: (state) {
      HomeController.to.isLoggedIn();
    },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: Column(
              children: [
                HeaderWalletView(
                  walletAmount: '',
                  onPressed: () {},
                  isLoggedIn: false,
                ),
                MetalPriceScreen(
                  metalPrice: controller.currentGoldBuyRate.value,
                )
              ],
            ),
            centerTitle: true,
            flexibleSpace: new Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [
                    Colors.amber.withOpacity(0.2),
                    Colors.amber.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          body: GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  if (!controller.isUserLoggedIn.value) ...[
                    createProfile(context),
                    goldSelection(context, controller),
                  ],

                  // Padding(
                  //   padding: const EdgeInsets.all(32.0),
                  //   child: Stack(
                  //     children: <Widget>[
                  //       Container(
                  //         margin: EdgeInsets.only(bottom: 20.0),
                  //         child: ClipPath(
                  //           clipper: ArcClipper(),
                  //           child: Container(
                  //               width: 200.0,
                  //               height: 25.0,
                  //               padding: EdgeInsets.all(8.0),
                  //               color: Colors.lightBlue,
                  //               child: Center(
                  //                   child: Text(
                  //                     'PROMO',
                  //                     style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 20.0),
                  //                   ))),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         bottom: 0.0,
                  //         child: ClipPath(
                  //           clipper: TriangleClipper(),
                  //           child: Container(
                  //             width: 20.0,
                  //             height: 20.0,
                  //             color: Colors.blue[700],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  if (controller.isUserLoggedIn.value) ...[
                    portfolioContainer(context, controller),
                    // priceNugets(context),
                    earningNugetsContainer(context, controller),
                    if (controller.stepupListData.isNotEmpty)
                      sipContainer(context, controller.stepupListData[0]),
                    // rewardNugetsContainer(context),
                    // loanContainer(context),
                  ],
                  setfdView(context),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: moduleWidget(
                                "Get gold loan at 6% p.a.*",
                                "Get Started",
                                "assets/images/gold_bricks.png",
                                false,
                                controller,
                                context)),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: moduleWidget(
                                "Looking to Sell your gold?",
                                "Get Started",
                                "assets/images/gold_bag.png",
                                false,
                                controller,
                                context))
                      ],
                    ),
                  ),
                  if(controller.productListData.isNotEmpty)
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Shop at Augmont",
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily:
                                        Strings.fontfamilyCabinetGrotesk,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  )),
                              Spacer(),
                              Text("View More",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: primaryTextColor,
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
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
                                  itemCount: controller.productListData.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return shopListItem(controller.productListData[index]);
                                  }))
                        ],
                      )),
                  setWalletView(context),
                  // emiContainer(context),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: moduleWidget(
                                "Gift Gold \nto your \nLoved once",
                                "Gift Now",
                                "assets/images/gift_image.png",
                                true,
                                controller,
                                context)),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: moduleWidget(
                                "Refer and Earn Gold up to 10,000",
                                "Get Started",
                                "assets/images/share_coin.png",
                                true,
                                controller,
                                context))
                      ],
                    ),
                  ),
                  silverCoin(context, controller),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget moduleWidget(String title, String actn, String logo, bool bool,
      HomeController controller, BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: bool ? 225 : 170,
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
                  maxLines: 3,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontfamilyCabinetGrotesk,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(actn,
                      maxLines: 2,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: bottomNavigationColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  // Icon(
                  //   Icons.arrow_forward_ios_sharp,
                  //   size: 11,
                  // )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 60,
              //   width: 40,
              //   child: FittedBox(
              //     child: ImageIcon(
              //       AssetImage(logo),
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  Container(),
                  Spacer(),
                  Image(image: AssetImage(logo))
                ],
              ),
            ],
          ),
        ));
  }

  Widget shopListItem(ProductData productListData) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 240,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     ImageIcon(
          //       AssetImage("assets/images/ic_image.png"),
          //       size: 12,
          //     ),
          //     Spacer(),
          //     Icon(
          //       Icons.arrow_forward,
          //       size: 12,
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 60,
          // ),

          Center(
              child: Image.network(
            productListData.subCategoryImg.toString(),
            height: 80,
          )),
          SizedBox(
            height: 10,
          ),
          Text(productListData.subCategoryName.toString(),
              maxLines: 1,
              style: TextStyle(
                color: bottomNavigationColor,
                fontFamily: Strings.fontfamilyCabinetGrotesk,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              )),
          Text("Starting From \u{20B9}${productListData.startingPrice.toString()}",
              maxLines: 2,
              style: TextStyle(
                color: bottomNavigationColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
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

  Widget goldSelection(BuildContext context, HomeController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('Current Price',
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                    )),
                SizedBox(
                  height: 2,
                ),
                Text(
                    isGoldSelected
                        ? controller.currentGoldBuyRate.value
                        : controller.currentSilverBuyRate.value,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text('Lowest price of the week',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("More Details",
                        maxLines: 2,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        )),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // Icon(
                    //   Icons.arrow_forward_ios_sharp,
                    //   size: 11,
                    // )
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.goToInvestmentDashbord();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: deliveryDescTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Invest to earn 16% p.a',
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
                    ))
                // GestureDetector(
                //   onTap: () {
                //     controller.goToInvestmentDashbord();
                //   },
                //   child: Container(
                //       width:
                //       MediaQuery.of(context).size.width,
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         border:
                //         Border.all(color: Colors.black),
                //         borderRadius:
                //         BorderRadius.circular(5.0),
                //       ),
                //       margin: EdgeInsets.only(
                //           bottom: 10, top: 30),
                //       height: 40,
                //       child: Center(
                //           child: Text(
                //               'Invest to earn 16% p.a',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontFamily:
                //                 Strings.fontFamilyName,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 14,
                //               )))),
                // )
              ],
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 180,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: borderColor),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                          color: isGoldSelected ? primaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              _onViewTap(true);
                            },
                            child: Center(
                              child: Text(
                                'Gold',
                                style: TextStyle(
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: isGoldSelected
                                      ? Colors.white
                                      : bottomNavigationColor,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                          color: isGoldSelected ? Colors.white : primaryColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _onViewTap(false);
                          },
                          child: Center(
                              child: Text(
                            'Sliver',
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: isGoldSelected
                                  ? bottomNavigationColor
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
    );
  }

  Widget emiContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/gold_icon.png", width: 50),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Gold Coin",
                            style: TextStyle(
                              color: bottomNavigationColor,
                              fontFamily: Strings.fontfamilyCabinetGrotesk,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            )),
                        Spacer(),
                        Text("Status ",
                            style: TextStyle(
                              color: bottomNavigationColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            )),
                        Text("₹500",
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            )),
                      ],
                    ),
                    Text("₹12,500",
                        style: TextStyle(
                          color: bottomNavigationColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    const SizedBox(height: 2),
                    Text("Est Completion 25th Nov 2023",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("0.5 gm ",
                  style: TextStyle(
                    color: bottomNavigationColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  )),
              Spacer(),
              Text("2 gm ",
                  style: TextStyle(
                    color: bottomNavigationColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  )),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            value: 0.3,
          ),
        ],
      ),
    );
  }

  Widget loanContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Installment",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        )),
                    Text("03 March 2023",
                        style: TextStyle(
                          color: bottomNavigationColor,
                          fontFamily: Strings.fontfamilyCabinetGrotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        )),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                          text: "₹15,000 \n",
                          style: TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            color: primaryTextColor,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Installment Amount',
                              style: TextStyle(
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                color: primaryTextColor,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )),
                        RichText(
                            text: TextSpan(
                          text: "07",
                          style: TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            color: primaryTextColor,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "/10\n",
                                style: TextStyle(
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  color: primaryTextColor,
                                  fontSize: 14,
                                )),
                            TextSpan(
                              text: 'Installment',
                              style: TextStyle(
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                color: primaryTextColor,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/share_coin.png",
                  height: 50,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            value: 0.3,
          ),
        ],
      ),
    );
  }

  Widget priceNugets(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lowest Gold Price in 3 Months",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontfamilyCabinetGrotesk,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(Strings.investNow,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: bottomNavigationColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      )),
                ],
              )),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/low_price_image.png',
                    height: 60,
                  ),
                  Text("₹6,002/gm",
                      maxLines: 5,
                      style: TextStyle(
                        color: bottomNavigationColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget sipContainer(BuildContext context, StepupListData stepupListData) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(stepupListData.planName.toString(),
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.normal,
                fontSize: 10,
              )),
          Text("Earn up to ₹5.57 CR on your SIP ",
              style: TextStyle(
                color: bottomNavigationColor,
                fontFamily: Strings.fontfamilyCabinetGrotesk,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              )),
          const SizedBox(height: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                    text: "Current earnings ",
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      color: primaryTextColor,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '(After 40 Years)',
                        style: TextStyle(
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          color: primaryTextColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )),
                  Text(
                    "₹75 Lakhs",
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      color: primaryTextColor,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                value: 0.3,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                    text: "Current earnings ",
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      color: primaryTextColor,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '(After 40 Years)',
                        style: TextStyle(
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          color: primaryTextColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )),
                  Text(
                    "₹75 Lakhs",
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      color: primaryTextColor,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                value: 0.3,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: deliveryDescTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Step-up your SIP by 5%",
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
              ))
        ],
      ),
    );
  }

  Widget rewardNugetsContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                )),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(Strings.myPortfolio,
                    style: TextStyle(
                      color: bottomNavigationColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    )),
                Spacer(),
                RichText(
                    text: TextSpan(
                  text: "${Strings.totalValue}\n",
                  style: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    color: primaryTextColor,
                    fontSize: 11,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '12 Grams',
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        color: primaryTextColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Level 3\n",
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w500,
                        color: primaryTextColor,
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Novice',
                          style: TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w800,
                            color: primaryTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 15,
                    ),
                    LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      value: 0.3,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Invest more worth 3 grams of gold to reach the next level",
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        color: primaryTextColor,
                        fontSize: 13,
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "View all levels",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w700,
                        color: primaryTextColor,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "04",
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w700,
                      color: primaryTextColor,
                      fontSize: 16,
                    ),
                  ),
                  Image.asset(
                    "assets/images/crown_icon.png",
                  ),
                  Text(
                    "15g",
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.normal,
                      color: primaryTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget earningNugetsContainer(
      BuildContext context, HomeController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                )),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/trend_down.png",
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                        "You’ve missed on earning ₹${controller.diffrenceGoldRate.toStringAsFixed(2)}",
                        maxLines: 2,
                        style: TextStyle(
                          color: bottomNavigationColor,
                          fontFamily: Strings.fontfamilyCabinetGrotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ))),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/trend_up.png",
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("Your Earnings",
                        style: TextStyle(
                          color: bottomNavigationColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    Spacer(),
                    Image.asset(
                      "assets/images/database.png",
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("Missed Earnings",
                        style: TextStyle(
                          color: bottomNavigationColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                  ],
                ),
                Container(
                  // child: LinearProgressIndicator(
                  //   valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  //   value: controller.standardGoldRates.value,
                  // ),
                  child: Slider(
                    inactiveColor: Color(0xffFFF7E8),
                    value: controller.standardGoldRates.value,
                    max: controller.plusGoldRates.value,
                    onChanged: (double newValue) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Enable Gold+",
                            style: TextStyle(
                              color: bottomNavigationColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                        Image.asset(
                          "assets/images/arrow_right.png",
                          height: 20,
                          color: bottomNavigationColor,
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget portfolioContainer(BuildContext context, HomeController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    )),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("My Portfolio",
                            style: TextStyle(
                              color: bottomNavigationColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: bottomNavigationColor,
                          size: 18,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("₹${controller.totalAmount.value.toStringAsFixed(4)}",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontfamilyCabinetGrotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text("View Details",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          color: primaryTextColor,
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          controller.goToInvestmentDashbord();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Invest More",
                                style: TextStyle(
                                  color: bottomNavigationColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                            Image.asset(
                              "assets/images/arrow_right.png",
                              height: 20,
                              color: bottomNavigationColor,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
          // Profile image
          Positioned(
            top: 85.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderColor, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  portfolioWidget(
                      controller.walletGoldInGrams.value, "Total Gold"),
                  portfolioWidget(
                      controller.walletSilverInGrams.value, "Total Silver"),
                  portfolioWidget(
                      controller.walletFDGoldInGrams.value, "Gold+ Earned"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget portfolioWidget(String value, String title) {
    return RichText(
        text: TextSpan(
      text: "$value\n",
      style: TextStyle(
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        fontSize: 18,
      ),
      children: <TextSpan>[
        TextSpan(
          text: title,
          style: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.normal,
            color: primaryTextColor,
            fontSize: 12,
          ),
        ),
      ],
    ));
  }
}
