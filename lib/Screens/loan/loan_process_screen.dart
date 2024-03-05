import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/loan_process_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/dotted_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanProcessScreen extends StatelessWidget {
  const LoanProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanProcessController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: const AugmontAppbar(
            canBack: true,
            title: "Loan",
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
              onPressed: () {},
              child: const Text("Proceed"),
            ),
          ),
          body: Column(
            children: [
              Container(
                // height: 70,
                width: double.maxFinite,
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 12,
                      left: 0,
                      right: 0,
                      child: LinearProgressIndicator(
                        minHeight: 2,
                        backgroundColor: Colors.black12,
                        color: Colors.black87,
                        value: (controller.currentIndex/(controller.list.length-1))-0.29,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.list.map((e){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                controller.currentIndex = e.$1;
                                controller.update();
                              },
                              child: CircleAvatar(
                                maxRadius: 14,
                                backgroundColor: Colors.black,
                                child: Text('${e.$1}',style: CustomTheme.style(color: Colors.white,size: 10,weight: FontWeight.w600),),
                              ),
                            ),
                            Text('',style: CustomTheme.style(color: Colors.black87,size: 10,weight: FontWeight.w600),textAlign: TextAlign.center,),
                          ],
                        );
                      }).toList(),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      );
    });
  }
}
