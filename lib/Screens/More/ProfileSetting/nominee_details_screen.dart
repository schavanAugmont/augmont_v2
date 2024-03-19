import 'package:augmont_v2/controllers/nominee_controller.dart';
import 'package:augmont_v2/controllers/wallets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/editprofile_controller.dart';
import '../../../widgets/text_component.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../../SignIn/Components/TextFieldContainer.dart';

class NomineeDetailsScreen extends StatefulWidget {
  const NomineeDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NomineeDetailsState();
  }
}

class _NomineeDetailsState extends State<NomineeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NomineeController>(builder: (controller) {
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
                      child: Text(Strings.nomineeDetails,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ),
                bottomNavigationBar:  controller.isNomineeAdded.value
                    ? null:Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    // Adjust padding as needed
                    child: ElevatedButton(
                        onPressed: () {
                          controller.updateNominee();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 55.0),
                            backgroundColor: Colors.black),
                        child: Text(Strings.addnomineeDetails,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )))),
                body: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        controller.isNomineeAdded.value
                            ? nomineeDetails(context, controller) :
                        emptyNominee(context, controller)
                      ],
                    ),
                  ),
                ),
              )));
    });
  }



  Widget emptyNominee(BuildContext context, NomineeController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/nominee_empty.png"),
          SizedBox(
            height: 10,
          ),
          textComponent(
              "Nominee Details Not Added!", 14, FontWeight.w600),
          SizedBox(
            height: 5,
          ),
          textComponent("You have not added Nominee details yet", 12, FontWeight.normal),
        ],
      ),
    );
  }

  Widget nomineeDetails(BuildContext context, NomineeController controller) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: kycProductBackgroundColor,
          ),
          margin: const EdgeInsets.only(bottom: 5),
          padding:EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textComponent(Strings.nomineeDetails, 14, FontWeight.w600),
                Icon(Icons.edit,size: 15,color: Colors.black,)
              ],
            ),
        ),

        Container(
          width: MediaQuery.sizeOf(context).width,
          color: kycProductBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textComponent(Strings.nomineeName, 11, FontWeight.normal),
              SizedBox(height: 5,),
              textComponent("Sagar Chavamn", 14, FontWeight.w600),
              SizedBox(height: 12,),
              textComponent(Strings.relationship, 11, FontWeight.normal),
              SizedBox(height: 5,),
              textComponent("Father", 14, FontWeight.w600),
              SizedBox(height: 12,),
              textComponent(Strings.dateOfBirth, 11, FontWeight.normal),
              SizedBox(height: 5,),
              textComponent("13/03/1993", 14, FontWeight.w600),
            ],
          ),
        )

      ],
    );
  }


}
