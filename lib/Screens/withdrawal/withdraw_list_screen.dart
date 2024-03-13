import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bottomsheet/unlease_confirmation_bottomsheet.dart';
import 'package:augmont_v2/controllers/bank_withdrawal_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'withdrawal_detail_screen.dart';

class WithdrawListScreen extends StatelessWidget {
  const WithdrawListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankWithdrawalController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Withdraw Cash",
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 170,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: lightColor)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top:0,
                          right: 0,
                          left: 0,
                          bottom: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: lightColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Investment",style: CustomTheme.style(weight: FontWeight.w600,color: Colors.black26),),
                            8.h,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("₹1,03,500",style: CustomTheme.style(weight: FontWeight.w600,size: 16),),
                                2.w,
                                const Icon(Icons.arrow_upward_rounded,color: Colors.green,size: 18),
                                2.w,
                                Text("(12%)",style: CustomTheme.style(weight: FontWeight.w600,size: 16,color: Colors.green),),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: lightColor)
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("12g",style: CustomTheme.style(weight: FontWeight.w500,size: 16),),
                                      Text("08g",style: CustomTheme.style(weight: FontWeight.w500,size: 16),),
                                      Text("0.75g",style: CustomTheme.style(weight: FontWeight.w500,size: 16),),
                                    ],
                                  ),
                                  4.h,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Total Gold",style: CustomTheme.style(weight: FontWeight.w600,),),
                                      Text("Total Silver",style: CustomTheme.style(weight: FontWeight.w600),),
                                      Text("Gold+ Earned",style: CustomTheme.style(weight: FontWeight.w600),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,
                      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: lightColor)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: Image.asset("assets/images/semi_circle.png", width: 120),
                          ),

                          Positioned(
                            left: 20,
                            right: 0,
                            bottom: 0,
                            child: Row(
                              children: [
                                Text("Total Value ", style: CustomTheme.style(size: 12)),
                                Text("0.5 Grams", style: CustomTheme.style(size: 12, weight: FontWeight.w600)),
                                const Spacer(),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black87,
                                  ),
                                  onPressed: () {
                                    if(index!=2){
                                      Get.to(()=> const WithdrawDetailScreen());
                                    }else{
                                      Get.bottomSheet(const UnleaseConfirmationBottomSheet());
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Text(index==2?"Unlease":"Proceed", style: CustomTheme.style(size: 12, weight: FontWeight.w600)),
                                      4.w,
                                      const Icon(Icons.arrow_forward_ios_rounded, size: 8),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                              left: 20,
                              top: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(controller.list[index].$1,style: CustomTheme.style(weight: FontWeight.w600),),
                                  6.h,
                                  Text(controller.list[index].$2,style: CustomTheme.style(),),
                                ],
                              )
                          ),
                          index==2?
                          const Positioned(
                            top: 20,
                              right: 30,
                              child: Icon(Icons.lock_outline,color: Colors.white),
                          ):const SizedBox(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
