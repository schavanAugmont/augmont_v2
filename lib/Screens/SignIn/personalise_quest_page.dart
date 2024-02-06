import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

class PersonalizeQuestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalizeQuestionScreenState();
  }
}

class _PersonalizeQuestionScreenState extends State<PersonalizeQuestionScreen> {
  int _counter = 1;
  int _maxCount = 10;

  void _incrementCounter() {
    setState(() {
      _counter < _maxCount ? _counter++ : _counter = _maxCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        // Adjust padding as needed
        child: BottomAppBar(
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: _incrementCounter,
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 55.0),
                          backgroundColor: primaryColor),
                      child: Text(Strings.next,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          )))),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(
                      size: 15,
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onTap: () {},
                  ),
                  Spacer(),
                  Text("Skip",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20, right: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: kycProductBackgroundColor)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Personalisation Questions",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Spacer(),
                      Text("$_counter/$_maxCount",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    value: _counter / _maxCount,
                    backgroundColor: Colors.grey,
                    minHeight: 5.0,
                    valueColor: AlwaysStoppedAnimation<Color>(primaryTextColor),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: kycProductBackgroundColor)),
              child: Text(
                  "Which service offered by Augmont would you interested in?",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                color: kycProductBackgroundColor,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    //here your code
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Flexible(
                                child: Text(
                                    "Which service offered by Augmont would you interested in?",
                                    maxLines: 10,
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ))),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    ));
  }
}
