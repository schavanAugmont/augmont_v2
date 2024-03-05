import 'package:augmont_v2/Screens/loan/gold_loan_landing_screen.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/themes.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExchangeScreenState();
  }
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  var list = ['Loan against gold', 'Sell Old Gold', 'Physical to Digital Gold'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AugmontAppbar(
          canBack: false,
          title: "Augmont",
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/notification.png", width: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/gift.png", width: 20),
            ),
          ],
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverList.builder(
                itemCount: 1,
                itemBuilder: (context, index) {},
              ),
              SliverList.separated(
                itemCount: 3,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return Material(
                    color: lightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: InkWell(
                       borderRadius: BorderRadius.circular(8.0),
                      onTap: (){
                         Get.to(()=> const GoldLoanLandingScreen(),transition: Transition.rightToLeft);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(maxRadius: 20, backgroundColor: Colors.black26),
                            10.h,
                            Text(
                              list[index],
                              style: CustomTheme.style(weight: FontWeight.w600),
                            ),
                            6.h,
                            Text(
                              'Invest in gold to earn 5% interest annually. Withdraw anytime, without any hassle. Interest adds up from day 1 of your investment',
                              style: CustomTheme.style(weight: FontWeight.w500, size: 12),
                            ),
                            10.h,
                            Row(
                              children: [
                                Text("Get Started",style: CustomTheme.style(size: 12,weight: FontWeight.w600),),
                                4.w,
                                const Icon(Icons.keyboard_arrow_right_rounded,size: 16),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
