import 'package:flutter/material.dart';

class AugmontBottomAppBar extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double height;
  const AugmontBottomAppBar({super.key,required this.child,this.height = 70,this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: child,
    );
  }
}
