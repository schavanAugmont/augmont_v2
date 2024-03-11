import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/loan_process_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanSummaryPage extends StatelessWidget {
  const LoanSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanProcessController>(
      builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                title: Text("Personal and Address Details",style: CustomTheme.style(weight: FontWeight.w600,),),
                backgroundColor: lightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.black26,width: 1)
                ),
                collapsedBackgroundColor: lightColor,
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                children: [
                  ListTile(
                    title: Text("Name",style: CustomTheme.style(),),
                    subtitle: Text("Vanshika Singhal",style: CustomTheme.style(weight: FontWeight.w600),),
                    trailing: Image.asset("assets/icons/edit.png",width: 20,),
                  ),
                  ListTile(
                    title: Text("Mobile Number",style: CustomTheme.style(),),
                    subtitle: Text("+91-9876543210",style: CustomTheme.style(weight: FontWeight.w600),),
                    trailing: Image.asset("assets/icons/edit.png",width: 20,),
                  ),
                  ListTile(
                    title: Text("Pin-code",style: CustomTheme.style(),),
                    subtitle: Text("400011",style: CustomTheme.style(weight: FontWeight.w600),),
                    trailing: Image.asset("assets/icons/edit.png",width: 20,),
                  ),
                  ListTile(
                    title: Text("City",style: CustomTheme.style(),),
                    subtitle: Text("Mumbai",style: CustomTheme.style(weight: FontWeight.w600),),
                    trailing: Image.asset("assets/icons/edit.png",width: 20,),
                  ),
                  ListTile(
                    title: Text("State",style: CustomTheme.style(),),
                    subtitle: Text("Maharashtra",style: CustomTheme.style(weight: FontWeight.w600),),
                    trailing: Image.asset("assets/icons/edit.png",width: 20,),
                  ),
                ],
              ),

              20.h,
              ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                title: Text("Service Type",style: CustomTheme.style(weight: FontWeight.w600,),),
                backgroundColor: lightColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.black26,width: 1)
                ),
                collapsedBackgroundColor: lightColor,
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                children: [
                  ListTile(
                    title: Text("${controller.selectedServiceType} Visit",style: CustomTheme.style(weight: FontWeight.w600),),
                    trailing: Image.asset("assets/icons/edit.png",width: 20,),
                  ),
                ],
              ),

              20.h,
              if(controller.selectedServiceType == 'Home')...[
                ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                  title: Text("Address Detail",style: CustomTheme.style(weight: FontWeight.w600,),),
                  backgroundColor: lightColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Colors.black26,width: 1)
                  ),
                  collapsedBackgroundColor: lightColor,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  children: [
                    ListTile(
                      title: Text("Address",style: CustomTheme.style(),),
                      subtitle: Text(
                        "${controller.address1Controller.text} ${controller.address2Controller.text} ${controller.address3Controller.text}",
                        style: CustomTheme.style(weight: FontWeight.w600),
                      ),
                      trailing: Image.asset("assets/icons/edit.png",width: 20,),
                    ),
                  ],
                ),
                20.h,
                ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                  title: Text("Book Date & Time",style: CustomTheme.style(weight: FontWeight.w600,),),
                  backgroundColor: lightColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Colors.black26,width: 1)
                  ),
                  collapsedBackgroundColor: lightColor,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  children: [
                    ListTile(
                      title: Text("Date",style: CustomTheme.style(),),
                      subtitle: Text("${controller.dateController.text}",style: CustomTheme.style(weight: FontWeight.w600),),
                      trailing: Image.asset("assets/icons/edit.png",width: 20,),
                    ),
                    ListTile(
                      title: Text("Time",style: CustomTheme.style(),),
                      subtitle: Text("${controller.selectedSlot}",style: CustomTheme.style(weight: FontWeight.w600),),
                      trailing: Image.asset("assets/icons/edit.png",width: 20,),
                    ),
                  ],
                ),
              ],

              if(controller.selectedServiceType == 'Branch')...[
                ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                  title: Text("Selected Branch",style: CustomTheme.style(weight: FontWeight.w600,),),
                  backgroundColor: lightColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Colors.black26,width: 1)
                  ),
                  collapsedBackgroundColor: lightColor,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  children: [
                    ListTile(
                      title: Text("${controller.selectedServiceType} Visit",style: CustomTheme.style(weight: FontWeight.w600),),
                      trailing: Image.asset("assets/icons/edit.png",width: 20,),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
