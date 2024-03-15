import 'package:augmont_v2/package.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/rounded_container.dart';

final status = [Icons.check_circle, Icons.check_circle, Icons.local_shipping_outlined];
class WithdrawalOrderDetailScreen extends StatelessWidget {
  const WithdrawalOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AugmontAppbar(
          canBack: true,
          title: "Order Details",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: lightColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text("Order Status ",style: CustomTheme.style(weight: FontWeight.w600),),
                        Text("EMI active till May, 24",style: CustomTheme.style(size: 12),),
                      ],
                    ),
                    20.h,
                    ...status.map((e){
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 30,
                            child: Column(
                              children: [
                                // Expanded(child: Container(color: Colors.black87,width: 1,)),
                                Icon(e),
                                if(status.indexOf(e)!=2)Expanded(child: Container(color: Colors.black87,width: 1,)),
                              ],
                            ),
                          ),
                          Expanded(child: Text("Order Placed",style: CustomTheme.style(size: 12),)),
                          Text("12 Mar",style: CustomTheme.style(size: 12),)
                        ],
                      );
                    }).toList(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        shape: const RoundedRectangleBorder(),
                        fixedSize: const Size.fromWidth(double.maxFinite)
                      ),
                      onPressed: () {},
                      child: const Text("Cancel Booking"),
                    )
                  ],
                ),
              ),
              RoundedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                padding: const EdgeInsets.all(12),
                borderColor: lightColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("AUG#210233",style: CustomTheme.style(weight: FontWeight.w500),),
                    Divider(
                      color: lightColor,
                      height: 10,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: RoundedContainer(child: Text(""),backgroundColor: lightColor,),
                        ),
                        10.w,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Augmont 0.1Gm Gold Coin (999 Purity)",style: CustomTheme.style(weight: FontWeight.w600),),
                            4.h,
                            Text("₹53,000 ",style: CustomTheme.style(size: 12,weight: FontWeight.w600),),
                            4.h,
                            Text("Quantity : 1",style: CustomTheme.style(size: 12),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              RoundedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                borderColor: lightColor,
                child: ListTile(
                  leading: Icon(Icons.info_outline,color: Colors.black54,),
                  title: Text(
                    "Your order will be confirmed and dispatched once the quantity is received from the investments",
                    style: CustomTheme.style(size: 12
                    ),
                  ),
                ),
              ),
              Container(
                color: lightColor,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Shipping Address",style: CustomTheme.style(weight: FontWeight.w600),),
                      subtitle: Text(
                        "Vanshika Singhal\nSinghal - Sadan Jail Well, Bikaner Rajasthan 334001\n 8949593341",
                        style: CustomTheme.style(weight: FontWeight.w500,size: 12),
                      ),
                      trailing: Text("Edit",style: CustomTheme.style(weight: FontWeight.w600),),
                    ),
                    ListTile(
                      title: Text("Billing Address",style: CustomTheme.style(weight: FontWeight.w600),),
                      subtitle: Text(
                        "Vanshika Singhal\nSinghal - Sadan Jail Well, Bikaner Rajasthan 334001\n 8949593341",
                        style: CustomTheme.style(weight: FontWeight.w500,size: 12),
                      ),
                      trailing: Text("Edit",style: CustomTheme.style(weight: FontWeight.w600),),
                    ),
                  ],
                ),
              ),
              RoundedContainer(
                borderColor: lightColor,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Row(
                  children: [
                    Text("₹53,000",style: CustomTheme.style(weight: FontWeight.w600,size: 13),),
                    const Spacer(),
                    Text("View Booking Breakdown",style: CustomTheme.style(weight: FontWeight.w600,size: 13),),
                    const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black87,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
