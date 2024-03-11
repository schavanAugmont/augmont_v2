import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  Widget get h {
    if (isNegative) return const SizedBox.shrink();
    return SizedBox(height: toDouble());
  }

  Widget get w {
    if (isNegative) return const SizedBox.shrink();
    return SizedBox(width: toDouble());
  }
}
