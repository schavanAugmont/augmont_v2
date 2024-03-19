import 'package:augmont_v2/controllers/wallets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/kycverification_controller.dart';
import '../../../widgets/text_component.dart';

class KYCVerifictionScreen extends StatefulWidget {
  const KYCVerifictionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KYCVerifictionState();
  }
}

class _KYCVerifictionState extends State<KYCVerifictionScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KYCVerifictionController>(builder: (controller) {
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
                      child: Text(Strings.kycVerification,
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
                        textComponent(Strings.summary, 16, FontWeight.w600),
                        SizedBox(
                          height: 10,
                        ),
                        kycDetails(context, controller)
                      ],
                    ),
                  ),
                ),
              )));
    });
  }

  Widget kycDetails(BuildContext context, KYCVerifictionController controller) {
    return Column(
      children: [

        widgetExpandHeader(controller.isPanDetailsExpanded.value,Strings.pancardDetails,controller),
        if (controller.isPanDetailsExpanded.value)
          widgetPanDetails(context),

        widgetExpandHeader(controller.isAadharExpanded.value,Strings.aadharDetails,controller),
        if (controller.isAadharExpanded.value)
          widgetPanDetails(context),

        widgetExpandHeader(controller.isOtherExpanded.value,Strings.otherDetails,controller),
        if (controller.isOtherExpanded.value)
          widgetPanDetails(context),

      ],
    );
  }

 Widget widgetExpandHeader(bool expandvalue, String title, KYCVerifictionController controller) {
   return  GestureDetector(
     onTap: () {
       if(title==Strings.pancardDetails){
         controller.onPanExpand();
       }else if(title==Strings.aadharDetails){
         controller.onAadharExpand();
       }else if(title==Strings.otherDetails){
         controller.onOtherExpand();
       }

     },
     child: Container(
       height: 50,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(5.0),
         color: kycProductBackgroundColor,
       ),
       margin: const EdgeInsets.only(bottom: 5),
       padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           textComponent(title.toTitleCase(), 14, FontWeight.w600),
           Image.asset(
             expandvalue
                 ? 'assets/images/up_arrow.png'
                 : 'assets/images/down_arrow.png',
             width: 15,
             height: 15,
             color: Colors.black,
           ),
         ],
       ),
     ),
   );
  }

Widget  widgetPanDetails(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: kycProductBackgroundColor,
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textComponent(Strings.panCard, 12, FontWeight.normal),
          textComponent("pan_image.pdf", 13, FontWeight.w600),
          SizedBox(height: 10,),
          textComponent(Strings.panNo, 12, FontWeight.normal),
          textComponent("AYLSNHJKFSNBDS", 13, FontWeight.w600),
          SizedBox(height: 10,),
          textComponent(Strings.fullName, 12, FontWeight.normal),
          textComponent("Ajay Joshi", 13, FontWeight.w600),
          SizedBox(height: 10,),
          textComponent(Strings.dateOfBirth, 12, FontWeight.normal),
          textComponent("01/09/1993", 13, FontWeight.w600),
          SizedBox(height: 10,),
          
        ],
      ),
    );
  }
}
