import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final bool primary;
  const AddressTile({super.key,this.primary=false,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: lightColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: lightColor,
                          borderRadius: BorderRadius.circular(4.0)
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/ic_home.png",width: 20,),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vanshika Singhal",
                            style: CustomTheme.style(weight: FontWeight.w600),
                          ),
                          Text(
                            "+91 98765432210",
                            style: CustomTheme.style(weight: FontWeight.w600, size: 12),
                          ),
                          Text(
                            "1234 NW Bobcat Lane, St. Robert, MO 65584-5678.",
                            style: CustomTheme.style(size: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(8.0),
                  )
                ),
                alignment: Alignment.center,
                child: Text("Edit",style: CustomTheme.style(size: 12,weight: FontWeight.w600),),
              )
            ],
          ),
          if(primary)
          const Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.check_circle_outline_rounded,color: primaryTextColor,size: 20,),
            ),
          )
        ],
      ),
    );
  }
}
