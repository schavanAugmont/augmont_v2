import 'package:augmont_v2/Screens/loan/component/loan_summary_page.dart';
import 'package:augmont_v2/Screens/loan/component/location_page.dart';
import 'package:augmont_v2/Screens/loan/component/personal_address_detail_page.dart';
import 'package:augmont_v2/Screens/loan/component/service_type_page.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bottomsheet/service_not_available_bottomsheet.dart';
import 'package:augmont_v2/controllers/loan_process_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/dotted_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottomsheet/loan_request_success_bottomsheet.dart';

class LoanProcessScreen extends StatelessWidget {
  const LoanProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanProcessController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AugmontAppbar(
            canBack: true,
            title: controller.list[controller.currentIndex].$2.replaceAll("\n", ''),
          ),
          bottomNavigationBar: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fixedSize: const Size(double.maxFinite, 48),
              ),
              onPressed: () {
                if(controller.currentIndex ==3){
                  Get.bottomSheet(const LoanRequestSuccessBottomSheet());
                }else{
                  controller.onPageChanges(controller.currentIndex+=1);
                }

                // Get.bottomSheet(const ServiceNotAvailableBottomSheet());
              },
              child: Text(controller.currentIndex==3?"Register Request":"Proceed"),
            ),
          ),
          body: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 12,
                      left: 10,
                      right: 12,
                      child: LinearProgressIndicator(
                        minHeight: 2,
                        backgroundColor: Colors.black12,
                        color: Colors.black87,
                        value: (controller.currentIndex/(controller.list.length-1)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.list.map((e){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                controller.onPageChanges(e.$1);
                              },
                              child: CircleAvatar(
                                maxRadius: 12,
                                backgroundColor: controller.currentIndex>=e.$1?Colors.black:secondaryTextColor,
                                child: Text('${e.$1+1}',style: CustomTheme.style(color: Colors.white,size: 10,weight: FontWeight.w600),),
                              ),
                            ),
                            4.h,
                            Text(e.$2,style: CustomTheme.style(color: Colors.black87,size: 10,weight: FontWeight.w600),textAlign: TextAlign.center,),
                          ],
                        );
                      }).toList(),
                    )
                  ],
                )
              ),
              Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  allowImplicitScrolling: false,
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PersonalAddressDetailPage(),
                    ServiceTypePage(),
                    LocationPage(),
                    LoanSummaryPage()
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
