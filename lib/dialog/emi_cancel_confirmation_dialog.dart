import 'package:augmont_v2/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/themes.dart';

class EmiCancelConfirmationDialog extends StatelessWidget {
  const EmiCancelConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              backgroundColor: primaryTextColor,
              maxRadius: 34,
              child: Icon(Icons.question_mark_rounded,color: Colors.white,size: 30,),
            ),
            const SizedBox(height: 20),
            Text(
              "Are you sure?",
              textAlign: TextAlign.center,
              style: CustomTheme.style(weight: FontWeight.w600,size: 16),
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Are you sure you wish to cancel the booking for ",
                    style: CustomTheme.style(weight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "Augmont Gold Coin? you will incur a cancellation fee of ₹2,500",
                    style: CustomTheme.style(weight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      )
                    ),
                    onPressed: () {
                      Get.back(result: "keep");
                    },
                    child: const Text("Keep Booking"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: redColor,
                      foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        )
                    ),
                    onPressed: () {
                      Get.back(result: "cancel");
                    },
                    child: const Text("Cancel Booking"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
