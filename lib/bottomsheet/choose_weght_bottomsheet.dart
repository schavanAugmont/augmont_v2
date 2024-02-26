import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/services/app_session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseWeightBottomSheet extends StatefulWidget {
  const ChooseWeightBottomSheet({super.key});

  @override
  State<ChooseWeightBottomSheet> createState() => _ChooseWeightBottomSheetState();
}

class _ChooseWeightBottomSheetState extends State<ChooseWeightBottomSheet> {

  var weights = ["0.5","1","2","5","10","20"];

  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
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
              child: Text("Choose Weight",style: CustomTheme.style(size: 16,weight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: weights.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10,);
              },
              itemBuilder: (context, index) {
                final item = weights[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: RadioListTile(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedValue,
                    contentPadding: EdgeInsets.zero,
                    activeColor: primaryTextColor,
                    value: item,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = item;
                      });
                      onSet(selectedValue);
                    },
                    title: Text("$item Grams",style: CustomTheme.style(weight: FontWeight.bold),),
                    secondary: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text("=₹${6800*double.parse(item)}",style: CustomTheme.style(size: 12),),
                    ),
                  ),
                );
              },
            ),
          )
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
