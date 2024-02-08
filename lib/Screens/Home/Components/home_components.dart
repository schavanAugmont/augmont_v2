

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';

Widget setfdView(BuildContext context){
  return  Container(
    margin:
    EdgeInsets.only(left: 20, right: 20, bottom: 20),
    decoration: BoxDecoration(
      color: kycProductBackgroundColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage('assets/images/ic_profit.png'),
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text("Earn 16% p.a. with Gold",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.info_outline,
              size: 18,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            "Augmont's Gold+ is here to help you to reap annual profit from invesment",
            maxLines: 5,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            )),
        Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: shadowColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.only(bottom: 20, top: 20),
            height: 40,
            child: Center(
                child: Text('Start invest in Gold+',
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ))))
      ],
    ),
  );
}

Widget setWalletView(BuildContext context){
  return  Container(
    decoration: BoxDecoration(
      border: Border.all(color: kycProductBackgroundColor),
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin:
    EdgeInsets.only(left: 20, right: 20, bottom: 20),
    child: Column(
      children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage('assets/images/ic_wallet.png'),
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text("Invest with every spend",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily:
                              Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                            "Most user saved \u{20B9} 2,00 every month",
                            maxLines: 5,
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily:
                              Strings.fontFamilyName,
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
            child: Center(
                child: Text(Strings.learnMore,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ))))
      ],
    ),
  );
}