import 'dart:math';

import 'package:augmont_v2/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/themes.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.maxFinite,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(4),
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/pay.png",width: 20,),
                      ),
                      Container(
                        margin: const EdgeInsets.all(4),
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: grayColor,width: 0.5)
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.favorite_border,size: 18,),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "\tGold Coin (2 gms)",
            style: CustomTheme.style(weight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: PriceWidget(
              price: "12,500",
              offerPrice: "11,500",
              offerPercentage: "${Random().nextInt(24)}",
            ),
          ),
          // const SizedBox(height: 4),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 10,
                ignoreGestures: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text(
                "\t4.3",
                style: CustomTheme.style(color: Colors.grey,size: 12,weight: FontWeight.w600)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
