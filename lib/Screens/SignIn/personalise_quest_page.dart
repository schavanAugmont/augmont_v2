import 'package:augmont_v2/Utils/scaffold_view.dart';
import 'package:augmont_v2/controllers/personalizeQuestion_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../widgets/stepper_widget.dart';

class PersonalizeQuestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalizeQuestionScreenState();
  }
}

class _PersonalizeQuestionScreenState extends State<PersonalizeQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalizeQuestionController>(builder: (controller) {
      return PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) {
              return;
            }
            controller.goToHomeScreen();

          },
          child:ScaffoldView(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.goToHomeScreen();
                        },
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              size: 24,
                              Icons.arrow_back_outlined,
                              color: bottomNavigationColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(Strings.back,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: bottomNavigationColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),

                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          controller.goToHomeScreen();
                        },
                        child: Text("Skip",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            )),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (controller.cusomerInfoQuestion!.isNotEmpty) ...[
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xFFF0F7FA),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Personalisation Questions",
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontFamily:
                                            Strings.fontfamilyCabinetGrotesk,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      )),

                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),

                                NumberStepper(
                                  totalSteps: controller.maxCount,
                                  width: MediaQuery.of(context).size.width,
                                  curStep: (controller.counter + 1),
                                  stepCompleteColor:greenColor,
                                  currentStepColor: primaryColor,
                                  inactiveColor: Colors.grey,
                                  lineWidth: 3.5,
                                  scrollController: controller.scrollController,
                                ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10),
                          child: Text(
                              controller
                                  .cusomerInfoQuestion![controller.counter]
                                  .question!
                                  .toTitleCase(),
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              )),
                        ),
                        if (controller.cusomerInfoQuestion![controller.counter]
                                .option ==
                            null)
                          showUserInfoDialog(
                              context,
                              controller,
                              controller
                                  .cusomerInfoQuestion![controller.counter]
                                  .question!,
                              controller
                                  .cusomerInfoQuestion![controller.counter]
                                  .type!,
                              controller
                                  .cusomerInfoQuestion![controller.counter].id!,
                              controller
                                          .cusomerInfoQuestion![
                                              controller.counter]
                                          .type ==
                                      'date'
                                  ? true
                                  : false),
                        if (controller.cusomerInfoQuestion![controller.counter]
                                .option !=
                            null)
                          showUserInfoSingleSelectDialog(
                              context,
                              controller,
                              controller
                                  .cusomerInfoQuestion![controller.counter]
                                  .question!,
                              controller
                                  .cusomerInfoQuestion![controller.counter]
                                  .type!,
                              controller
                                  .cusomerInfoQuestion![controller.counter]
                                  .option!,
                              controller
                                  .cusomerInfoQuestion![controller.counter].id!,
                              multiple: controller
                                          .cusomerInfoQuestion![
                                              controller.counter]
                                          .type !=
                                      'singleSelect'
                                  ? true
                                  : false)
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 55,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  // Adjust padding as needed
                  child:
                      // controller.enableMobileView.value ?
                      ElevatedButton(
                          onPressed: controller.incrementCounter,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: deliveryDescTextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.next,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  )),
                              Image.asset(
                                "assets/images/arrow_right.png",
                                height: 20,
                              )
                            ],
                          ))))
        ],
      )));
    });
  }

  Widget showUserInfoDialog(
      BuildContext context,
      PersonalizeQuestionController controller,
      String hint,
      String key,
      int questionId,
      [bool readOnly = false,
      TextInputType type = TextInputType.text,
      int? limit]) {
    return Container(
        padding: EdgeInsets.all(5),
        color: kycProductBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              readOnly: readOnly,
              keyboardType: type,
              maxLength: limit,
              textCapitalization: TextCapitalization.words,
              inputFormatters: [
                if (type == TextInputType.number)
                  FilteringTextInputFormatter.digitsOnly,
                if (hint.contains('pincode') || hint.contains('postal'))
                  FilteringTextInputFormatter.deny(RegExp('^[0]+')),
                if (key.contains('Name'))
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
              onTap: () {
                if (readOnly) {
                  bool isOld = true;
                  if (hint.contains('birth') ||
                      hint.contains('anniversary') ||
                      hint.contains('dob')) {
                    isOld = false;
                  }
                  showDatePicker(
                    context: context!,
                    initialDate: isOld
                        ? DateTime.now()
                        : DateTime.now()
                            .subtract(const Duration(days: 365 * 18)),
                    firstDate: isOld ? DateTime.now() : DateTime(1945, 1, 1),
                    lastDate: isOld ? DateTime(2101) : DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      final dob = DateFormat('dd MMM yyyy').format(value);
                      controller.commonController.text = dob.toString();
                      controller.update();
                    }
                  });
                }
              },
              controller: controller.commonController,
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: primaryTextColor,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Color(0xFFD1E3E8), width: 0.5)),
                  hintText: hint.replaceAll('Please', '').capitalize,
                  hintStyle: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: primaryTextColor,
                  ),
                  counterText: ''),
            ),
            if (key == 'socialMediaProfile') ...[
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: controller.social.value,
                        onChanged: (v) {
                          controller.social(v);
                          controller.update();
                        }),
                    const Text(
                      'I prefer not to share',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ));
  }

  Widget showUserInfoSingleSelectDialog(
      BuildContext context,
      PersonalizeQuestionController controller,
      String hint,
      String key,
      List<String> data,
      int questionId,
      {bool multiple = false}) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Flexible(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: controller.selectedOption.contains(data[index])
                        ?  Colors.amber.withOpacity(0.05):Colors.white,
                    border: Border.all(width: 1, color:  controller.selectedOption.contains(data[index])
                        ?primaryColor:Color(0xFFD1E3E8)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                          value: controller.selectedOption.contains(data[index])
                              ? true
                              : false,
                          onChanged: (value) {
                            if (multiple == false) {
                              controller.selectedOption.clear();
                              controller.selectedOption.add(data[index]);
                              controller.update();
                            } else {
                              if (controller.selectedOption
                                  .contains(data[index])) {
                                controller.selectedOption.remove(data[index]);
                                controller.update();
                              } else {
                                controller.selectedOption.add(data[index]);
                                controller.update();
                              }
                            }
                          }),
                      Flexible(
                          child: Text(data[index],
                              maxLines: 10,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ))),
                    ],
                  ),
                );
              }),
        ));
  }
}
