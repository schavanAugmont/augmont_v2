import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/themes.dart';
import '../widgets/augmont_bottom_app_bar.dart';

class UnleaseConfirmationBottomSheet extends StatelessWidget {
  const UnleaseConfirmationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius:  const BorderRadius.vertical(
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
          Image.asset("assets/images/qa.png",width: 100,),
          10.h,
          Text(
            "Interest due on 1/02/24, You will lose out on ₹5,000",
            style: CustomTheme.style(color: secondaryTextColor, weight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "Un-leasing gold+ takes approximately 24 hours, withdrawal can happen post the mentioned time period",
              textAlign: TextAlign.center,
              style: CustomTheme.style(weight: FontWeight.w600),
            ),
          ),
          30.h,
          AugmontBottomAppBar(
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(double.maxFinite, 48),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                ),
                20.w,
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(double.maxFinite, 48),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Proceed"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
