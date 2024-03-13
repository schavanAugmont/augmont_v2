

import 'package:flutter/material.dart';

import '../Utils/colors.dart';

AnimatedContainer buildDot(int currentIndex, {int? index}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: EdgeInsets.only(right: 5),
    // height: 6,
    // width: currentIndex == index ? 20 : 6,
    // decoration: BoxDecoration(
    //   color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
    //   borderRadius: BorderRadius.circular(3),
    // ),

    child: Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:currentIndex == index ?bottomNavigationColor:Colors.transparent,
      ),
      child: Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ?Colors.white:Colors.transparent,
          ),

          child: CircleAvatar(
            radius: 4,
            backgroundColor: currentIndex == index ?bottomNavigationColor:Colors.grey,
          )),
    ),
  );
}