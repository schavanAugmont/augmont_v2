import 'package:augmont_v2/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryDarkColor,
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            surface: backgroundColor,
        ),
        appBarTheme: appBarTheme,
        textTheme: textTheme,
        scaffoldBackgroundColor: white,
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }

  static AppBarTheme get appBarTheme {
    return AppBarTheme(
        color: backgroundColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: toolBarTextStyle);
  }

  static TextStyle get toolBarTextStyle {
    return TextStyle(
      fontFamily: Strings.fontFamilyName,
      color: primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextTheme get textTheme {
    return TextTheme(
        headline6: TextStyle(
      fontFamily: Strings.fontFamilyName,
      fontWeight: FontWeight.normal,
      color: primaryColor,
    ));
  }

  TextStyle primaryBoldTextStyle() {
    return TextStyle(
      fontFamily: Strings.fontFamilyName,
      color: primaryTextColor,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle primaryNormalTextStyle() {
    return TextStyle(
      fontFamily: Strings.fontFamilyName,
      color: primaryTextColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
  }

  TextStyle secondaryNormalTextStyle() {
    return TextStyle(
      fontFamily: Strings.fontFamilyName,
      color: secondaryTextColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
  }

  TextStyle secondaryBoldTextStyle() {
    return TextStyle(
      fontFamily: Strings.fontFamilyName,
      color: secondaryTextColor,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
  }

  TextStyle buttonTextStyle() {
    return TextStyle(
      fontFamily: Strings.fontFamilyName,
      color: white,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );
  }

  static TextStyle textStyle = TextStyle(
      color: white,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      fontFamily: Strings.fontFamilyName);

  static TextStyle textStyle1 = TextStyle(
      color: priceTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      fontFamily: Strings.fontFamilyName);
}
