import 'package:augmont_v2/Screens/emi/components/emi_address_page.dart';
import 'package:augmont_v2/Screens/emi/components/emi_summary_page.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';

import '../../controllers/emi_checkout_controller.dart';
import '../../widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            body: Column(
              children: [
                Padding(
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
                          backgroundColor: primaryTextColor,
                          child: Text("2",style: CustomTheme.style(size: 12,color: Colors.white,weight: FontWeight.w600),),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Delivery Information",style: CustomTheme.style(size: 10),),
                    const SizedBox(
                      width: 80,
                      height: 1,
                    ),
                    Text("Summary",style: CustomTheme.style(size: 10),),
                    const SizedBox(width: 20,)
                  ],
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
