import 'package:flutter/material.dart';

import '../../../Utils/colors.dart';



class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        /*boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 1,
          )
        ],*/
        color: kycProductBackgroundColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: child,
    );
  }
}
