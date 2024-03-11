import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PaymentMethod{paypal,razorpay}
enum RefundMode{augmontWallet,bank}

class PaymentMethodWidget extends StatelessWidget {
  final PaymentMethod? paymentMethod;
  final Function(PaymentMethod method)? onChange;
  const PaymentMethodWidget({super.key,this.paymentMethod,this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose Payment Options",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
        const SizedBox(height: 10,),
        ListView.separated(
          itemCount: PaymentMethod.values.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            final e = PaymentMethod.values[index];
            return RadioListTile(
              title: Text(e.name.capitalize??"",style: CustomTheme.style(weight: FontWeight.w600),),
              tileColor: lightColor,
              value: e,
              groupValue: paymentMethod,
              activeColor: primaryTextColor,
              onChanged: (value) {
                onChange?.call(e);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)
              ),
              contentPadding: EdgeInsets.zero,
            );
          },
        )
      ],
    );
  }
}


class RefundMethodWidget extends StatelessWidget {
  final RefundMode? refundMode;
  final Function(RefundMode method)? onChange;
  const RefundMethodWidget({super.key,this.refundMode,this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Transfer this amount to",style: CustomTheme.style(size: 15,weight: FontWeight.w600),),
        const SizedBox(height: 10,),
        ListView.separated(
          itemCount: RefundMode.values.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            final e = RefundMode.values[index];
            return RadioListTile(
              title: Text(e.name.capitalize??"",style: CustomTheme.style(weight: FontWeight.w600),),
              tileColor: lightColor,
              value: e,
              groupValue: refundMode,
              activeColor: primaryTextColor,
              onChanged: (value) {
                onChange?.call(e);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)
              ),
              contentPadding: EdgeInsets.zero,
            );
          },
        )
      ],
    );
  }
}