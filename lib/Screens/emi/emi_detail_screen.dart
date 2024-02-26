import 'package:augmont_v2/Screens/emi/emi_checkout_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bindings/emi_checkout_binding.dart';
import 'package:augmont_v2/controllers/shop_emi_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/dotted_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiDetailScreen extends StatelessWidget {
  const EmiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopEMIController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Book on EMI",
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              children: [
                SizedBox(
                  height: 290,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            color: lightColor,
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Augmont 0.1Gm Gold Coin (999 Purity)",
                                style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const RichPrice(
                                        label: "Total pay",
                                        amount: "58,700",
                                        size: 20,
                                        textAlign: TextAlign.center,
                                      ),
                                      // SizedBox(height: 10),
                                      const DottedLine(),
                                      // SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const RichPrice(
                                            label: "Downpayment",
                                            amount: "11,700",
                                            textAlign: TextAlign.center,
                                          ),
                                          RichPrice(
                                            label: "EMI/Month",
                                            amount: ((58700-11700)/controller.selectedTenure).toStringAsFixed(0),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/images/emi_coin.png", width: 124),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: lightColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/rate_of_insterest.png",width: 40),
                      const SizedBox(width: 6),
                      Text(
                        "Rate of interest : 0.5% per month",
                        style: CustomTheme.style(size: 12,weight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: context.width*0.7,
                    color: Colors.black26,
                    margin: const EdgeInsets.symmetric(vertical: 24),
                  ),
                ),
                Text("Choose EMI tenure *", style: CustomTheme.style(size: 16, weight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [3,6,9].map((e){
                    return Theme(
                      data: ThemeData(
                        hintColor: Colors.black54,
                      ),
                      child: ChoiceChip(
                        checkmarkColor: Colors.black54,
                        selectedColor: lightColor,
                        label: Text("$e months"),
                        showCheckmark: true,
                        side: const BorderSide(color: Colors.black26, width: 1),
                        selected: controller.selectedTenure == e,
                        onSelected: (value) {
                          controller.selectedTenure = e;
                          controller.update();
                        },
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Please Note !",style: CustomTheme.style(weight: FontWeight.w600),),
                      const SizedBox(height: 10),
                      Text(
                        "Your EMI Tenure will be  from Feb, 24 - May, 24, post your last EMI instalment we will ship your product with 3-4 days post payment",
                        style: CustomTheme.style(weight: FontWeight.w500,size: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: Container(
              height: 70,
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
                    onPressed: () {
                      Get.to(()=> const EmiCheckoutScreen(),binding: EmiCheckoutBinding(),transition: Transition.rightToLeft);
                    },
                    child: Text("Proceed to Pay",style: CustomTheme.style(weight: FontWeight.w600,color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RichPrice extends StatelessWidget {
  final String label;
  final dynamic amount;
  final TextAlign textAlign;
  final double size;
  const RichPrice({super.key,this.size = 14,required this.label,this.amount,this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$label\n",
            style: CustomTheme.style(size: 12,color: Colors.black26).copyWith(
                height: 2
            ),
          ),
          TextSpan(
            text: "₹$amount",
            style: CustomTheme.style(size: size,weight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
