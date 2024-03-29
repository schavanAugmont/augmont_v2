import 'package:flutter/material.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';


Widget maintitle(String value){
  return Text(value,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: primaryTextColor,
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ));
}

Widget mainDescp(String value){
  return Text(value,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: primaryTextColor,
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.normal,
        fontSize: 13,
      ));
}

Widget subtitle(String value){
  return RichText(
      text: TextSpan(
        text: value,
        style: TextStyle(
          fontFamily: Strings.fontFamilyName,
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
          fontSize: 13,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' *',
            style: TextStyle(
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              color: Colors.red,
              fontSize: 13,
            ),
          ),
        ],
      ));
}