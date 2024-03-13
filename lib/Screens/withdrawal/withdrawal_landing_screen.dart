import 'package:augmont_v2/Screens/withdrawal/withdrawal_method_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/augmont_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawalLandingScreen extends StatelessWidget {
  const WithdrawalLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AugmontAppbar(
          canBack: true,
          title: "Withdrawal",
        ),
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
                  onPressed: () {
                    Get.to(()=> const WithdrawalMethodScreen());
                  },
                  child: const Text("Proceed"),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: lightColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Your average buy Price",style: CustomTheme.style(color: Colors.black38),),
                          6.h,
                          Text("₹6,002/gm",style: CustomTheme.style(weight: FontWeight.w600,size: 16),),
                        ],
                      ),
                    ),
                  ),
                  20.w,
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.green.withOpacity(0.1),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Today’s selling Price",style: CustomTheme.style(color: Colors.black38),),
                          6.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("₹6,602/gm",style: CustomTheme.style(weight: FontWeight.w600,size: 16),),
                              4.w,
                              Icon(Icons.arrow_upward_rounded,color: Colors.green,size: 16,),
                              Text("(10%)",style: CustomTheme.style(weight: FontWeight.w500,color: Colors.green),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              20.h,
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black12)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/ic_increment.png",width: 18,color: Colors.white),
                              4.w,
                              Text("10%",style: CustomTheme.style(color: Colors.white,weight: FontWeight.w500),)
                            ],
                          ),
                        )
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset("assets/images/ic_idea.png",width: 30),
                      title: Text(
                        "Time to invest more",
                        style: CustomTheme.style(color: secondaryTextColor, weight: FontWeight.w600,size: 12),
                      ),
                      subtitle: Text(
                        "Gold prices consistently moved up by 0.5% for the last 3 weeks",
                        style: CustomTheme.style(weight: FontWeight.w600,size: 13),
                      ),
                    )
                  ],
                ),
              ),
              20.h,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("You can earn more profit",style: CustomTheme.style(weight: FontWeight.w600,color: Colors.black26,size: 18),),
                    10.h,
                    Text(
                      "Gold prices are high, you can earn more profit by holding your gold as the prices are increasing",
                      textAlign: TextAlign.center,
                      style: CustomTheme.style(weight: FontWeight.w600),
                    ),
                    // 20.h,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        "https://img.freepik.com/free-vector/buy-sell-arrows-stock-market-trading_1017-13717.jpg",
                        height: 400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
