import 'package:augmont_v2/Screens/emi/emi_detail_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/shop_emi_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/dotted_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiLandingScreen extends StatelessWidget {
  const EmiLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopEMIController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Book on EMI",
            ),
            body: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Illustration explaining each step\nmentioned below (one by one)",
                    style: CustomTheme.style(size: 12),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Features", style: CustomTheme.style(weight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.features.map((e) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: lightColor,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/lowest.png", width: 40),
                          const SizedBox(height: 12),
                          Text(e, style: CustomTheme.style(size: 12), textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Text("How it works", style: CustomTheme.style(size: 16, weight: FontWeight.w600)),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.instruction.length,
                  itemBuilder: (context, index) {
                    final model = controller.instruction[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.border_all_rounded,color: lightColor),
                              Visibility(
                                visible: controller.instruction.indexOf(model)!=3,
                                child:const  DottedLine(axis: Axis.vertical, dotCount: 6),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${model.$1}\n',
                                  style: CustomTheme.style(weight: FontWeight.w600).copyWith(
                                    height: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text: model.$2,
                                  style: CustomTheme.style(weight: FontWeight.w500,size: 13),
                                ),
                              ]
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: GestureDetector(
              onTap: (){
                Get.to(()=> const EmiDetailScreen(),transition: Transition.rightToLeft);
              },
              child: Container(
                height: 58,
                width: double.maxFinite,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.all(12),
                color: Colors.black87,
                alignment: Alignment.center,
                child: Text("Proceed to Book",style: CustomTheme.style(size: 16,color: Colors.white,weight: FontWeight.w600),),
              ),
            ),
          ),
        );
      },
    );
  }
}

