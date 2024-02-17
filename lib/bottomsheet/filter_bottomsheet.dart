import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/services/app_session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _SortByBottomSheetState();
}

class _SortByBottomSheetState extends State<FilterBottomSheet> {

  double start=10,end=100000;
  var selectedWeight;
  var selectedPurity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height*.85,
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 6,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Filters",style: CustomTheme.style(size: 16,weight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              cacheExtent: 20,
              children: [
                Text("Price Range",style: CustomTheme.style(weight: FontWeight.w600,)),
                RangeSlider(
                  min: 10,
                  max: 100000,
                  divisions: 20,
                  values: RangeValues(start, end),
                  labels: RangeLabels("₹${start.ceil()}", "₹${end.ceil()}"),
                  activeColor: primaryTextColor,
                  inactiveColor: Colors.grey.shade300,
                  onChanged: (value) {
                    setState(() {
                      start = value.start;
                      end = value.end;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("₹${start.ceil()}",style: CustomTheme.style(color: Colors.grey,size: 12,weight: FontWeight.bold),),
                    Text("₹${end.ceil()}",style: CustomTheme.style(color: Colors.grey,size: 12,weight: FontWeight.bold),),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text("Material Weight",style: CustomTheme.style(weight: FontWeight.w600,)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child:ListView(
                    shrinkWrap: true,
                    children: AppSessionService.instance.materialWeights.map((e){
                      return RadioListTile(
                        contentPadding: EdgeInsets.zero,
                          value: e,
                          groupValue: selectedWeight,
                          title: Text(e,style: CustomTheme.style(),),
                          activeColor: primaryTextColor,
                          onChanged: (value) {
                            setState(() {
                              selectedWeight = value;
                            });
                          },
                        );
                      }).toList(),
                  )
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text("Material Purity",style: CustomTheme.style(weight: FontWeight.w600,)),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child:ListView(
                      shrinkWrap: true,
                      children: AppSessionService.instance.materialPurity.map((e){
                        return RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          value: e,
                          groupValue: selectedPurity,
                          title: Text(e,style: CustomTheme.style(),),
                          activeColor: primaryTextColor,
                          onChanged: (value) {
                            setState(() {
                              selectedPurity = value;
                            });
                          },
                        );
                      }).toList(),
                    )
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryTextColor,
              elevation: 0.0,
              fixedSize:  Size(context.width*0.94, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )
            ),
            onPressed: () {
              Get.back(result: {
                "weight":selectedWeight,
                "purity":selectedPurity,
                "rang":"$start:$end"
              });
            },
            child: Text("Apply",style: CustomTheme.style(weight: FontWeight.bold,color: Colors.white),),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }

  void onSet(String sort){
    Future.delayed(const Duration(milliseconds: 400),(){
      Get.back(result: sort);
    });
  }
}
