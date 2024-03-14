import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
final  ScrollController scrollController;


  NumberStepper({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth, required this.scrollController,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: this.width,
      // child:  Row(
      //       children: _steps(),
      //     ),

      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          totalSteps,
          (i) => Row(
            children: [
              if (i + 1 == curStep)
                Container(
                    width: 15.0,
                    height: 15.0,
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(25.0)),
                        border: new Border.all(
                          color: primaryColor,
                          width: 1.0,
                        )), child:CircleAvatar(
                        maxRadius: 11,
                        backgroundColor: primaryColor)),
              if (i + 1 != curStep)
                Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: new BoxDecoration(
                    color: getCircleColor(i),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(25.0)),
                    border: new Border.all(
                      color: getBorderColor(i),
                      width: 1.0,
                    ),
                  ),
                ),
              if (i != totalSteps - 1)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  height: 2,
                  width: 30,
                  color: getLineColor(i),
                )
            ],
          ),
        ),
      ),
    );
  }

  getCircleColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = Colors.grey;
    return color;
  }

  getBorderColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = inactiveColor;

    return color;
  }

  getLineColor(i) {
    var color = curStep > i + 1 ? Colors.green : Colors.grey;
    return color;
  }


}
