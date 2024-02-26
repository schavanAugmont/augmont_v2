import 'package:flutter/material.dart';

import '../Utils/themes.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final String offerPrice;
  final String offerPercentage;
  final double priceSize;
  const PriceWidget({super.key,required this.price,required this.offerPrice,this.offerPercentage='',this.priceSize=14});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: "₹$offerPrice ",
                  style: CustomTheme.style(weight: FontWeight.w600, color: Colors.black,size: priceSize),
                ),
                TextSpan(
                  text: "$offerPercentage% OFF",
                  style: CustomTheme.style(size: 12,weight: FontWeight.w600, color: Colors.green),
                ),
              ]
          ),
        ),
        Text(
          "₹$price",
          style: CustomTheme.style(color: Colors.grey,size: 12).copyWith(
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
