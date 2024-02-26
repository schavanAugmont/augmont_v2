import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kycProductBackgroundColor,
        border: Border.all(color: kycProductBackgroundColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 160,
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            children: [
              ImageIcon(
                AssetImage("assets/images/ic_image.png"),
                size: 12,
              ),
              Spacer(),
              Icon(Icons.arrow_forward, size: 12)
            ],
          ),
          const Spacer(),
          Text(
            "Gold Coins",
            maxLines: 2,
            style: CustomTheme.style(size: 13),
          ),
          Text(
            "Starting From \n\u{20B9} 10000",
            maxLines: 2,
            style: CustomTheme.style(size: 11, weight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
