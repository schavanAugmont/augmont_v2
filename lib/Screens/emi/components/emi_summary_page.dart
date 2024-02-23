import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/emi_checkout_controller.dart';
import 'package:augmont_v2/widgets/address_tile.dart';
import 'package:augmont_v2/widgets/coupon_code_widget.dart';
import 'package:augmont_v2/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiSummaryPage extends StatelessWidget {
  const EmiSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmiCheckoutController>(
      builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(14.0),
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
                            text: "Downpayment of ",
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
                        Text("₹60,000",style: CustomTheme.style(size: 13,weight: FontWeight.w600),),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Terms & Conditions",
                  style: CustomTheme.style(size: 13).copyWith(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: lightColor)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("First EMI Date : ",style: CustomTheme.style(),),
                    Text("02 FEB, 24.",style: CustomTheme.style(weight: FontWeight.w600),),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightColor,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      maxRadius: 24,
                      child: Image.asset("assets/images/coin.png",width: 34,),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Your product will be shipped out for delivery once you pay the EMI for the 6th month ",
                                style: CustomTheme.style()
                            ),
                            TextSpan(
                                text: "08 JAN,23.",
                                style: CustomTheme.style(weight: FontWeight.bold)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PaymentMethodWidget(
                paymentMethod: controller.paymentMethod,
                onChange: (method) {
                  controller.onPaymentSelected(method);
                },
              ),
              const SizedBox(height: 20),

              const CouponCodeWidget(),

              Container(
                color: lightColor,
                height: 1,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),

              Text("Selected Products ",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
              const SizedBox(height: 14),
              ListTile(
                tileColor: lightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                leading: Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/coin.png",width: 24),
                ),
                title: Text("Augmont 0.1Gm Gold Coin (999 Purity)",style: CustomTheme.style(weight: FontWeight.w600),),
                subtitle: Text("₹58,500",style: CustomTheme.style(weight: FontWeight.w500),),
              ),
              const SizedBox(height: 20),
              Text("To Delivery at ",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
              const SizedBox(height: 14),
              AddressTile(),
            ],
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
