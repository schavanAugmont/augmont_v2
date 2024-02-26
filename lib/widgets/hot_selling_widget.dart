import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotSellingWidget extends StatelessWidget {
  const HotSellingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: context.width * 0.45,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: lightColor, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.all(4),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/pay.png",width: 20,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),
                        children: [
                          TextSpan(
                            text: "₹400",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.green,
                            )
                          ),
                          TextSpan(
                            text: "  ₹0 making charges",
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "\tGold Coin (2 gms)",
            style: CustomTheme.style(weight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            "\t₹12,440",
            style: CustomTheme.style(
              weight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
