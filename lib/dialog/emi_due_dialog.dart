import 'package:augmont_v2/Screens/emi/emi_pay_screen.dart';
import 'package:augmont_v2/Screens/emi/emi_pay_summary_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/bindings/emi_detail_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/themes.dart';

class EmiDueDialog extends StatelessWidget {
  const EmiDueDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(8.0)
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "EMI Missed",
              style: CustomTheme.style(color: Colors.grey,weight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              "Augmont 0.1Gm Gold Coin\n(999 Purity)",
              textAlign: TextAlign.center,
              style: CustomTheme.style(weight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "EMI Amount : ",
                    style: CustomTheme.style(size: 13,weight: FontWeight.w500)
                  ),
                  TextSpan(
                    text: "₹15,600",
                    style: CustomTheme.style(size: 13,weight: FontWeight.bold)
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lightColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Text(
                "Due Date : 21st Feb, 2024",
                textAlign: TextAlign.center,
                style: CustomTheme.style(weight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: Size.fromWidth(context.width),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              onPressed: () {
                Get.back();
                Get.to(()=> const EmiPaySummaryScreen(),binding: EmiDetailBinding(),transition: Transition.fadeIn);
              },
              child: const Text("Pay Now"),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                fixedSize: Size.fromWidth(context.width),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              onPressed: () {
                Get.to(()=> const EmiPayScreen(),binding: EmiDetailBinding(),transition: Transition.fadeIn);
              },
              child: const Text("View Details"),
            ),
          ],
        ),
      ),
    );
  }
}
