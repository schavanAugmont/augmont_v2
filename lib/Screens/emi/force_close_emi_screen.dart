import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/emi_detail_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/dotted_widget.dart';
import 'package:augmont_v2/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'emi_detail_screen.dart';

class ForceCloseEmiScreen extends StatelessWidget {
  const ForceCloseEmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmiDetailController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AugmontAppbar(
              canBack: true,
              title: "Foreclose EMI",
              bottom: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: context.width,
                height: 30,
                color: lightColor,
                child: Row(
                  children: [
                    Text("Gold Price",style: CustomTheme.style(size: 12),),
                    const Spacer(),
                    Text("₹6,320",style: CustomTheme.style(size: 12,weight: FontWeight.w600),),
                    const SizedBox(width: 10),
                    Image.asset("assets/images/ic_increment.png",color: greenColor,width: 16,)
                  ],
                ),
              ),
            ),
            bottomNavigationBar:Container(
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
                    label: "Selected EMI Amount",
                    amount: "20,700",
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
                    child: Text("Proceed",style: CustomTheme.style(weight: FontWeight.w600,color: Colors.white),),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichPrice(
                          label: "EMI Tenure",
                          amount: "11,700",
                          textAlign: TextAlign.center,
                        ),
                        DottedLine(axis: Axis.vertical),
                        RichPrice(
                          label: "Paid EMI",
                          amount: "11,700",
                          textAlign: TextAlign.center,
                        ),
                        DottedLine(axis: Axis.vertical),
                        RichPrice(
                          label: "Pending EMI",
                          amount: "11,700",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Pending EMI",style: CustomTheme.style(weight: FontWeight.w600,size: 16),),
                  const SizedBox(height: 10),
                  Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 14),
                      color: lightColor,
                      child: Column(
                        children: controller.tenureList.take(4).map((e){
                          return Material(
                            color: Colors.transparent,
                            child: CheckboxListTile(
                              key: UniqueKey(),
                              value: controller.cancelTenure.contains(e.$1),
                              activeColor: primaryTextColor,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (v) {
                                if(controller.cancelTenure.contains(e.$1)){
                                  controller.cancelTenure.remove(e.$1);
                                }else{
                                  controller.cancelTenure.add(e.$1);
                                }

                                controller.update();
                              },
                              dense: true,
                              title: Text(
                                e.$1,
                                style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                              ),
                              secondary:Text(
                                "Pending",
                                style: CustomTheme.style(size: 14, weight: FontWeight.w600, color: Colors.red),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                  ),
                  const SizedBox(height: 20),
                  Text("Foreclose EMI Summary",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
                  const SizedBox(height: 10,),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: lightColor,
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Downpayment of ",
                                  style: CustomTheme.style()
                              ),
                              TextSpan(
                                  text: "₹11,700",
                                  style: CustomTheme.style(weight: FontWeight.bold,size: 20)
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black26,
                        ),
                        summry("Product Price", "₹57,500"),
                        summry("EMI / month", "₹9,000*6"),
                        summry("Additional Charges (3% GST)", "₹500"),
                        summry("Total Interest amount", "₹1500"),
                        summry("Platform Fee", "₹20"),
                        summry("Deducted from Wallet", "-₹2000"),
                        summry("Savings", "₹20"),
                        const Divider(
                          color: Colors.black26,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Net Payable Amount",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
                            Text("₹60,000",style: CustomTheme.style(size: 16,weight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  PaymentMethodWidget(
                    paymentMethod: controller.paymentMethod,
                    onChange: (method) {
                      controller.paymentMethod = method;
                      controller.update();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget summry(String label,String value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,style: CustomTheme.style(size: 13),),
          Text(value,style: CustomTheme.style(size: 13,weight: FontWeight.w600),),
        ],
      ),
    );
  }
}
