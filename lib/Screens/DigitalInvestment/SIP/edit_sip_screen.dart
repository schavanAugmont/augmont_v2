import 'package:augmont_v2/Screens/DigitalInvestment/SIP/sip_stepup_screen.dart';
import 'package:augmont_v2/Screens/MetalPice/metal_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class EditSIPScreen extends StatefulWidget {
  const EditSIPScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditSIPState();
  }
}

class _EditSIPState extends State<EditSIPScreen> {
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
              child: Text("Edit SIP",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
             MetalPriceScreen(metalPrice: "₹ 0,00/gm",),
              editComponents(
                  "SIP Purpose: SIP Name", "Change SIP Purpose", 1, controller,context),
              editComponents("Amount per month: ₹6000", "Change SIP Structure",
                  2, controller,context),
              editComponents("Active Gold+ Partner: Bank Name", "Manage Lease",
                  3, controller,context),
              editComponents("Step-up Active: 6% annually", "Manage Step-up", 4,
                  controller,context),
              editComponents("Pause SIP", "Skip Installments", 5, controller,context),
            ],
          ),
        ),
      ));
    });
  }

  Widget editComponents(
      String tile, String dsecp, int index, DgSIPController controller, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kycProductBackgroundColor),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: EdgeInsets.all(10),
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
                    shape: BoxShape.circle, color: primaryTextColor),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(tile,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      )),
                  Text(dsecp,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                      )),
                ],
              )),
              GestureDetector(
                onTap: () {
                  controller.setEditNavigation(index,context);
                },
                child: index == 5
                    ? Image.asset(
                        'assets/images/ic_arrows.png',
                        width: 25,
                      )
                    : Text(index == 3 ? "Manage" : "Edit",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
