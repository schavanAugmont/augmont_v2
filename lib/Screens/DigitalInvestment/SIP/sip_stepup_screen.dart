import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../MetalPice/metal_price_screen.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../barchart_widget.dart';
import '../donutchart_widget.dart';

class SIPStepupScreen extends StatefulWidget {
  final bool isEditable;

  const SIPStepupScreen({super.key, required this.isEditable});

  @override
  State<StatefulWidget> createState() {
    return _SIPStepupState();
  }
}

class _SIPStepupState extends State<SIPStepupScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DgSIPController>(initState: (state) {
      DgSIPController.to.setStepupValue(widget.isEditable);
    }, builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
              child: Text("Step-up SIP Name",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
        bottomNavigationBar: Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // Adjust padding as needed
            child: widget.isEditable
                ? ElevatedButton(
                    onPressed: () {
                      if(controller.isEnabled){
                        controller.editStepupDailog(context);
                      }else{
                        controller.isEnabled=true;
                        controller.update();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55.0),
                        backgroundColor: Colors.black),
                    child: Text(
                        controller.isEnabled
                            ? Strings.saveChange
                            : Strings.enableStepup,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55.0),
                        backgroundColor: Colors.black),
                    child: Text(Strings.proceed,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))),
        body: SingleChildScrollView(
          child: Column(
            children: [
             MetalPriceScreen(metalPrice: "₹ 0,00/gm",),
              if (widget.isEditable)
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  color: kycProductBackgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Stepup",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Enabled",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              )),
                        ],
                      )),
                      Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: controller.isEnabled,
                            onChanged: (value) {
                              if (controller.isEnabled) {
                                controller.disableStepupDailog(context);
                              }
                            },
                            activeTrackColor: primaryTextColor,
                            activeColor: Colors.white,
                          )),
                    ],
                  ),
                ),
              AbsorbPointer(
                absorbing: false,
                child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kycProductBackgroundColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Projected growth after 10 years',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: shadowColor,
                          height: 200,
                          child: BarchartWidegt(
                            screen: 'stepup',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Current Instalment value ₹4,000',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                              text: 'Instalment value ₹6,000',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: " (+6% annually)",
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kycProductBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 4.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 160,
                              decoration: BoxDecoration(
                                color: controller.isSIPSelected
                                    ? Colors.white
                                    : kycProductBackgroundColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    controller.onViewTap(true);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Step-Up by Percentage',
                                      style: TextStyle(
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: controller.isSIPSelected
                                            ? primaryTextColor
                                            : Colors.black45,
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 160,
                              height: 25,
                              decoration: BoxDecoration(
                                color: controller.isSIPSelected
                                    ? kycProductBackgroundColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  controller.onViewTap(false);
                                },
                                child: Center(
                                    child: Text(
                                      'Step-up by Amount',
                                      style: TextStyle(
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: controller.isSIPSelected
                                            ? Colors.black45
                                            : primaryTextColor,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  stepupView(controller)
                ],
              ),)

            ],
          ),
        ),
      ));
    });
  }

  Widget stepupView(DgSIPController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            controller.isSIPSelected
                ? 'Select % to Step-Up'
                : 'Select Amount to Step-Up',
            style: TextStyle(
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: primaryTextColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            textAlign: TextAlign.start,
            maxLength: 10,
            maxLines: 1,
            controller: controller.priceTextController,
            onChanged: (value) {},
            validator: (value) {
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: kycProductBackgroundColor,
              filled: true,
              counterText: "",
              hintText: Strings.enterCustomPrice,
            ),
            style: TextStyle(
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: primaryTextColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.isSIPSelected
                      ? controller.stepupPercList.length
                      : controller.stepupAmtList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.selectedamount = controller.isSIPSelected
                              ? controller.stepupPercList[index]
                              : controller.stepupAmtList[index];
                          controller.priceTextController.text =
                              controller.selectedamount;
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 5),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                                color: controller.selectedamount ==
                                        (controller.isSIPSelected
                                            ? controller.stepupPercList[index]
                                            : controller.stepupAmtList[index])
                                    ? primaryTextColor
                                    : Colors.grey),
                          ),
                          child: Text(
                              controller.isSIPSelected
                                  ? "${controller.stepupPercList[index]}"
                                  : "₹ ${controller.stepupAmtList[index]}",
                              style: TextStyle(
                                color: controller.selectedamount ==
                                        (controller.isSIPSelected
                                            ? controller.stepupPercList[index]
                                            : controller.stepupAmtList[index])
                                    ? primaryTextColor
                                    : Colors.grey,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ))),
                    );
                  })),
          SizedBox(
            height: 20,
          ),
          Text(
            'Interval to Step-up',
            style: TextStyle(
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: primaryTextColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.timeline = controller.timelineList[1];
                          });
                        },
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1.0,
                                  color: controller.timeline ==
                                          controller.timelineList[1]
                                      ? primaryTextColor
                                      : kycProductBackgroundColor),
                            ),
                            child: Center(
                                child: Text(controller.timelineList[1],
                                    style: TextStyle(
                                      color: controller.timeline ==
                                              controller.timelineList[1]
                                          ? primaryTextColor
                                          : shadowColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )))))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.timeline = controller.timelineList[2];
                          });
                        },
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1.0,
                                  color: controller.timeline ==
                                          controller.timelineList[2]
                                      ? primaryTextColor
                                      : kycProductBackgroundColor),
                            ),
                            child: Center(
                                child: Text(controller.timelineList[2],
                                    style: TextStyle(
                                      color: controller.timeline ==
                                              controller.timelineList[2]
                                          ? primaryTextColor
                                          : shadowColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )))))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.timeline = controller.timelineList[3];
                          });
                        },
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1.0,
                                  color: controller.timeline ==
                                          controller.timelineList[3]
                                      ? primaryTextColor
                                      : kycProductBackgroundColor),
                            ),
                            child: Center(
                                child: Text(controller.timelineList[3],
                                    style: TextStyle(
                                      color: controller.timeline ==
                                              controller.timelineList[3]
                                          ? primaryTextColor
                                          : shadowColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )))))),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              color: kycProductBackgroundColor,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Note !",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                      "Your SIP will upgrade to ${controller.priceTextController.text} from 24th of June. Autopay would be setup accordingly ",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
