import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bindings/product_binding.dart';
import '../../widgets/category_widget.dart';
import '../Shop/product_list_screen.dart';

class WithdrawalConvertIntoJewellery extends StatefulWidget {
  const WithdrawalConvertIntoJewellery({super.key});

  @override
  State<WithdrawalConvertIntoJewellery> createState() => _WithdrawalConvertIntoJewelleryState();
}

class _WithdrawalConvertIntoJewelleryState extends State<WithdrawalConvertIntoJewellery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AugmontAppbar(
          canBack: true,
          title: "Convert into Gold coins/ Jewellery",
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(14),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Steps to convert",style: CustomTheme.style(weight: FontWeight.w600),),
                    8.h,
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black12)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black12,
                              ),
                              6.h,
                              Text(
                                "Select a\nProduct",
                                textAlign: TextAlign.center,
                                style: CustomTheme.style(weight: FontWeight.w600,size: 12),
                              ),
                            ],
                          ),
                          Text("--------",style: CustomTheme.style(color: secondaryTextColor),),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black12,
                              ),
                              6.h,
                              Text(
                                "Select an\nInvestment",
                                textAlign: TextAlign.center,
                                style: CustomTheme.style(weight: FontWeight.w600,size: 12),
                              ),
                            ],
                          ),
                          Text("--------",style: CustomTheme.style(color: secondaryTextColor),),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black12,
                              ),
                              6.h,
                              Text(
                                "Make the\nPayment",
                                textAlign: TextAlign.center,
                                style: CustomTheme.style(weight: FontWeight.w600,size: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.h,
                    Center(child: Text("----------",style: CustomTheme.style(color: Colors.black38,weight: FontWeight.w600)),),
                    10.h,
                    Container(
                      color: Colors.black12,
                      child: ListTile(
                        leading: Checkbox(
                          value: true,
                          activeColor: primaryTextColor,
                          onChanged: (value) {

                          },
                        ),
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.zero,
                        title: Text("Pay with Digital Investment",style: CustomTheme.style(weight: FontWeight.w600),),
                        trailing: Text("Edit\t\t",style: CustomTheme.style(weight: FontWeight.w600,color: primaryTextColor),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              titleSpacing: 14,
              title: Text("Product Categories",style: CustomTheme.style(weight: FontWeight.w600,size: 16),),
            ),
            SliverGrid.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(
                      () => const ProductListScreen(query: "Coin",purpose: Purpose.withdrawal,),
                      binding: ProductBinding(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: const CategoryWidget(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
