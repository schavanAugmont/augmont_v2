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
      padding: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5,color: primaryColor)),
      ),
      child: child,
    );
  }
}
