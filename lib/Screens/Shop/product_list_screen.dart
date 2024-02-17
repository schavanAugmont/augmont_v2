import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bottomsheet/filter_bottomsheet.dart';
import 'package:augmont_v2/bottomsheet/sory_by_bottomsheet.dart';
import 'package:augmont_v2/controllers/product_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottomsheet/search_bottomsheet.dart';

class ProductListScreen extends StatelessWidget {
  final String query;

  const ProductListScreen({super.key, this.query = ""});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AugmontAppbar(
              canBack: true,
              title: query.isEmpty ? "Augmont" : query,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(const SearchBottomSheet(), isScrollControlled: true).then((value) {

                    });
                  },
                  icon: Image.asset("assets/icons/search.png", width: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/icons/favorite.png", width: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/icons/cart.png", width: 20),
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          Get.bottomSheet(const SortByBottomSheet()).then((value){
                            if(value!=null){
                              controller.sortBy(value);
                              controller.update();
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(color: lightColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.sort_rounded,size: 18,color: primaryTextColor,),
                              const SizedBox(width: 4,),
                              Text(controller.sortBy.toUpperCase(),style: CustomTheme.style(size: 12,weight: FontWeight.w600),),
                              const SizedBox(width: 4,),
                              const Icon(Icons.keyboard_arrow_down,size: 18,color: primaryTextColor,),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          Get.bottomSheet(const FilterBottomSheet(),isScrollControlled: true).then((value){

                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(color: lightColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.filter_alt_outlined,size: 18,color: primaryTextColor,),
                              const SizedBox(width: 4,),
                              Text("filter".toUpperCase(),style: CustomTheme.style(size: 12,weight: FontWeight.w600),),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 34,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(6.0)
                  ),
                  child: TabBar(
                    controller: controller.tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:primaryTextColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    dividerHeight: 0,
                    tabs: const [
                      Tab(text: "All",),
                      Tab(text: "Gold",),
                      Tab(text: "Silver",),
                    ],
                  ),
                ),
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
                      return const ProductGrid();
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
