import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';

class AugmontStoreTile extends StatelessWidget {
  final bool selected;
  const AugmontStoreTile({super.key,this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: lightColor,
      child: InkWell(
        onTap: (){

        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryTextColor),
                  ),
                  child: selected?CircleAvatar(backgroundColor: primaryTextColor):null,
                ),
              ),
              5.h,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    maxRadius: 16,
                    child: Icon(Icons.check_box_outline_blank_rounded),
                  ),
                  10.w,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Augmont Store",
                          style: CustomTheme.style(weight: FontWeight.w600),
                        ),
                        4.h,
                        Text(
                          "1234 NW Bobcat Lane, St. Robert, MO 65584-5678.",
                          style: CustomTheme.style(weight: FontWeight.w500,size: 13),
                        ),
                        4.h,
                        Text(
                          "Get Direction",
                          style: CustomTheme.style(weight: FontWeight.w600,size: 12),
                        ),
                      ],
                    ),
                  ),
                  Text("10 KM away", style: CustomTheme.style(size: 10)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
