import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/services/app_session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortByBottomSheet extends StatefulWidget {
  const SortByBottomSheet({super.key});

  @override
  State<SortByBottomSheet> createState() => _SortByBottomSheetState();
}

class _SortByBottomSheetState extends State<SortByBottomSheet> {

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
              child: Text("Sort By",style: CustomTheme.style(size: 16,weight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: AppSessionService.instance.sortBy.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10,);
              },
              itemBuilder: (context, index) {
                final item = AppSessionService.instance.sortBy[index];
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
                    title: Text(item,style: CustomTheme.style(weight: FontWeight.bold),),
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
