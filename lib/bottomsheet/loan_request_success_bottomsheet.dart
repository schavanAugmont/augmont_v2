import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/widgets/augmont_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanRequestSuccessBottomSheet extends StatelessWidget {
  const LoanRequestSuccessBottomSheet({super.key});

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
          Text("Loan Request Registered",style: CustomTheme.style(color: secondaryTextColor,weight: FontWeight.w600),),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "Your loan request has been registered successfully, Augmont team will reach out to you in next 48 hours.",
              textAlign: TextAlign.center,
              style: CustomTheme.style(weight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Loan request ID\t",style: CustomTheme.style(),),
                Text("CW20213987608",style: CustomTheme.style(weight: FontWeight.w600),),
              ],
            ),
          ),
          AugmontBottomAppBar(
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
