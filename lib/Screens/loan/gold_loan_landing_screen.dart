import 'package:augmont_v2/Screens/loan/loan_calculator_screen.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/themes.dart';
import '../../widgets/augmont_app_bar.dart';
import '../../widgets/dotted_widget.dart';

class GoldLoanLandingScreen extends StatelessWidget {
  const GoldLoanLandingScreen({super.key});

  static const instruction = <(String,String)>[
    ("Apply For Gold loan","You can instantly apply for a Gold loan through our simple one-click process on Augmont Gold for All"),
    ("Assess Your Gold","Augmont appraiser visits your house, assesses your Gold using the scientific assessment tools"),
    ("Get Your Loan","We disburse your Gold Loan amount to your bank account and take custody of your Gold."),
  ];

  static var features = [
    "Lowest Making\nCharges",
    "With only 10%\ninterest annually",
    "Lowest Monthly\nEMI",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AugmontAppbar(
          canBack: true,
          title: "Loan against gold",
          bottom: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: context.width,
            height: 30,
            color: lightColor,
            child: Row(
              children: [
                Text(
                  "Gold Price",
                  style: CustomTheme.style(size: 12),
                ),
                const Spacer(),
                Text(
                  "₹6,320/gm",
                  style: CustomTheme.style(size: 12, weight: FontWeight.w600),
                ),
                10.w,
                Image.asset("assets/images/ic_increment.png", color: greenColor, width: 16)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 12,
                offset: Offset(0, -4)
              )
            ]
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              fixedSize: const Size(double.maxFinite, 48)
            ),
            onPressed: (){},
            child: const Text("Apply for a Loan"),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Low Interest Gold Loans starting @ 0.74% / ",
                    style: CustomTheme.style(weight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: "month",
                        style: CustomTheme.style(size: 12),
                      )
                    ]
                  ),
                ),
                20.h,
                Container(
                  color: lightColor.withOpacity(0.5),
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: instruction.length,
                    itemBuilder: (context, index) {
                      final model = instruction[index];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  child: Icon(Icons.border_all_rounded, color: Colors.black26),
                                ),
                                Visibility(
                                  visible: instruction.indexOf(model)!=2,
                                  child:const  DottedLine(axis: Axis.vertical, dotCount: 5),
                                ),
                              ],
                            ),
                          ),
                          10.w,
                          Expanded(
                            flex: 8,
                            child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${model.$1}\n',
                                      style: CustomTheme.style(weight: FontWeight.w600).copyWith(
                                        // height: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: model.$2,
                                      style: CustomTheme.style(weight: FontWeight.w500,size: 13),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                20.h,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Features", style: CustomTheme.style(weight: FontWeight.w600)),
                ),
                10.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: features.map((e) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: lightColor,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/lowest.png", width: 40),
                          const SizedBox(height: 12),
                          Text(e, style: CustomTheme.style(size: 12), textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                20.h,
                ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: lightColor),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: lightColor,
                  ),
                  title: Text("Transfer Loans",style: CustomTheme.style(weight: FontWeight.w600),),
                  subtitle: Text("From other banks to Augmont",style: CustomTheme.style(size: 12),),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Transfer Now",style: CustomTheme.style(size: 12,weight: FontWeight.w600),),
                      4.w,
                      const Icon(Icons.keyboard_arrow_right_rounded,size: 16),
                    ],
                  )
                ),
                20.h,
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/coin.png", width: 20),
                          8.w,
                          Text("Calculate your loan",style: CustomTheme.style(weight: FontWeight.w600),),
                        ],
                      ),
                      14.h,
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Enter gold quantity to be loaned e.g. 15 gms',
                                  hintStyle: CustomTheme.style(size: 10,color: Colors.grey.shade200),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  fixedSize: const Size(double.maxFinite, 48),
                                  shape: const RoundedRectangleBorder()
                                ),
                                onPressed: (){
                                  Get.to(()=> const LoanCalculatorScreen());
                                },
                                child: const Text('Calculate'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                30.h,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
