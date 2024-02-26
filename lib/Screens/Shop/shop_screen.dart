import 'package:augmont_v2/Screens/Shop/product_list_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bindings/product_binding.dart';
import 'package:augmont_v2/bottomsheet/search_bottomsheet.dart';
import 'package:augmont_v2/controllers/shop_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/category_widget.dart';
import 'package:augmont_v2/widgets/hot_selling_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShopScreen extends StatelessWidget{
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Scaffold(
              appBar: AugmontAppbar(
                canBack: false,
                title: "AUGMONT",
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        const SearchBottomSheet(),
                        isScrollControlled: true,
                      ).then((value){
                        if(value!=null){
                          Get.to(
                            () => ProductListScreen(query: value,),
                            binding: ProductBinding(),
                            transition: Transition.rightToLeft,
                          );
                        }
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
              body: GestureDetector(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: controller.list.map((e) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: lightColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 180,
                          initialPage: 0,
                          viewportFraction: 0.90,
                          onPageChanged: (index, reason) {
                            controller.onCarouselPageChange(index);
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Obx(
                        () => Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.list.map((e){
                              return Container(
                                margin: const EdgeInsets.only(right: 4),
                                height: 4,
                                width: controller.list.indexOf(e)==controller.currentCarouselIndex.value?20:8,
                                decoration: BoxDecoration(
                                  color: controller.list.indexOf(e)==controller.currentCarouselIndex.value?Colors.grey:lightColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Product Categories",style: CustomTheme.style(weight: FontWeight.w600,)),
                      ),
                      const SizedBox(height: 14,),
                      SizedBox(
                          height: 160.0,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 12,);
                              },
                              itemBuilder: (_, int index) {
                                return const CategoryWidget();
                              },
                          ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 160,
                        width: double.maxFinite,
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: lightColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Stack(
                          clipBehavior: Clip.hardEdge,
                          children: [
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child:Image.asset("assets/images/ellipse.png"),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child:Image.asset("assets/images/line.png"),
                            ),
                            Positioned(
                              right: 24,
                              top: 0,
                              bottom: 0,
                              child:Image.asset("assets/images/coin.png",width: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "New",
                                    style: CustomTheme.style(color: Colors.redAccent, weight: FontWeight.w600, size: 12).copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Shri Ram Mandir Coin",
                                    style: CustomTheme.style(weight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Auspicious gift on the eve of\n building a legacy",
                                    style: CustomTheme.style(weight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      //
                                      Text(
                                        "Buy limited edition",
                                        style: CustomTheme.style(weight: FontWeight.w600),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(Icons.keyboard_arrow_right_rounded,size: 18,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Hot Selling Products",style: CustomTheme.style(weight: FontWeight.w600,)),
                      ),
                      const SizedBox(height: 14,),
                      SizedBox(
                        height: 200.0,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 12,);
                          },
                          itemBuilder: (_, int index) {
                            return const HotSellingWidget();
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: lightColor,width: 1)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: lightColor,
                                    maxRadius: 30,
                                    child: Image.asset("assets/images/gold_bar.png",width: 30,),
                                  ),
                                  const SizedBox(width: 20,),
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Book Gold at today’s price !\n",
                                                style: CustomTheme.style(size: 15,weight: FontWeight.bold)
                                            ),
                                            TextSpan(
                                              text: "Save on future Gold purchase by booking it at todays price",
                                              style: CustomTheme.style(
                                                size: 13
                                              )
                                            ),
                                          ]
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: lightColor,
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(8.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text("Explore Products",style: CustomTheme.style(color: Colors.black,weight: FontWeight.w600),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}