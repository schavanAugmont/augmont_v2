import 'package:augmont_v2/Screens/Shop/product_list_screen.dart';
import 'package:augmont_v2/bottomsheet/unlease_confirmation_bottomsheet.dart';
import 'package:augmont_v2/package.dart';
import 'package:augmont_v2/widgets/augmont_bottom_app_bar.dart';

import '../../bindings/emi_checkout_binding.dart';
import '../../bindings/shop_emi_binding.dart';
import '../../widgets/augmont_app_bar.dart';
import '../../widgets/rounded_container.dart';
import '../emi/emi_checkout_screen.dart';
import '../emi/emi_landing_screen.dart';

class WithdrawalFromScreen extends StatelessWidget {
  const WithdrawalFromScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AugmontAppbar(
          canBack: true,
          title: "Withdrawal From",
        ),
        bottomNavigationBar: AugmontBottomAppBar(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                )
            ),
            onPressed: () {
              Get.to(
                () => const EmiCheckoutScreen(purpose: Purpose.withdrawal,),
                binding: EmiCheckoutBinding(),
                transition: Transition.rightToLeft,
              );
            },
            child: const Text("Proceed with 8 grams"),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: RoundedContainer(
                margin: const EdgeInsets.all(14),
                padding: const EdgeInsets.all(12),
                borderColor: lightColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RoundedContainer(
                            padding: const EdgeInsets.all(5),
                            backgroundColor: lightColor,
                            child: const RichWeight(label: "Total Gold Required",weight: "10 gms"),
                          ),
                        ),
                        20.w,
                        Expanded(
                          child: RoundedContainer(
                            padding: const EdgeInsets.all(5),
                            backgroundColor: lightColor,
                            child: const RichWeight(label: "Total Gold Available",weight: "10 gms"),
                          ),
                        ),
                      ],
                    ),
                    Text("--------",style: CustomTheme.style(color: secondaryTextColor),),
                    Row(
                      children: [
                        Expanded(
                          child: RoundedContainer(
                            padding: const EdgeInsets.all(5),
                            backgroundColor: lightColor,
                            child: const RichWeight(label: "Total Silver Required",weight: "10 gms"),
                          ),
                        ),
                        20.w,
                        Expanded(
                          child: RoundedContainer(
                            padding: const EdgeInsets.all(5),
                            backgroundColor: lightColor,
                            child: const RichWeight(label: "Total Silver Available",weight: "10 gms"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                    child: RoundedContainer(
                      borderColor: lightColor,
                      radius: BorderRadius.circular(0),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 14,
                            top: 14,
                            child:RoundedContainer(
                              backgroundColor: lightColor,
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text("0.2",style: CustomTheme.style(weight: FontWeight.w600,size: 12),),
                                  Text(" grams",style: CustomTheme.style(size: 12),),
                                  20.w,
                                  Text(" =₹5420",style: CustomTheme.style(size: 12),),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            left: 14,
                            right: 14,
                            bottom: 14,
                            child: Row(
                              children: [
                                Text("Total Value ", style: CustomTheme.style(size: 12)),
                                Text("0.5 Grams", style: CustomTheme.style(size: 12, weight: FontWeight.w600)),
                                const Spacer(),
                                if(index==2)...[
                                  GestureDetector(
                                    onTap: (){
                                      Get.bottomSheet(const UnleaseConfirmationBottomSheet());
                                    },
                                    child: Row(
                                      children: [
                                        Text("Unlock ", style: CustomTheme.style(size: 12,weight: FontWeight.w600)),
                                        const Icon(Icons.keyboard_arrow_right,size: 18,color: Colors.black87,),
                                      ],
                                    ),
                                  )
                                ]else...[
                                  Text("Remaining ", style: CustomTheme.style(size: 12)),
                                  Text("0.5 Grams", style: CustomTheme.style(size: 12, weight: FontWeight.w600)),
                                ],
                              ],
                            ),
                          ),

                          Positioned(
                              left: 14,
                              top: 14,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Education",style: CustomTheme.style(weight: FontWeight.w600),),
                                  6.h,
                                  Text('Monthly Gold SIP',style: CustomTheme.style(),),
                                ],
                              )
                          ),
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
    );
  }
}

class RichWeight extends StatelessWidget {
  final String label;
  final dynamic weight;
  final TextAlign textAlign;
  final double size;
  const RichWeight({super.key,this.size = 14,required this.label,this.weight,this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$label\n",
            style: CustomTheme.style(size: 12,color: Colors.black38).copyWith(
                height: 2
            ),
          ),
          TextSpan(
            text: "$weight",
            style: CustomTheme.style(size: size,weight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}