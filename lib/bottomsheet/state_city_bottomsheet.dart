import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateCityBottomSheet extends StatefulWidget {
  final List<String> data;
  const StateCityBottomSheet({super.key,this.data = const []});

  @override
  State<StateCityBottomSheet> createState() => _StateCityBottomSheetState();
}

class _StateCityBottomSheetState extends State<StateCityBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.60,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        )
      ),
      child: Column(
        children: [
          Container(
            height: 6,
            width: 60,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(3)
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.search,size: 20,color: Colors.black26,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "Search here...",
                      hintStyle: CustomTheme.style(
                        color: Colors.black54,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 6)
                    ),
                  ),
                ),
                Icon(Icons.clear,color: Colors.black26,size: 20,),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    Get.back(result: widget.data[index]);
                  },
                  title: Text(widget.data[index],style: CustomTheme.style(weight: FontWeight.w600),),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
