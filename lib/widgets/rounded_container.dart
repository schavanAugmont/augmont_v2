import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const RoundedContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.radius,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor??Colors.transparent),
        borderRadius: radius??BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
