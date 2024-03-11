import 'package:augmont_v2/Screens/emi/force_close_emi_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/controllers/emi_detail_controller.dart';
import 'package:augmont_v2/dialog/emi_cancel_confirmation_dialog.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/themes.dart';
import 'emi_detail_screen.dart';

class EmiPayScreen extends StatelessWidget {
  const EmiPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmiDetailController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Gold EMI Detail",
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
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  fixedSize: Size.fromWidth(context.width),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                ),
                onPressed: () {
                  Get.to(()=> const ForceCloseEmiScreen());
                },
                child: const Text("Foreclose EMI"),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: lightColor)
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Order ID : 2345",
                          style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            color: lightColor,
                            value: 0.5,
                            strokeWidth: 6,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "05/09 EMI Completed",
                          style: CustomTheme.style(size: 10, weight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 0,
                                blurRadius: 12,
                                offset: Offset(1, 1)
                              )
                            ]
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                color: lightColor,
                                alignment: Alignment.center,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Augmont 0.1Gm Gold Coin (999 Purity)",
                                    style: CustomTheme.style(weight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Product Amount : ₹56,000",
                                    style: CustomTheme.style(weight: FontWeight.w500,size: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Paid",
                              style: CustomTheme.style(size: 12, weight: FontWeight.bold,color: Colors.grey),
                            ),
                            Text(
                              "Total Payable Amount",
                              style: CustomTheme.style(size: 12, weight: FontWeight.bold,color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹21,000",
                              style: CustomTheme.style(size: 12, weight: FontWeight.bold),
                            ),
                            Text(
                              "₹58,000",
                              style: CustomTheme.style(size: 12, weight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          color: Colors.black26,
                          value: 0.4,
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            fixedSize: Size.fromWidth(context.width),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                          ),
                          onPressed: () {
                            Get.dialog(const EmiCancelConfirmationDialog()).then((value){
                              if(value!=null && value == "cancel") controller.cancelBooking();
                            });
                          },
                          child: const Text("Cancel Booking"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: lightColor),
                      borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/rate_of_insterest.png",width: 60),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Expected EMI Completion : May, 24",
                              style: CustomTheme.style(weight: FontWeight.w600),
                            ),
                            Text(
                              "Depends on timely payments from your end*",
                              style: CustomTheme.style(weight: FontWeight.w500,size: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    color: lightColor,
                    child: Column(
                      children: controller.detailList.map((e){
                        return ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                          title: Text(
                            e.$1,
                            style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                          ),
                          trailing: Text(
                            e.$2,
                            style: CustomTheme.style(size: 14, weight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                    )
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: lightColor),
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/rate_of_insterest.png",width: 60),
                        const SizedBox(width: 10),
                        Text(
                          "Hassle free Payments",
                          style: CustomTheme.style(weight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          "Enable AutoPay",
                          style: CustomTheme.style(weight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 14),
                      color: lightColor,
                      child: Column(
                        children: controller.tenureList.map((e){
                          return Material(
                            color: Colors.transparent,
                            child: ListTile(
                              key: UniqueKey(),
                              onTap: () {
                                if(e.$2!="Pending") return;
                                controller.selectedTenure(e.$1);
                                controller.update();
                              },
                              selected: controller.selectedTenure.value == e.$1,
                              selectedTileColor: primaryTextColor.withOpacity(0.3),
                              dense: true,
                              minVerticalPadding: 0,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              horizontalTitleGap: 0,
                              subtitle: controller.selectedTenure.value == e.$1
                                  ? Text(
                                      "Pending-12/02/2023",
                                      style: CustomTheme.style(size: 12),
                                    )
                                  : null,
                              title: Text(
                                e.$1,
                                style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                              ),
                              trailing: controller.selectedTenure.value == e.$1
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryTextColor,
                                        foregroundColor: Colors.white,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6.0)
                                        )
                                      ),
                                      onPressed: () {},
                                      child: Text("Pay Now"),
                                    )
                                  : Text(
                                      e.$2,
                                      style: CustomTheme.style(size: 14, weight: FontWeight.w600, color: e.$3),
                                    ),
                            ),
                          );
                        }).toList(),
                      )
                  ),

                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Details",
                      style: CustomTheme.style(weight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      color: lightColor,
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Shipping Address",style: CustomTheme.style(weight: FontWeight.w600),),
                          trailing: Text("Edit",style: CustomTheme.style(size: 12,weight: FontWeight.w600),),
                          subtitle: Text("Vanshika Singhal\nSinghal - Sadan Jail Well, Bikaner Rajasthan 334001 8949593341",
                            style: CustomTheme.style(size: 12,weight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Billing Address",style: CustomTheme.style(weight: FontWeight.w600),),
                          subtitle: Text("Vanshika Singhal\nSinghal - Sadan Jail Well, Bikaner Rajasthan 334001 8949593341",
                            style: CustomTheme.style(size: 12,weight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Payment Method",style: CustomTheme.style(weight: FontWeight.w600),),
                          subtitle: Text("PAYMENTGATEWAY",
                            style: CustomTheme.style(size: 12,weight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Order Date",style: CustomTheme.style(weight: FontWeight.w600),),
                          subtitle: Text("08/01/24",
                            style: CustomTheme.style(size: 12,weight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Product Description",
                      style: CustomTheme.style(weight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      color: lightColor,
                      child: Column(
                        children: controller.details.map((e){
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 0,
                            title: Text(
                              e.$1,
                              style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                            ),
                            trailing: Text(
                              e.$2,
                              style: CustomTheme.style(size: 14, weight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                      )
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 44,
                    width: double.maxFinite,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black54,
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder()
                      ),
                      onPressed: () {},
                      child: Text("Get Invoice"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
