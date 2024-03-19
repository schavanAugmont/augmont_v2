import 'package:augmont_v2/controllers/wallets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/myagent_controller.dart';
import '../../../widgets/text_component.dart';


class MyAgentScreen extends StatefulWidget {
  const MyAgentScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAgentState();
  }
}

class _MyAgentState extends State<MyAgentScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAgentController>(builder: (controller) {
      return PopScope(
          canPop: false, //It should be false to work
          onPopInvoked: (didPop) {
            if (didPop) {
              return;
            }
            controller.onBack();
          },
          child: SafeArea(
              child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0.0,
              leading: IconButton(
                onPressed: () {
                  controller.onBack();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 16,
                ),
                //replace with our own icon data.
              ),
              title: Transform(
                  // you can forcefully translate values left side using Transform
                  transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                  child: Text(Strings.myAgent,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            bottomNavigationBar:  Container(
                    height: 55,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    // Adjust padding as needed
                    child:  Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(
                              width: 1.0,
                              color: primaryTextColor,
                            ),
                          ),
                          onPressed: () {
                            controller.unassignAgentDailog(context);
                          },
                          child: Text(Strings.unassignAgent,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )),
                        ))),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 40,
                      color: Colors.white,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: textComponent(
                          Strings.myAgent, 14, FontWeight.w600),
                    ),
                    Container(
                      color: kycProductBackgroundColor,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryTextColor,
                            child: Text("A"),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComponent("Anand Mishra", 14, FontWeight.w600),
                              textComponent("Mobile Numner: 98989898989889", 12, FontWeight.normal),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )));
    });
  }



}
