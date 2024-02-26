import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/controllers/review_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/rating_bar_detail_widget.dart';
import 'package:augmont_v2/widgets/rating_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/themes.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "",
            ),
            body: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: RatingBarDetailWidget(total: 890,),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "Customers Said",
                      style: CustomTheme.style(size: 16, weight: FontWeight.w600),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Remember, investing in gold involves risk, and it's important to conduct thorough research or consult with a financial advisor before making any investment decisions. Always be cautious.",
                      style: CustomTheme.style(size: 14, weight: FontWeight.w500),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(color: Colors.green,width: 1)
                            ),
                            child: Text("Good Packaging",style: CustomTheme.style(size: 12,weight: FontWeight.w600,color: Colors.green),),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(color: Colors.green,width: 1)
                            ),
                            child: Text("On-time Delivery",style: CustomTheme.style(size: 12,weight: FontWeight.w600,color: Colors.green),),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(color: Colors.green,width: 1)
                            ),
                            child: Text("Authentic",style: CustomTheme.style(size: 12,weight: FontWeight.w600,color: Colors.green),),
                          ),
                        ],
                      ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.only(top: 12),
                    color: lightColor,
                    height: 1,
                    width: double.maxFinite,
                  ),
                ),
                SliverAppBar(
                  leading: const SizedBox.shrink(),
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  titleSpacing: 0,
                  leadingWidth: 12,
                  expandedHeight: 150,
                  collapsedHeight: 150,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  shadowColor: Colors.black12,
                  flexibleSpace: Container(
                    height: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Filter review by",style: CustomTheme.style(size: 14,weight: FontWeight.w600),),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: ["All","1","2","3","4","5"].map((e){
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                              constraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40
                              ),
                              decoration:  BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              alignment: Alignment.center,
                              child: Text(e,style: CustomTheme.style(size: 16,weight: FontWeight.w600),),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: lightColor)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.sort_rounded,size: 18,),
                              const SizedBox(width: 10),
                              Text("Filter",style: CustomTheme.style(size: 14,weight: FontWeight.w500),),
                              const Spacer(),
                              const Icon(Icons.keyboard_arrow_down_rounded,size: 20,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 14,
                      color: lightColor,
                      width: double.maxFinite,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RatingTile(images: index.isEven?["1","2","3"]:[],),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
