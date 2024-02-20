import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';


class RatingBarDetailWidget extends StatelessWidget {
  const RatingBarDetailWidget({super.key, required this.total});
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      color: lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Ratings & Reviews ($total) ',
                  style: CustomTheme.style(size: 16,weight: FontWeight.w600),
                ),
                TextSpan(
                  text:  'Verified Buyers',
                  style: CustomTheme.style(size: 13,weight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height:10),
          Row(
            children: [
              const Expanded(flex: 7, child: Column(
                children: [
                  RatingProgress(fraction: 0.8,start: 5,),
                  RatingProgress(fraction: 0.7,start: 4,),
                  RatingProgress(fraction: 0.5,start: 3,),
                  RatingProgress(fraction: 0.3,start: 2,),
                  RatingProgress(fraction: 0.1,start: 1,),
                ],
              )),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '4.5 ',
                        style: CustomTheme.style(size: 20,weight: FontWeight.w600),
                      ),
                      const WidgetSpan(child: Icon(Icons.star, size: 18)),
                      TextSpan(
                        text: '\nOverall Ratings',
                        style: CustomTheme.style(size: 12,weight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RatingProgress extends StatelessWidget {
  const RatingProgress({super.key, required this.fraction,this.start=1});
  final double fraction;
  final int start;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Text('$start\t', style: CustomTheme.style(size: 10,weight: FontWeight.w500),),
          const Icon(Icons.star, size: 14),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              color: primaryTextColor,
              backgroundColor: Colors.grey.shade50,
              value: fraction,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}