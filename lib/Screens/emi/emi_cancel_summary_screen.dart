import 'package:augmont_v2/bottomsheet/reason_bottomsheet.dart';
import 'package:augmont_v2/controllers/emi_detail_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/edit_text.dart';
import 'package:augmont_v2/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/themes.dart';
import 'emi_detail_screen.dart';

class EmiCancelSummaryScreen extends StatelessWidget {
  const EmiCancelSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmiDetailController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Cancellation Summary",
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
                    label: "Total Refundable Amount",
                    amount: "48,700",
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
                      Get.bottomSheet(const ReasonBottomSheet(),isScrollControlled: true,);
                    },
                    child: Text("Proceed",style: CustomTheme.style(weight: FontWeight.w600,color: Colors.white),),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              controller: controller.cancellationScrollController,
              padding: const EdgeInsets.all(16.0),
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
                                  text: "Total Refundable Amount ",
                                  style: CustomTheme.style()
                              ),
                              TextSpan(
                                  text: "₹48,700",
                                  style: CustomTheme.style(weight: FontWeight.bold,size: 20)
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black26,
                        ),
                        summry("Product Price on Booking Date  ", "₹57,500"),
                        summry("Total Charges Debited", "₹1100"),
                        summry("Total Charges Debited (Inc 18% GST)", "₹2500"),
                        summry("Cancellation Charges (3.00% of Price on Booking Date)", "-₹2500"),
                        summry("Platform Fee", "₹20"),
                        summry("Savings", "₹20"),
                        const Divider(
                          color: Colors.black26,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Refundable Amount",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
                            Text("₹48,700",style: CustomTheme.style(size: 16,weight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black26,
                    height: 1,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  RefundMethodWidget(
                    refundMode: controller.refundMode,
                    onChange: (method) {
                      controller.refundMode = method;
                      controller.update();
                    },
                  ),
                  if(controller.refundMode == RefundMode.bank)
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: lightColor),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          EditText(
                            controller: TextEditingController(),
                            hint: "HDFC Bank",
                            label: "Bank",
                            isRequired: true,
                          ),
                          const SizedBox(height: 20),
                          EditText(
                            controller: TextEditingController(),
                            hint: "987654231278",
                            label: "Account Number",
                            isRequired: true,
                            textInputType: TextInputType.number,
                            maxLength: 16,
                            formatter: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          const SizedBox(height: 20),
                          EditText(
                            controller: TextEditingController(),
                            hint: "AVCD1234562",
                            label: "IFSC Code",
                            isRequired: true,
                            maxLength: 11,
                            textCapitalization: TextCapitalization.characters,
                          ),
                        ],
                      ),
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
          Flexible(child: Text(label,style: CustomTheme.style(size: 13),)),
          Text(value,style: CustomTheme.style(size: 13,weight: FontWeight.w600),),
        ],
      ),
    );
  }
}
