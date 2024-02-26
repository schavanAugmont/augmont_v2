import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/themes.dart';
import '../bottomsheet/offer_detail_bottomsheet.dart';

class OfferGrid extends StatelessWidget {
  const OfferGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: context.width*0.42,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: lightColor, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(4.0)
              ),
              alignment: Alignment.center,
              child: Icon(Icons.border_all_outlined),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Get offer flat 15% OFF",
            style: CustomTheme.style(weight: FontWeight.w600, color: Colors.black),
          ),
          Container(
            padding: const EdgeInsets.only(left: 4),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: lightColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("OFFER2024",style: CustomTheme.style(size: 12),),
                IconButton(onPressed: (){}, icon: Icon(Icons.copy,size: 20,color: lightColor),)
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              Get.bottomSheet(const OfferDetailBottomSheet());
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "View Details",
                style: CustomTheme.style(weight: FontWeight.w600, color: Colors.black, size: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
