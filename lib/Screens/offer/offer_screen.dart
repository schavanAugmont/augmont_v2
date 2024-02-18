import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/bottomsheet/offer_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/offer_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const AugmontAppbar(
              title: "Available Offer",
              canBack: true,
            ),
            body: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) {
                return Container(height: 20,color: lightColor,);
              },
              itemBuilder: (context, index) {
                return const OfferTile();
              },
            ),
          ),
        );
      },
    );
  }
}
