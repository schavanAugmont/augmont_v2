
import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/strings.dart';

Widget textComponent(String title, double fontsize, FontWeight fontweight) {
  return Text(
    title,
    maxLines: 2,
    style: TextStyle(
      color: primaryTextColor,
      fontFamily: Strings.fontFamilyName,
      fontWeight: fontweight,
      fontSize: fontsize,
    ),
  );
}