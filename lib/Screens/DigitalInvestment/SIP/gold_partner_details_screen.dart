import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class GoldPartnerDetailsScreen extends StatefulWidget {
  const GoldPartnerDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GoldPartnerDetailsState();
  }
}

class _GoldPartnerDetailsState extends State<GoldPartnerDetailsScreen> {
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
              child: Text(Strings.goldpartnerDetails,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(20),child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryTextColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Gold+ Partner Name",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  Text("https://.augmont.com",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: grids("Interest: 21%")),
                      Flexible(child: grids("Duration: 2 years")),
                      Flexible(child: grids("Min Qunatity: 1 gm")),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: grids("Turnover: 20Cr")),
                      Flexible(child: grids("Year of operation : 15+")),

                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              subtitle1("About over Partner"),
              Text(Strings.dummyText,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  )),


              SizedBox(height: 10,),
              subtitle1("More Information"),
              Text(Strings.dummyText,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  )),



            ],
          ),),
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
