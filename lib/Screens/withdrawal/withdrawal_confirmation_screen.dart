import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/bank_withdrawal_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/augmont_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawalConfirmationScreen extends StatelessWidget {
  const WithdrawalConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankWithdrawalController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: AugmontBottomAppBar(
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
                      onPressed: () {},
                      child: const Text("Yes"),
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(16),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Are you sure?",
                    style: CustomTheme.style(color: secondaryTextColor, weight: FontWeight.bold),
                  ),
                  10.h,
                  Text(
                    "Are you sure you wish to withdraw ₹11,700 from you Wedding SIP",
                    textAlign: TextAlign.center,
                    style: CustomTheme.style(weight: FontWeight.w600),
                  ),
                  Image.network("https://img.freepik.com/free-vector/sales-contract-terms-concept-illustration_335657-5633.jpg")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
