import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../Home/Components/home_components.dart';

class DigitalInvestmentGoldScreen extends StatefulWidget {
  const DigitalInvestmentGoldScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DigitalInvestmentGoldState();
  }
}

class _DigitalInvestmentGoldState extends State<DigitalInvestmentGoldScreen> {
  bool isGoldSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
          //replace with our own icon data.
        ),
        title: Transform(
            // you can forcefully translate values left side using Transform
            transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
            child: Text(Strings.digitalInv,
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ))),
      ),
      bottomNavigationBar: Container(
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          // Adjust padding as needed
          child: BottomAppBar(
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 55.0),
                            backgroundColor: Colors.black),
                        child: Text("Start Investing in Gold",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )))),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 340,
                margin: EdgeInsets.only(top: 15),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 160,
                        decoration: BoxDecoration(
                          color:
                              isGoldSelected ? primaryTextColor : Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              _onViewTap(true);
                            },
                            child: Center(
                              child: Text(
                                'Gold Investments',
                                style: TextStyle(
                                  fontFamily: Strings.fontFamilyName,
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
                        width: 160,
                        height: 25,
                        decoration: BoxDecoration(
                          color:
                              isGoldSelected ? Colors.white : primaryTextColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _onViewTap(false);
                          },
                          child: Center(
                              child: Text(
                            'Sliver Investments',
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color:
                                  isGoldSelected ? Colors.grey : Colors.white,
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                color: kycProductBackgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: shadowColor),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/images/ic_idea.png'),
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Graph Insights",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      SizedBox(
                        height: 0,
                      ),
                      Text("Gold Price at 3 Month Low, \nbest time to buy ",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          )),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            setfdView(context),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: kycProductBackgroundColor),
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/images/ic_coins.png'),
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                        "Over 10K customers have invested in Gold SIP with Aiugmont",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )),
                  ),
                ],
              ),
            ),
            setWalletView(context),
            Container(
                margin:
                EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Advantages of Digital Gold",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 130.0,
                        child: ListView.builder(
                          //here your code
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return newsListItem();
                            }))
                  ],
                )),
            Container(
                margin:
                EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Gold in th News",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 130.0,
                        child: ListView.builder(
                          //here your code
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return newsListItem();
                            }))
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kycProductBackgroundColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/images/ic_shop.png'),
                            size: 40,
                            color: primaryTextColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Use DigiGold to purchase \nJewellry and many more",
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  )),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                  "Use your digital gold to pay at nearest store",
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                            ],
                          )),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: kycProductBackgroundColor,
                      height: 30,
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Find stores near you',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ))))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kycProductBackgroundColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/ic_safe.png'),
                        size: 30,
                        color: primaryTextColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text("Your Gold is 100% safe with us!",
                              maxLines: 2,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("13.5k",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text("People have invested with augmont",
                              maxLines: 5,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              )),
                        ],
                      )),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("\$3 Bn Revenues",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                              "Top 150 unlisted companies in India- Dun & Brandstreet",
                              maxLines: 5,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              )),
                        ],
                      )),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("10+ Award wining",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Best Gold seller award by BFGC",
                              maxLines: 5,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              )),
                        ],
                      )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void _onViewTap(bool bool) {
    setState(() {
      isGoldSelected = bool;
    });
  }

  Widget newsListItem() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kycProductBackgroundColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 200,
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
              SizedBox(width: 10,),
              Text("Gold Coins",
                  maxLines: 2,
                  style: TextStyle(
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

          Text("Gold is one of the safest way to grow your money for next 30 year",
              maxLines: 2,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              )),
          Spacer(),
          Text("08th Oct 2023",
              maxLines: 2,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              )),
        ],
      ),
    );
  }
}
