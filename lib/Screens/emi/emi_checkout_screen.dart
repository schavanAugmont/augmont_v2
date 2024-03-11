import 'package:augmont_v2/Screens/emi/components/emi_address_page.dart';
import 'package:augmont_v2/Screens/emi/components/emi_summary_page.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';

import '../../controllers/emi_checkout_controller.dart';
import '../../widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'emi_detail_screen.dart';

class EmiCheckoutScreen extends StatelessWidget {
  const EmiCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmiCheckoutController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Checkout",
            ),
            bottomNavigationBar: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: controller.currentStep==1?70:0,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 12, offset: Offset(0, -4)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const RichPrice(
                    label: "Downpayment Amount",
                    amount: "11,700",
                    size: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                    ),
                    onPressed: () {},
                    child: Text("Proceed to Pay",style: CustomTheme.style(weight: FontWeight.w600,color: Colors.white),),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.onPageChanges(0);
                        },
                        child: CircleAvatar(
                          maxRadius: 14,
                          backgroundColor: primaryTextColor,
                          child: Text("1",style: CustomTheme.style(size: 12,color: Colors.white,weight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 1,
                        color: primaryTextColor,
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.onPageChanges(1);
                        },
                        child: CircleAvatar(
                          maxRadius: 14,
                          backgroundColor:controller.currentStep==1? primaryTextColor : Colors.black54,
                          child: Text("2",style: CustomTheme.style(size: 12,color: Colors.white,weight: FontWeight.w600),),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Delivery Information",style: CustomTheme.style(size: 10,weight: FontWeight.w600),),
                      const SizedBox(
                        width: 80,
                        height: 1,
                      ),
                      Text("Summary",style: CustomTheme.style(size: 10,weight: controller.currentStep==1?FontWeight.w600:FontWeight.w500),),
                      const SizedBox(width: 20,)
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    allowImplicitScrolling: false,
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      EmiAddressPage(),
                      EmiSummaryPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
