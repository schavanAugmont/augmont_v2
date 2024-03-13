import 'package:augmont_v2/Screens/withdrawal/withdrawal_summary_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/bank_withdrawal_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/augmont_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawDetailScreen extends StatelessWidget {
  const WithdrawDetailScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankWithdrawalController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Withdraw Cash",
            ),
            bottomNavigationBar: AugmontBottomAppBar(
              height: 130,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
              child: Column(
                children: [
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Text("Selling at ",style: CustomTheme.style(size: 10),),
                        Text("₹5,060/gm",style: CustomTheme.style(size: 10,weight: FontWeight.w500),),
                        const Spacer(),
                        Image.asset("assets/images/connect.png",width: 24),
                        Text("Valid for 05:00",style: CustomTheme.style(size: 10,weight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  8.h,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      fixedSize: const Size(double.maxFinite,48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )
                    ),
                    onPressed: () {
                      Get.to(()=> const WithdrawalSummaryScreen());
                    },
                    child: const Text("Proceed"),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Withdrawing from ",style: CustomTheme.style(weight: FontWeight.w500),),
                      Text("Wedding Jewellery",style: CustomTheme.style(weight: FontWeight.w600),),
                    ],
                  ),
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: lightColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Value ",style: CustomTheme.style(weight: FontWeight.w500),),
                            Text("₹2000 = 0.2 gms",style: CustomTheme.style(weight: FontWeight.w600),),
                          ],
                        ),
                        Text(
                          "This SIP could have grown into ₹14,000 in next 10 years ",
                          textAlign: TextAlign.center,
                          style: CustomTheme.style(weight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: lightColor,
                    ),
                    child: Row(
                      children: [
                        Text("Withdrawing ",style: CustomTheme.style(size: 12),),
                        Text("₹1000",style: CustomTheme.style(weight: FontWeight.w600),),
                        const Spacer(),
                        Text("Remaining ",style: CustomTheme.style(size: 12),),
                        Text("₹1000",style: CustomTheme.style(weight: FontWeight.w600),),

                      ],
                    ),
                  ),

                  Text("Enter amount ",style: CustomTheme.style(size: 12),),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: lightColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: CustomTheme.style(weight: FontWeight.w600,size: 13),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "₹1000",
                            ),
                          ),
                        ),
                        Text("=0.2345 gms",style: CustomTheme.style(size: 10),),

                      ],
                    ),
                  ),

                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: lightColor,
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.all.value,
                            activeColor: primaryTextColor,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              controller.all(value);
                            },
                          ),
                        ),
                        Text("Use complete investment value from this SIP",style: CustomTheme.style(size: 12),),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
