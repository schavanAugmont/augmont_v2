import 'package:augmont_v2/widgets/offer_tile.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class OfferDetailBottomSheet extends StatelessWidget {
  const OfferDetailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 6,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 16),
          const OfferTile(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
