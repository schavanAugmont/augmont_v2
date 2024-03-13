import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({
    Key? key,
    required this.child  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -24,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [
                    Colors.amber.withOpacity(0.2),
                    Colors.amber.withOpacity(0.1),
                    Colors.amber.withOpacity(0.05),
                    Colors.amber.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}