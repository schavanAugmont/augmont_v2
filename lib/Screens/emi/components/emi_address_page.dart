import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/widgets/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/emi_checkout_controller.dart';

class EmiAddressPage extends StatelessWidget {
  const EmiAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmiCheckoutController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Select Delivery Address
              Text("Select Delivery Address",style: CustomTheme.style(weight: FontWeight.w600),),
              const SizedBox(height: 4),
              Text(
                "Your order will be delivered to this mentioned address",
                style: CustomTheme.style(size: 10),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children: const [
                    AddressTile(),
                    SizedBox(height: 20,),
                    AddressTile(),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87)
                ),
                alignment: Alignment.center,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add,color: Colors.black87,),
                    const SizedBox(width: 10,),
                    Text("Add New Address",style: CustomTheme.style(weight: FontWeight.w600),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  controller.onPageChanges(1);
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  color: Colors.black87,
                  alignment: Alignment.center,
                  child: Text("Deliver to this Address",style: CustomTheme.style(weight: FontWeight.w600,color: Colors.white),),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
