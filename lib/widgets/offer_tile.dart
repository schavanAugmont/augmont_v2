import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/themes.dart';

class OfferTile extends StatelessWidget {
  const OfferTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
              child: const Icon(Icons.border_all_outlined),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Get flat ₹120 discount using Axis Bank MY ZONE Credit Cards",
            style: CustomTheme.style(weight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            "Flat ₹120 discount on orders above ₹500",
            style: CustomTheme.style(weight: FontWeight.w500,size: 12),
          ),
          Container(
            height: 1,
            width: double.maxFinite,
            color: lightColor,
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),

          Text("Terms and Conditions",style: CustomTheme.style(weight: FontWeight.w600,)),
          const SizedBox(height: 10),
          description("Applicable twice per user per month"),
          description("Valid only on Axis Bank MY ZONE Credit Cards"),
          description("Offer valid till Jan 31st, 24 11:59 PM"),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: lightColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("OFFER2024",style: CustomTheme.style(size: 14,weight: FontWeight.w600),),
                IconButton(onPressed: (){}, icon: Icon(Icons.copy,size: 20,color: Colors.black54),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget description(String value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const CircleAvatar(
            maxRadius: 3,
            backgroundColor: Colors.black54,
          ),
          const SizedBox(width: 5),
          Text(value,style: CustomTheme.style(size: 12,),)
        ],
      ),
    );
  }
}
