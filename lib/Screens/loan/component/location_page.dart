import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/controllers/loan_process_controller.dart';
import 'package:augmont_v2/widgets/augmont_store_tile.dart';
import 'package:augmont_v2/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Utils/themes.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanProcessController>(
      builder: (controller) {
        if(controller.selectedServiceType == "Branch"){
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Select Branch",style: CustomTheme.style(weight: FontWeight.w600),),
                  subtitle: Text("For your selected service type, select a branch ",style: CustomTheme.style(size: 10),),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: lightColor),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search for specific location",
                            hintStyle: CustomTheme.style(size: 13,color: secondaryTextColor)
                          ),
                        ),
                      ),
                      Icon(Icons.search,color: primaryTextColor,)
                    ],
                  ),
                ),
                10.h,
                AugmontStoreTile(selected: true,),
                10.h,
                AugmontStoreTile(),
                10.h,
                AugmontStoreTile(),
                10.h,
                AugmontStoreTile(),
              ],
            ),
          );
        }else if(controller.selectedServiceType == "Home"){
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Add Address",style: CustomTheme.style(weight: FontWeight.w600),),
                  subtitle: Text("Agent will visit you on the mentioned Address ",style: CustomTheme.style(size: 10),),
                ),

                EditText(
                  controller: controller.address1Controller,
                  hint: "Thane west, 401105",
                  label: "Address Line 1",
                  isRequired: true,
                ),
                10.h,
                EditText(
                  controller: controller.address2Controller,
                  hint: "Road ",
                  label: "Address Line 2",
                ),
                10.h,
                EditText(
                  controller: controller.address3Controller,
                  hint: "",
                  label: "Address Line 3",
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Book Date and Time",style: CustomTheme.style(weight: FontWeight.w600),),
                  subtitle: Text("Agent will visit you on the selected date and time",style: CustomTheme.style(size: 10),),
                ),
                EditText(
                  controller: controller.dateController,
                  hint: "01/01/2024",
                  label: "Select Date",
                  isRequired: true,
                  isDropDown: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    ).then((value){
                      if(value!=null){
                        controller.dateController.text = DateFormat("dd/MM/yyyy").format(value);
                        controller.update();
                      }
                    });
                  },
                ),
                10.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Select Time",style: CustomTheme.style(weight: FontWeight.w600,size: 13)),
                    const SizedBox(width: 2),
                    Text("*",style: CustomTheme.style(size: 16,color: Colors.red,weight: FontWeight.w600),)
                  ],
                ),
                10.h,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.timeSlot.length,
                  itemBuilder: (context, index) {
                    final item = controller.timeSlot[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: lightColor)
                      ),
                      child: RadioListTile(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        groupValue: controller.selectedSlot,
                        contentPadding: EdgeInsets.zero,
                        activeColor: primaryTextColor,
                        value: item,
                        onChanged: (value) {
                          controller.selectedSlot = value;
                          controller.update();
                        },
                        title: Text("$item",style: CustomTheme.style(weight: FontWeight.w500),),
                      ),
                    );
                },),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
