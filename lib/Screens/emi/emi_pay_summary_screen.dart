import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/themes.dart';
import '../../controllers/emi_detail_controller.dart';
import '../../widgets/augmont_app_bar.dart';
import '../../widgets/payment_method_widget.dart';
import 'emi_detail_screen.dart';

class EmiPaySummaryScreen extends StatelessWidget {
  const EmiPaySummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmiDetailController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "EMI Summary",
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
                    label: "Selected EMI Amount",
                    amount: "11,700",
                    size: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    onPressed: () {},
                    child: Text(
                      "Proceed",
                      style: CustomTheme.style(weight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
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
                  ),
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
