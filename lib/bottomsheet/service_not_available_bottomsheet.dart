import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceNotAvailableBottomSheet extends StatelessWidget {
  const ServiceNotAvailableBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 6,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            maxRadius: 30,
            child: Icon(Icons.crop_square),
          ),
          10.h,
          Text("Currently, Not serving!",style: CustomTheme.style(color: secondaryTextColor,weight: FontWeight.w600),),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "Currently, we do not have a branch in your area. We will get back to you soon, we are closing your request as of now.",
              textAlign: TextAlign.center,
              style: CustomTheme.style(weight: FontWeight.w600),
            ),
          ),
          Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fixedSize: const Size(double.maxFinite, 48),
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text("Okay!"),
            ),
          ),
        ],
      ),
    );
  }
}
