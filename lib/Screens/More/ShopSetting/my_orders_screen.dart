import 'package:augmont_v2/controllers/myorders_controller.dart';
import 'package:augmont_v2/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../Utils/themes.dart';
import '../../../widgets/text_component.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyOrdersState();
  }
}

class _MyOrdersState extends State<MyOrdersScreen> {
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
                  child: Text(Strings.myorders,
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
                    Container(
                      height: 34,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: lightColor,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: TabBar(
                        onTap: (index) {
                         setState(() {
                           if(controller.isOrderListEmpty){
                             controller.isOrderListEmpty=false;
                           }else{
                             controller.isOrderListEmpty=true;
                           }

                         });
                        },
                        controller: controller.tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: primaryTextColor,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        dividerHeight: 0,
                        tabs: const [
                          Tab(
                            text: "Active Orders",
                          ),
                          Tab(
                            text: "Past Order",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    controller.isOrderListEmpty? emptyOrder(context, controller):myOrderList(context, controller),

                  ],
                ),
              ),
            ),
          )));
    });
  }

  Widget emptyOrder(BuildContext context, MyOrdersController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty_order_img.png"),
          SizedBox(
            height: 10,
          ),
          Text("You don’t have any active orders at the moment",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text("Shop More",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )))
        ],
      ),
    );
  }

  Widget myOrderList(BuildContext context, MyOrdersController controller) {
    return Column(
      children: [
        searchBar(controller),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(onTap: (){
              controller.gotoDetailPage();
            },child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(color: kycProductBackgroundColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: kycProductBackgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/delivery_icon.png"),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                            text: TextSpan(
                              text: "Delivery estimated by  ",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '13 Nov,23',
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: shadowColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          height: 70,
                          width: 100,
                          padding: EdgeInsets.all(10),
                          child: Align(alignment: Alignment.topRight,child: Image.asset("assets/images/ic_image.png",height: 20,),),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                textComponent(
                                    "Augmont 0.1Gm Gold Coin (999 Purity)",
                                    14,
                                    FontWeight.w600),
                                SizedBox(
                                  height: 5,
                                ),
                                textComponent("Quantity:1", 12, FontWeight.normal),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),

                        Center(child: Icon(Icons.chevron_right_rounded),)
                      ],
                    ),
                  ),
                ],
              ),
            ),);
          },
        )
      ],
    );
  }

  Widget searchBar(MyOrdersController controller) {
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
                hintText: "Search by order ID or Product name",
                hintStyle: CustomTheme.style(color: Colors.grey, size: 13),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 20, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
