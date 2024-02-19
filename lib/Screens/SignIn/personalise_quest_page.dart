import 'package:augmont_v2/controllers/personalizeQuestion_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

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
      return SafeArea(
          child: Scaffold(
        bottomNavigationBar: Container(
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          // Adjust padding as needed
          child: ElevatedButton(
              onPressed: controller.incrementCounter,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55.0),
                  backgroundColor: primaryColor),
              child: Text(Strings.next,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
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
              if (controller.cusomerInfoQuestion!.isNotEmpty) ...[
                Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: kycProductBackgroundColor)),
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
                          Text(
                              "${controller.counter + 1}/${controller.maxCount}",
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
                        value: (controller.counter + 1) / controller.maxCount,
                        backgroundColor: Colors.grey,
                        minHeight: 5.0,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(primaryTextColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: kycProductBackgroundColor)),
                  child: Text(
                      controller
                          .cusomerInfoQuestion![controller.counter].question!,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                ),
                if (controller
                        .cusomerInfoQuestion![controller.counter].option ==
                    null)
                  showUserInfoDialog(
                      context,
                      controller,
                      controller
                          .cusomerInfoQuestion![controller.counter].question!,
                      controller.cusomerInfoQuestion![controller.counter].type!,
                      controller.cusomerInfoQuestion![controller.counter].id!,
                      controller.cusomerInfoQuestion![controller.counter]
                                  .type ==
                              'date'
                          ? true
                          : false),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    color: kycProductBackgroundColor,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      //here your code
                        scrollDirection: Axis.vertical,
                        itemCount:5,
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
                                        "dfsgfgsgsg  reghedhdh",
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
              ]
            ],
          ),
        ),
      ));
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
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
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
              style:  TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: primaryTextColor,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: kycProductBackgroundColor, width: 0.5)),
                  hintText: hint.replaceAll('Please', '').capitalize,
                  hintStyle:  TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
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
}
