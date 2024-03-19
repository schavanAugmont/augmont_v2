import 'package:augmont_v2/controllers/myorders_controller.dart';
import 'package:augmont_v2/controllers/wallets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../Utils/themes.dart';
import '../../../widgets/text_component.dart';

class MyOrdersDetailsScreen extends StatefulWidget {
  const MyOrdersDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyOrdersDetailsState();
  }
}

class _MyOrdersDetailsState extends State<MyOrdersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrdersController>(builder: (controller) {
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
                  child: Text("Order Details",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    orderStatus(context),
                    myOrderDetails(context, controller),
                    noteWidget(),
                    addressWidget(),
                    paymentBreakDown(controller)
                  ],
                ),
              ),
            ),
          )));
    });
  }

  Widget orderStatus(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: shadowColor,
      padding: EdgeInsets.all(20),
      child: Column(children: [

        RichText(
            text: TextSpan(
              text: "Order Status ",
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'EMI active till May,24',
                  style: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    color: primaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            )),
        SizedBox(height: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            stepperWidget1("Order Placed","On: 31-01-24"),
            stepperWidget2("Confirmed","Estimated by:31-01-24"),

            stepperWidget2("EMI Payment","50000/12000"),
            stepperWidget2("Shipment","3 Days after EMI Payment"),
            stepperWidget2("Delivery","5 Days after EMI Payment"),


          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primaryTextColor, width: 1),
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: EdgeInsets.all(10),
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textComponent("Cancel Booking", 14, FontWeight.w600),

            ],
          ),
        )
      ],)
    );
  }

  Widget myOrderDetails(BuildContext context, MyOrdersController controller) {
    return Container(child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            border: Border.all(color: shadowColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComponent("AUG#232323", 12, FontWeight.w600),
                    textComponent("55,0000/1,02,500", 12, FontWeight.w600),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: shadowColor,
                  height: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: shadowColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 70,
                      width: 100,
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          "assets/images/ic_image.png",
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            textComponent("Augmont 0.1Gm Gold Coin (999 Purity)",
                                14, FontWeight.w600),
                            SizedBox(
                              height: 2,
                            ),
                            textComponent("53,000", 12, FontWeight.w600),
                            SizedBox(
                              height: 2,
                            ),
                            textComponent("Quantity:1", 12, FontWeight.normal),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: primaryTextColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "View EMI Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),margin: EdgeInsets.all(20),);
  }

  Widget noteWidget() {
    return Container(
      padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 20,right: 20),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: kycProductBackgroundColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textComponent("Note:", 14, FontWeight.bold),
          SizedBox(
            height: 10,
          ),
          textComponent(
              "Post your last EMI instalment we will ship your product after 3-4 days post payment",
              12,
              FontWeight.normal)
        ],
      ),
    );
  }

  Widget addressWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: kycProductBackgroundColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addressItem("Shipping Address"),
          SizedBox(
            height: 5,
          ),
          textComponent("Vanshika Singhal", 14, FontWeight.w500),
          textComponent(
              "Singhal - Sadan Jail Well, Bikaner Rajasthan 334001 \n8949593341",
              12,
              FontWeight.normal),
          SizedBox(
            height: 15,
          ),
          addressItem("Billing Address"),
          SizedBox(
            height: 5,
          ),
          textComponent("Vanshika Singhal", 14, FontWeight.w500),
          textComponent(
              "Singhal - Sadan Jail Well, Bikaner Rajasthan 334001 \n8949593341",
              12,
              FontWeight.normal)
        ],
      ),
    );
  }

  Widget addressItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textComponent(title, 15, FontWeight.bold),
        textComponent("Edit", 12, FontWeight.w600),
      ],
    );
  }

  Widget paymentBreakDown(MyOrdersController controller) {
    return Container(child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: shadowColor),
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              controller.onPersonalExpand();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textComponent("₹53,000", 14, FontWeight.normal),
                Spacer(),
                textComponent("View Booking Breakdown", 14, FontWeight.w600),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  controller.isPersonalDetailsExpanded.value
                      ? 'assets/images/up_arrow.png'
                      : 'assets/images/down_arrow.png',
                  width: 15,
                  height: 15,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        if (controller.isPersonalDetailsExpanded.value)
          Container(
            padding: EdgeInsets.all(20),
            color: kycProductBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                          text: "Product Price ",
                          style: TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w500,
                            color: primaryTextColor,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '₹53,000 ',
                              style: TextStyle(
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                color: primaryTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
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
                detailsItem("EMI/month", "₹11,600"),
                SizedBox(
                  height: 10,
                ),
                detailsItem(Strings.addtionalCharges, "₹500"),
                SizedBox(
                  height: 10,
                ),
                detailsItem("Interest Per month", "0.5"),
                SizedBox(
                  height: 10,
                ),
                detailsItem("Platform Fee", "₹50"),
                SizedBox(
                  height: 10,
                ),
                detailsItem("Decucted From Wallet", "-₹5000"),
                SizedBox(
                  height: 10,
                ),
                detailsItem("Savings", "₹50"),
              ],
            ),
          )
      ],
    ),margin: EdgeInsets.only(left: 20,right: 20),);
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

 Widget stepperWidget2(String title,String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          height: 30,
          width: 1,
          color: primaryTextColor,
        ),
        Row(
          children: [
            CircleAvatar(
                maxRadius: 12,
                backgroundColor: Colors.black54,
                child: CircleAvatar(
                    maxRadius: 11,
                    backgroundColor: kycProductBackgroundColor)),
            SizedBox(width: 5,),
            textComponent(title, 12, FontWeight.w600),
            Spacer(),
            textComponent(value, 12, FontWeight.normal),
            SizedBox(width: 10,)
          ],
        )
      ],
    );
 }

  Widget stepperWidget1(String title,String value) {
    return   Row(
      children: [
        CircleAvatar(
          maxRadius: 12,
          backgroundColor: Colors.green,
          child: Icon(Icons.arrow_right_alt_outlined),
        ),
        SizedBox(width: 5,),
        textComponent(title, 12, FontWeight.w600),
        Spacer(),
        textComponent(value, 12, FontWeight.normal),
        SizedBox(width: 10,)
      ],
    );
  }


}
