import 'package:augmont_v2/Screens/loan/loan_process_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/bindings/loan_process_binding.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanCalculatorScreen extends StatefulWidget {
  const LoanCalculatorScreen({super.key});

  @override
  State<LoanCalculatorScreen> createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {

  var table = [
    ("Scheme 1","0.1%","₹500 / 1% or the loan amount\n(whichever is minimum)"),
    ("Scheme 2","0.2%","₹600 / 1% or the loan amount\n(whichever is minimum)"),
    ("Scheme 2","0.3%","₹700 / 1% or the loan amount\n(whichever is minimum)"),
  ];

  var amountValue = 10000.0.obs;
  var monthValue = 3.0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AugmontAppbar(
          canBack: true,
          title: "Loan Calculator",
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
                offset: Offset(0, -4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              fixedSize: const Size(double.maxFinite, 48),
            ),
            onPressed: () {
              Get.to(()=> const LoanProcessScreen(),binding: LoanProcessBinding(),transition: Transition.rightToLeft);
            },
            child: const Text("Apply for a Loan"),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black12, width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Gold Quantity required",
                      style: CustomTheme.style(size: 12, color: Colors.black54),
                    ),
                    6.h,
                    Text(
                      "50 gms",
                      style: CustomTheme.style(size: 18, weight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              20.h,
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Applicable Schemes", style: CustomTheme.style(weight: FontWeight.w600)),
              ),
              10.h,
              Container(
                color: lightColor,
                child: Table(
                  columnWidths: const {
                    0: IntrinsicColumnWidth(),
                    1: IntrinsicColumnWidth(),
                    2: FlexColumnWidth(7),
                  },
                  border: TableBorder.all(
                    color: Colors.black12,
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Scheme Name",
                              style: CustomTheme.style(color: Colors.white, weight: FontWeight.w600, size: 12),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Rate of Interest",
                              style: CustomTheme.style(color: Colors.white, weight: FontWeight.w600, size: 12),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Processing Fee",
                              style: CustomTheme.style(color: Colors.white, weight: FontWeight.w600, size: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...table.map((e){
                      return TableRow(
                        children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.$1,style: CustomTheme.style(size: 12,weight: FontWeight.w600)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.$2, style: CustomTheme.style(size: 12, weight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.$3,style: CustomTheme.style(size: 10,weight: FontWeight.w600)),
                        ),
                        ]
                      );
                    }).toList()
                  ],
                ),
              ),
              20.h,
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Amount(In ₹)", style: CustomTheme.style(weight: FontWeight.w600)),
              ),
              Obx(
                 () {
                  return Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Slider(
                              value: amountValue.value,
                              min: 10000,
                              max: 100000,
                              divisions: 10,
                              label: amountValue.toStringAsFixed(1),
                              activeColor: primaryTextColor,
                              inactiveColor: Colors.black12,
                              onChanged: (value) {
                                amountValue(value);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("₹10,000",style: CustomTheme.style(size: 10,color: Colors.black38),),
                                Text("₹1,00,000",style: CustomTheme.style(size: 10,color: Colors.black38),),
                              ],
                            )
                          ],
                        ),
                      ),
                      10.w,
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: lightColor)
                          ),
                          child: Row(
                            children: [
                            Text("₹",style: CustomTheme.style(size: 16,color: Colors.black54)),
                            const Spacer(),
                            Text(amountValue.toStringAsFixed(0),style: CustomTheme.style(size: 14,weight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
              ),
              10.h,
              20.h,
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Tenure(In Month)", style: CustomTheme.style(weight: FontWeight.w600)),
              ),
              Obx(
                  () {
                    return Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Slider(
                                value: monthValue.value,
                                min: 1,
                                max: 12,
                                divisions: 12,
                                label: monthValue.toStringAsFixed(0),
                                activeColor: primaryTextColor,
                                inactiveColor: Colors.black12,
                                onChanged: (value) {
                                  if(value<2) return;
                                  monthValue(value);
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("1 Month",style: CustomTheme.style(size: 10,color: Colors.black38),),
                                  Text("12 Month",style: CustomTheme.style(size: 10,color: Colors.black38),),
                                ],
                              )
                            ],
                          ),
                        ),
                        10.w,
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: lightColor)
                            ),
                            child: Row(
                              children: [
                                Text("Month",style: CustomTheme.style(size: 12,color: Colors.black54)),
                                const Spacer(),
                                Text(monthValue.toStringAsFixed(0),style: CustomTheme.style(size: 14,weight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
              ),
              10.h,
            ],
          ),
        ),
      ),
    );
  }
}
