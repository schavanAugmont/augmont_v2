import 'package:augmont_v2/Screens/emi/emi_landing_screen.dart';
import 'package:augmont_v2/Screens/offer/offer_screen.dart';
import 'package:augmont_v2/Screens/review/review_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bindings/offer_binding.dart';
import 'package:augmont_v2/bindings/review_binding.dart';
import 'package:augmont_v2/bindings/shop_emi_binding.dart';
import 'package:augmont_v2/bottomsheet/choose_weght_bottomsheet.dart';
import 'package:augmont_v2/controllers/product_detail_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/offer_grid.dart';
import 'package:augmont_v2/widgets/price_widget.dart';
import 'package:augmont_v2/widgets/rating_bar_detail_widget.dart';
import 'package:augmont_v2/widgets/rating_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/product_grid.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AugmontAppbar(
              canBack: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 20, color: primaryTextColor),
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
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              clipBehavior: Clip.none,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: lightColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          height: 180,
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/pay.png", width: 20),
                                        const SizedBox(width: 2),
                                        Text(
                                          "Pay via DigiGold",
                                          style: CustomTheme.style(size: 10, weight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: const Icon(Icons.favorite_border, size: 18),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [1, 2, 3, 4]
                                      .map((e) => Container(
                                            margin: const EdgeInsets.only(right: 4),
                                            height: 4,
                                            width: e == 1 ? 24 : 10,
                                            decoration: BoxDecoration(
                                              color: e == 1 ? Colors.black38 : Colors.black12,
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              "Augmont 0.1Gm Gold Coin (999 Purity)",
                              style: CustomTheme.style(weight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Text(
                              "4.3",
                              style: CustomTheme.style(weight: FontWeight.w600,size: 12),
                            ),
                            const SizedBox(width: 3),
                            const Icon(Icons.star,size: 16)
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const PriceWidget(
                              price: "12,500",
                              offerPrice: "11,500",
                              offerPercentage: "10",
                              priceSize: 16,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "EMI start from just\n",
                                      style: CustomTheme.style(size: 10).copyWith(
                                        height: 1.5
                                      ),
                                    ),
                                    TextSpan(
                                      text: "₹1000/",
                                      style: CustomTheme.style(size: 16,weight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "month",
                                      style: CustomTheme.style(size: 10),
                                    ),
                                  ]
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "MRP inclusive of all taxes",
                          style: CustomTheme.style(size: 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: lightColor),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choose weight",style: CustomTheme.style(weight: FontWeight.w600,)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: ["0.5 Grams","1 Grams","2 Grams","10+ Options"].map((e){
                            return GestureDetector(
                              onTap: (){
                                if(e.contains("+")){
                                  Get.bottomSheet(const ChooseWeightBottomSheet()).then((value){
                                    if(value!=null){
                                      controller.selectedWeight = "${value} Grams";
                                      controller.update();
                                    }
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                  color: controller.selectedWeight == e ? primaryTextColor : null,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: lightColor),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: CustomTheme.style(
                                    color: controller.selectedWeight == e ? Colors.white : Colors.black54,
                                    weight: FontWeight.w600,
                                    size: 12
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Product properties",style: CustomTheme.style(weight: FontWeight.w600,)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        rich("AU999GC001G", "SKU"),
                        Container(
                          color: Colors.grey.shade300,
                          width: 1,
                          height: 30,
                        ),
                        rich("Gold", "Material Type"),
                        Container(
                          color: Colors.grey.shade300,
                          width: 1,
                          height: 30,
                        ),
                        rich("999(24K)", "Material Purity"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: lightColor),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Book Gold at today’s price !",style: CustomTheme.style(weight: FontWeight.bold,)),
                        const SizedBox(height: 10),
                        lable("Lowest Interest Rate"),
                        lable("Flexible Paying Options"),
                        lable("Lowest Making Charged"),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: lightColor,
                            border: Border.all(color: Colors.black12)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "EMIs from just ",
                                      style: CustomTheme.style(size: 12),
                                    ),
                                    TextSpan(
                                      text: "₹1000/",
                                      style: CustomTheme.style(size: 14,weight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "month",
                                      style: CustomTheme.style(size: 12),
                                    ),
                                  ]
                                ),
                              ),
                              Text(
                                "Book Now",
                                style: CustomTheme.style(color: Colors.black54, size: 12, weight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Offers",style: CustomTheme.style(weight: FontWeight.w600)),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> const OfferScreen(),binding: OfferBinding(),transition: Transition.rightToLeft);
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(text: "View All", style: CustomTheme.style(weight: FontWeight.w600)),
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(Icons.keyboard_arrow_right_rounded, size: 18, color: primaryTextColor),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 190,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 12);
                      },
                      itemBuilder: (context, index) {
                        return const OfferGrid();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: lightColor),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivery for",style: CustomTheme.style(weight: FontWeight.w600,)),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: lightColor,
                              border: Border.all(color: Colors.black12)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "401105",
                                style: CustomTheme.style(color: Colors.black54, size: 14, weight: FontWeight.w600),
                              ),
                              Text(
                                "Check",
                                style: CustomTheme.style(color: Colors.black87, size: 12, weight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline_rounded,color: Colors.black54),
                            const SizedBox(width: 4),
                            Text(
                              "Get it delivered by 12th Nov",
                              style: CustomTheme.style( size: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: lightColor,
                        border: Border.all(color: Colors.black12)
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/target.png",width: 28,),
                        Text(
                          "Invest towards this product",
                          style: CustomTheme.style(color: Colors.black87, size: 14, weight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          "Set as Target",
                          style: CustomTheme.style(color: Colors.black87, size: 12, weight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Recommended",style: CustomTheme.style(weight: FontWeight.w600,)),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const ProductGrid(isWishlist: false,);
                    },
                  ),
                  const SizedBox(height: 20),
                  Text("Goes Well With",style: CustomTheme.style(weight: FontWeight.w600,)),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const ProductGrid(isWishlist: false,);
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87)
                    ),
                    child: Row(
                      children: [
                        Text(
                          "₹57,000",
                          style: CustomTheme.style(color: Colors.black87, size: 14, weight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          "View Price Breakdown",
                          style: CustomTheme.style(color: Colors.black87, size: 12, weight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: lightColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/verify.png",height: 28,),
                            const SizedBox(height: 6),
                            Text("BIS Hallmarked",style: CustomTheme.style(size: 12,weight: FontWeight.w600),)
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          color: lightColor,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/certificate.png",width: 40,),
                            const SizedBox(height: 6),
                            Text("BIS Hallmarked",style: CustomTheme.style(size: 12,weight: FontWeight.w600),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: lightColor,
                        border: Border.all(color: Colors.black12)
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/return.png",width: 28),
                        const SizedBox(width: 6),
                        Text(
                          "Hassle free 4 days ",
                          style: CustomTheme.style(color: Colors.black87, size: 14, weight: FontWeight.w500),
                        ),
                        Text(
                          "return & exchange",
                          style: CustomTheme.style(color: Colors.black87, size: 14, weight: FontWeight.w500).copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const RatingBarDetailWidget(total: 890),

                  const SizedBox(height: 20),
                  const RatingTile(
                    images: ["1","2","3","4"],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> const ReviewScreen(),binding: ReviewBinding(),transition: Transition.rightToLeft);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                      ),
                      child: Text("View All Reviews",style: CustomTheme.style(size: 14,weight: FontWeight.w600),),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: Offset(0, -4)
                  )
                ]
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Image.asset("assets/icons/cart.png",width: 24,),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(()=> const EmiLandingScreen(),binding: ShopEMIBinding(),transition: Transition.rightToLeft);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Text("Book on EMI",style: CustomTheme.style(weight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text("Buy Now",style: CustomTheme.style(weight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget rich(String value,String lable){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$value\n",
            style: CustomTheme.style(weight: FontWeight.w600).copyWith(
              height: 2,
            ),
          ),
          TextSpan(
            text: lable,
            style: CustomTheme.style(size: 12),
          ),
        ],
      ),
    );
  }
  
  Widget lable(String value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: lightColor,
            maxRadius: 16,
            child: const Icon(Icons.percent_rounded,size: 16,color: Colors.black26,),
          ),
          const SizedBox(width: 10),
          Text(value,style: CustomTheme.style(size: 10),),
        ],
      ),
    );
  }
}
