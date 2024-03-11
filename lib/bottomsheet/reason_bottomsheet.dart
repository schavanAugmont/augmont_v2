import 'package:augmont_v2/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/themes.dart';

class ReasonBottomSheet extends StatefulWidget {
  const ReasonBottomSheet({super.key});

  @override
  State<ReasonBottomSheet> createState() => _ReasonBottomSheetState();
}

class _ReasonBottomSheetState extends State<ReasonBottomSheet> {

  var reasons = [
    "Changed my mind",
    'Got a better price offer',
    'I don’t need it anymore'
  ];

  var selectedReason;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
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
              child: Text("Specify reason of Cancellation",style: CustomTheme.style(size: 16,weight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: reasons.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10,);
              },
              itemBuilder: (context, index) {
                final item = reasons[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: RadioListTile(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedReason,
                    contentPadding: EdgeInsets.zero,
                    activeColor: primaryTextColor,
                    value: item,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = item;
                      });
                    },
                    title: Text(item,style: CustomTheme.style(weight: FontWeight.bold),),
                  ),
                );
              },
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
            child: EditText(
              controller: TextEditingController(),
              label: "Tell us the reason",
              hint: 'Specify the reason....',
              maxLength: 300,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14,0,14,20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fixedSize: const Size(double.maxFinite, 50)
              ),
              onPressed: () {
                Get.back(result: "");
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
