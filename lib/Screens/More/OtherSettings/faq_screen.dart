import 'package:augmont_v2/controllers/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../Utils/themes.dart';
import '../../../controllers/editnominee_controller.dart';
import '../../../controllers/editprofile_controller.dart';
import '../../../widgets/text_component.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../../SignIn/Components/TextFieldContainer.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FAQState();
  }
}

class _FAQState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FAQController>(builder: (controller) {
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
                  child: Text(Strings.faqs,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            body: SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child:textComponent(Strings.frequentlyAskedQuestion, 16, FontWeight.w600)),
                  SizedBox(height: 10,),
                  SizedBox(
                      height: 35,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.faqList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.selectedamount =
                                  controller.faqList[index];

                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color: controller.selectedamount ==
                                            controller.faqList[index]
                                            ? primaryTextColor
                                            : Colors.grey),
                                  ),
                                  child: Text("${controller.faqList[index]}",
                                      style: TextStyle(
                                        color: controller.selectedamount ==
                                            controller.faqList[index]
                                            ? primaryTextColor
                                            : Colors.grey,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ))),
                            );
                          })),
                  SizedBox(height: 20,),
                  searchBar(controller),
                  SizedBox(height: 10,),
                  faqWidget(context)
                ],
              ),
            )),
          )));
    });
  }

  Widget searchBar(FAQController controller){
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: lightColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              controller: controller.searchQuery,
              style: CustomTheme.style(weight: FontWeight.w600),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search..",
                hintStyle: CustomTheme.style(color: Colors.grey, size: 13),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.search, size: 20, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget faqWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: kycProductBackgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ExpansionTile(
                  shape: Border(),
                  childrenPadding: EdgeInsets.all(10),
                  backgroundColor: kycProductBackgroundColor,
                  title: textComponent(
                      'How to add a payment', 13, FontWeight.w600),
                  children: [
                    textComponent(
                        'The customer can get all details of the product booked, EMI paid, amount pending, delivery date, etc in the “My orders” tab on the dashboard after entering the login details',
                        13,
                        FontWeight.normal),
                  ],
                ));
          },
        )
      ],
    );
  }
}
