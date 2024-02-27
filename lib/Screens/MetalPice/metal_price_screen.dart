import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

class MetalPriceScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: kycProductBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(Strings.goldPrice,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              )),
          Spacer(),
          Text('₹ 6000/gm',
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.normal,
                fontSize: 12,
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
      ),
    );
  }
}