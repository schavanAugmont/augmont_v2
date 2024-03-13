import 'package:augmont_v2/Screens/emi/emi_detail_screen.dart';
import 'package:augmont_v2/Screens/withdrawal/withdrawal_confirmation_screen.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/bank_withdrawal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../widgets/augmont_app_bar.dart';
import '../../widgets/augmont_bottom_app_bar.dart';
import '../../widgets/edit_text.dart';
import '../../widgets/payment_method_widget.dart';

class WithdrawalSummaryScreen extends StatelessWidget {
  const WithdrawalSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankWithdrawalController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const AugmontAppbar(
            canBack: true,
            title: "Withdraw Cash",
          ),
          bottomNavigationBar: AugmontBottomAppBar(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RichPrice(
                  label: "Amount to Withdraw",
                  amount: "11,700",
                  size: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  onPressed: () {
                    Get.to(()=> const WithdrawalConfirmationScreen());
                  },
                  child: Text(
                    "Proceed with Withdrawal",
                    style: CustomTheme.style(size: 12, color: Colors.white, weight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                text: "Withdrawal of ",
                                style: CustomTheme.style()
                            ),
                            TextSpan(
                                text: "₹11,700",
                                style: CustomTheme.style(weight: FontWeight.bold)
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black26,
                      ),
                      summry("Withdrawing from", "Wedding jewellery SIP"),
                      summry("Gold Quantity", "9 gm"),
                      summry("Savings", "₹20"),
                      const Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Net Withdrawal Amount",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
                          Text("₹11,700",style: CustomTheme.style(size: 13,weight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),
                ),
                20.h,
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
                          label: "Bank Name",
                          isRequired: true,
                        ),
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 12),
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
                if(controller.refundMode == RefundMode.upi)
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
                          hint: "9087654123@ibl",
                          label: "UPI ID or Virtual ID",
                          isRequired: true,
                        ),
                        10.h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.check_circle_outline_rounded,color: Colors.green,size: 20,),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Verify",
                                style: CustomTheme.style(weight: FontWeight.bold,size: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
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
