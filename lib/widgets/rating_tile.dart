import 'package:augmont_v2/Utils/colors.dart';
import 'package:flutter/material.dart';

import '../Utils/themes.dart';

class RatingTile extends StatelessWidget {
  final List<String> images;
  const RatingTile({super.key,this.images=const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Deepak Gupta",style: CustomTheme.style(size: 14,weight: FontWeight.w600),),
              const SizedBox(width: 10),
              Text("Verified Buyer",style: CustomTheme.style(size: 12,weight: FontWeight.w500),),
              const Spacer(),
              Text("4.3",style: CustomTheme.style(size: 14,weight: FontWeight.w600),),
              const SizedBox(width: 4),
              const Icon(Icons.star_rate_rounded,size: 18)
            ],
          ),
          const SizedBox(height: 10),
          Text("AUTHENTIC PRODUCT",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
          const SizedBox(height: 10),
          Text(
            "Remember, investing in gold involves risk, and it's important to conduct thorough research or consult with a financial advisor before",
            style: CustomTheme.style(size: 13, weight: FontWeight.w500),
          ),
          if(images.isNotEmpty)
          Container(
            height: 100,
            margin: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: images.map((e) {
                  return Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text("Helpful ?",style: CustomTheme.style(size: 14,weight: FontWeight.w500),),
              const SizedBox(width: 8),
              const Icon(Icons.thumb_up_alt,size: 18),
              const SizedBox(width: 4),
              Text("Yes (3)",style: CustomTheme.style(size: 14,weight: FontWeight.w500),),
              Container(
                width: 1,
                height: 30,
                color: lightColor,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              const Icon(Icons.thumb_down_alt,size: 18),
              const SizedBox(width: 4),
              Text("No (0)",style: CustomTheme.style(size: 14,weight: FontWeight.w500),),
              const Spacer(),
              Text("11 Aug 2023",style: CustomTheme.style(size: 12,weight: FontWeight.w500),),
            ],
          )
        ],
      ),
    );
  }
}
