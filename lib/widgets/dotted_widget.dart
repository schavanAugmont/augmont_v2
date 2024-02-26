import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final Axis axis;
  final Color? color;
  final int? dotCount;
  const DottedLine({super.key,this.axis = Axis.horizontal,this.color,this.dotCount});

  @override
  Widget build(BuildContext context) {
    if(axis == Axis.horizontal){
      return Text(
        "--------------------------------------------------------------------------------",
        maxLines: 1,
        style: TextStyle(
            fontSize: 16,
            color: color??Colors.black26,
            letterSpacing:5
        ),
      );
    }
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        List.generate(dotCount??7, (index) => "-").join(),
        maxLines: 1,
        style: TextStyle(
            color: color??Colors.black26,
            letterSpacing:5
        ),
      ),
    );
  }
}