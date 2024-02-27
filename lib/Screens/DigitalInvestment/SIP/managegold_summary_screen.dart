import 'package:augmont_v2/Screens/DigitalInvestment/SIP/gold_partner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Bindings/main_screen_binding.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../Main/main_screen.dart';
import '../../MetalPice/metal_price_screen.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class ManageGoldSummaryScreen extends StatefulWidget {
  const ManageGoldSummaryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ManageGoldSummaryState();
  }
}

class _ManageGoldSummaryState extends State<ManageGoldSummaryScreen> {
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
              child: Text(Strings.sipSummary,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [MetalPriceScreen(), sipDetailsWidget(), otherWidget()],
          ),
        ),
      ));
    });
  }

  Widget sipDetailsWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      color: kycProductBackgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  decoration: new BoxDecoration(
                    color: shadowColor,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(15),
                  child: ImageIcon(
                    AssetImage('assets/images/ic_coins.png'),
                    size: 20,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 10,
              ),
              Text("IDBI to HDFC ",
                  style: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    color: primaryTextColor,
                    fontSize: 16,
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.2,
            color: shadowColor,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              detailsItem(Strings.leasingTo, "HDFC"),
              GestureDetector(
                onTap: () {
                  Get.to(() => GoldPartnerScreen(),
                      binding: DigitalInvestmentBiding());
                },
                child: Container(
                    margin: EdgeInsets.only(top: 5),
                    width: MediaQuery.sizeOf(context).width,
                    child: Text("Switch Gold+ Partner",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ))),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.tenure, "2 years"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.interestRate, "0.1%"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.minQuantity, "1 gms"),
        ],
      ),
    );
  }

  Widget detailsItem(String key, String value) {
    return Row(
      children: [
        Text(key,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            )),
        Spacer(),
        Text(value,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            )),
      ],
    );
  }

  Widget otherWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(10),
            color: kycProductBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Moving your investments",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: Strings.fontFamilyName,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Your accumulated gold of 23gm is moving to the new selected Gold+ Partner",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                    fontFamily: Strings.fontFamilyName,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: kycProductBackgroundColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.only(top: 10),
            child: CheckboxListTile(
              title:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Swtich Partner Now",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        fontFamily: Strings.fontFamilyName,
                      )),

                  Text("Lease will switch right away",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                      fontFamily: Strings.fontFamilyName,
                    ),
                  ),
                ],
              ),
              value: false,
              onChanged: (newValue) {},
              controlAffinity: ListTileControlAffinity
                  .leading, //  <-- leading Checkbox
            ),
          ), SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: kycProductBackgroundColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Note !",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: Strings.fontFamilyName,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Unleasing request takes 24 hours! Gold+ partners will be swtiched after ther mentioned time peroid.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                    fontFamily: Strings.fontFamilyName,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
