import 'package:augmont_v2/Screens/DigitalInvestment/SIP/gold_partner_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class GoldPartnerScreen extends StatefulWidget {
  const GoldPartnerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GoldPartnerState();
  }
}

class _GoldPartnerState extends State<GoldPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DgSIPController>(builder: (controller) {
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
              child: Text(Strings.goldpartner,
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
            child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 20,top: 20),child: maintitle("Choose ${Strings.goldpartner}"),),
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
                    margin: EdgeInsets.all(10),
                    color: kycProductBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryTextColor),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Gold+ Partner Name",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                            Spacer(),
                            Radio(
                              value: index,
                              groupValue: controller.selectedPartner,
                              onChanged: (val) {
                                setState(() {
                                  controller.selectedPartner = index;
                                  controller.update();
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "Invest in gold and avail returns with the best possibale deals in business.Invest in gold and avail returns with the best possibale deals in business",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(child: grids("Interest: 21%")),
                            Flexible(child: grids("Duration: 2 years")),
                            Flexible(child: grids("Min Qunatity: 1 gm")),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(children: [
                          Spacer(),
                          GestureDetector(onTap: (){
                            Get.to(() => GoldPartnerDetailsScreen(),
                                binding: DigitalInvestmentBiding());
                          },child: Text(
                              Strings.knowMore,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              )),)
                        ],)

                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ));
    });
  }

  Widget grids(value){
    return Container(
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: shadowColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(5),
      child:Text(value,
          style: TextStyle(
            color: primaryTextColor,
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ))
    );
  }
}
