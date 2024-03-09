import 'package:augmont_v2/Screens/Shop/product_detail_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bindings/product_detail_binding.dart';
import 'package:augmont_v2/bottomsheet/filter_bottomsheet.dart';
import 'package:augmont_v2/bottomsheet/sory_by_bottomsheet.dart';
import 'package:augmont_v2/controllers/product_controller.dart';
import 'package:augmont_v2/controllers/wishlist_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/strings.dart';

class WishListScreen extends StatelessWidget {
  final String query;

  const WishListScreen({super.key, this.query = ""});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AugmontAppbar(
              canBack: true,
              title: Strings.wishlist,
              actions: [

                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/icons/cart.png", width: 20),
                ),
              ],
            ),
            body: Column(
              children: [
                SizedBox(height: 10,),
                SizedBox(
                    height: 35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.wishlistList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              controller.setWishlist(index);

                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: controller.selectedWishlist ==
                                          controller.wishlistList[index]
                                          ? primaryTextColor
                                          : Colors.grey),
                                ),
                                child: Text("${controller.wishlistList[index]}",
                                    style: TextStyle(
                                      color: controller.selectedWishlist ==
                                          controller.wishlistList[index]
                                          ? primaryTextColor
                                          : Colors.grey,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ))),
                          );
                        })),
                SizedBox(height: 20,),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const ProductDetailScreen(),
                            binding: ProductDetailBinding(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: const ProductGrid(isWishlist: true,),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
