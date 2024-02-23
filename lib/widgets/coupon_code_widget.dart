import 'package:augmont_v2/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/themes.dart';

class CouponCodeWidget extends StatefulWidget {
  const CouponCodeWidget({super.key});

  @override
  State<CouponCodeWidget> createState() => _CouponCodeWidgetState();
}

class _CouponCodeWidgetState extends State<CouponCodeWidget> {
  final couponCodeController = TextEditingController();



  @override
  void dispose() {
    couponCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Coupon Code",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: couponCodeController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Apply Coupon Code",
                    hintStyle: CustomTheme.style(
                      size: 13,
                      color: Colors.black26,
                    ),
                    isDense: true,
                  ),
                ),
              ),
              Text("Apply",style: CustomTheme.style(weight: FontWeight.w600),)
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text("Enter the Coupon Code if any",style: CustomTheme.style(size: 10),),
        const SizedBox(height: 14),
        SizedBox(
          height: 70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: ["40", "50"].map((e) {
              return Container(
                width: context.width*0.45,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.percent_rounded,color: Colors.black26,size: 18,),
                        const SizedBox(width: 10),
                        Flexible(child: Text("Save another ₹$e on this purchase",style: CustomTheme.style(size: 10),)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Apply",
                        style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "View all applicable coupon codes",
            style: CustomTheme.style(size: 12, weight: FontWeight.w500).copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
