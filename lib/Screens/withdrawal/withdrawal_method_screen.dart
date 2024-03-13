import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bindings/bank_withdrawal_binding.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'withdraw_list_screen.dart';

class WithdrawalMethodScreen extends StatelessWidget {
  const WithdrawalMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AugmontAppbar(
          canBack: true,
          title: 'Withdrawal Methods',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(()=>const WithdrawListScreen(),binding: BankWithdrawalBinding());
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black26,
                            maxRadius: 20,
                            child: Image.asset("assets/images/ic_money.png",width: 20,),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.info_outline))
                        ],
                      ),
                      Text("Withdraw to Bank",style: CustomTheme.style(weight: FontWeight.w600),),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        minVerticalPadding: 0,
                        titleAlignment: ListTileTitleAlignment.titleHeight,
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black45,
                          maxRadius: 3,
                        ),
                        title: Text(
                          "Get money deposited to your bank account within 24-48 hours",
                          style: CustomTheme.style(weight: FontWeight.w500,size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.h,
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black26,
                            maxRadius: 20,
                            child: Image.asset("assets/images/ic_loan.png",width: 20,),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.info_outline))
                        ],
                      ).paddingOnly(left: 12,top: 12),
                      Text(
                        "Convert into gold Coin/Jewellery",
                        style: CustomTheme.style(weight: FontWeight.w600),
                      ).paddingSymmetric(horizontal: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.black45,
                            maxRadius: 3,
                          ),
                          8.w,
                          Flexible(
                            child: Text(
                              "24k gold secured via Augmont",
                              style: CustomTheme.style(weight: FontWeight.w500, size: 12),
                            ),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 12,vertical: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.black45,
                            maxRadius: 3,
                          ),
                          8.w,
                          Flexible(
                            child: Text(
                              "Get your jewellery delivered within 5-7 business days",
                              style: CustomTheme.style(weight: FontWeight.w500, size: 12),
                            ),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 12,vertical: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.black45,
                            maxRadius: 3,
                          ),
                          8.w,
                          Flexible(
                            child: Text(
                              "Safe and secure packaging and delivery",
                              style: CustomTheme.style(weight: FontWeight.w500, size: 12),
                            ),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 12,vertical: 4),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(8.0)
                          )
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.thumb_up_alt,color: Colors.black54,),
                            10.w,
                            Text("Preferred by many",style: CustomTheme.style(size: 10,),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
