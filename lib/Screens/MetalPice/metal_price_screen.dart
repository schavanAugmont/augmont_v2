import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

class MetalPriceScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Strings.goldPrice,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),

          SizedBox(width: 10,),

          Text('₹ 6000/gm',
              style: TextStyle(
                color: Colors.green,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 13,
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