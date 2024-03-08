import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/editnominee_controller.dart';
import '../../../controllers/editprofile_controller.dart';
import '../../../widgets/text_component.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../../SignIn/Components/TextFieldContainer.dart';

class ReferralDetailScreen extends StatefulWidget {
  const ReferralDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReferralDetailState();
  }
}

class _ReferralDetailState extends State<ReferralDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNomineeController>(builder: (controller) {
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
                  child: Text(Strings.referalProgram,
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55.0),
                        backgroundColor: Colors.black),
                    child: Text(Strings.shareRefferal.toTitleCase(),
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
                children: [refferalHeader(context), refferalFooter(context)],
              ),
            ),
          )));
    });
  }

  Widget refferalHeader(BuildContext context) {
    return Container(
      color: shadowColor,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/referral_img.png"),
          SizedBox(
            height: 15,
          ),
          Text(
            "Refer your friends and earn \nupto ₹2000",
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                itemrefferalHeader(
                    "Every time somebody downloads the application via your referral, you earn ₹500"),
                SizedBox(
                  height: 10,
                ),
                itemrefferalHeader(
                    "You get ₹50 when your friend invests in DigiGold for the first time")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemrefferalHeader(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: shadowColor),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(child: textComponent(title, 13, FontWeight.w600)),
      ],
    );
  }

  Widget refferalFooter(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: shadowColor),
            height: 50,
            width: 50,
            child: Image.asset("assets/images/referral_icon.png"),
          ),
          SizedBox(
            height: 10,
          ),
          textComponent('Your referral code', 13, FontWeight.w600),
          Container(
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: primaryTextColor, width: 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textComponent("REFERRAL_CODE2024", 14, FontWeight.w600),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.copy_sharp,
                  size: 16,
                )
              ],
            ),
          ),
          Divider(
            color: shadowColor,
          ),
          faqWidget(context)
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
        textComponent(Strings.faqs, 14, FontWeight.w600),
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
                  title: textComponent('How to add a payment', 13, FontWeight.w600),
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
