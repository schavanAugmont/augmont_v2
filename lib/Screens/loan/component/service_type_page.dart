import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/controllers/loan_process_controller.dart';
import 'package:augmont_v2/widgets/augmont_store_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/themes.dart';

class ServiceTypePage extends StatelessWidget {
  const ServiceTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanProcessController>(
      builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Select service Type",style: CustomTheme.style(weight: FontWeight.w600),),
                subtitle: Text("For your entered location both type of services are available",style: CustomTheme.style(size: 10),),
              ),
              20.h,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: 160,
                            decoration: BoxDecoration(
                              color: lightColor,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8.0),
                              )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Visit Home",style: CustomTheme.style(weight: FontWeight.bold),),
                                20.h,
                                Image.asset("assets/images/coin.png",width: 60,),
                              ],
                            ),
                          ),
                          Radio(
                            value: "Home",
                            groupValue: controller.selectedServiceType,
                            activeColor: primaryTextColor,
                            onChanged: (value) {
                              controller.selectedServiceType = value;
                              controller.update();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.w,
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: 160,
                            decoration: BoxDecoration(
                                color: lightColor,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8.0),
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Visit Branch",style: CustomTheme.style(weight: FontWeight.bold),),
                                20.h,
                                Image.asset("assets/images/coin.png",width: 60,),
                              ],
                            ),
                          ),
                          Radio(
                            value: "Branch",
                            groupValue: controller.selectedServiceType,
                            activeColor: primaryTextColor,
                            onChanged: (value) {
                              controller.selectedServiceType = value;
                              controller.update();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // if(controller.selectedServiceType == 'Branch')...[
              //   Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 10),
              //     child: Text("Nearest Augmont Store to the your location",style: CustomTheme.style(size: 10),),
              //   ),
              //],

            ],
          ),
        );
      },
    );
  }
}
