import 'package:augmont_v2/Bindings/signin_binding.dart';
import 'package:augmont_v2/Screens/SignIn/signin_page1.dart';
import 'package:augmont_v2/Utils/scaffold_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Network/api_client.dart';
import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../controllers/more_controller.dart';
import '../Home/Components/HeaderWalletView.dart';
import '../SignIn/Components/SignInComponents.dart';
import 'components/morecell_view.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoreController>(builder: (controller) {

      return Scaffold(
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Column(
              children: [
                HeaderWalletView(
                  walletAmount: '',
                  onPressed: () {},
                  isLoggedIn: false,
                ),
                if (controller.isLoggedIn.value) ...[
                  profileView(context, controller),
                  moreSettingView(context, controller)
                ],
                if (!controller.isLoggedIn.value) loginView(context)
              ],
            )),
          ),
        ),
      );
    });
  }

  Widget loginView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.sizeOf(context).height * 0.65,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                ),
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(15),
                child: ImageIcon(
                  AssetImage('assets/images/ic_add_user.png'),
                  size: 30,
                  color: Colors.black,
                )),
            SizedBox(
              height: 10,
            ),
            Text("Onboard to Augmont!",
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
            SizedBox(
              height: 8,
            ),
            Text(
                "Register yourself quickly to avail the world class services awaiting you on other side.",
                maxLines: 5,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                )),
            GestureDetector(
                onTap: () {
                  Get.offAll(
                    () => const SignInPage1(),
                    binding: SignInBiding(),
                    transition: Transition.rightToLeft,
                  );


                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: EdgeInsets.only(bottom: 10, top: 15),
                    height: 40,
                    child: Center(
                        child: Text('Register/Sign-In Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ))))),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget profileView(BuildContext context, MoreController controller) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: kycProductBackgroundColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white70,
              minRadius: 40.0,
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(
                    'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            textComponent("Customer Name", 15, FontWeight.w600),
            SizedBox(
              height: 2,
            ),
            GestureDetector(
                onTap: () {
                  controller.goToEditProfile();
                },
                child: textComponent("View Profile", 11, FontWeight.w600)),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                controller.goToWallet();
              },
              child: Container(
                width: 180,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: shadowColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    textComponent("Wallet Balance", 11, FontWeight.normal),
                    SizedBox(
                      width: 5,
                    ),
                    textComponent("₹5000", 11, FontWeight.w600)
                  ],
                ),
              ),
            ),
            Divider(
              color: shadowColor,
            ),
            SizedBox(height: 5),
            totalInvestment(controller),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: profileComponets1(
                        "02", Strings.upcomingPayment, false, controller)),
                Expanded(
                    child: profileComponets1(
                        "04", Strings.pendingPayment, false, controller)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: profileComponets1(
                        "03", Strings.activeLoan, true, controller)),
                Expanded(
                    child: profileComponets1(
                        "20.88 gms", Strings.totalsoldGold, true, controller)),
              ],
            ),
            SizedBox(height: 10),
            profileComponets2(Strings.paybyAugmont),
            profileComponets2(Strings.requestDel),
          ],
        ));
  }

  Widget totalInvestment(MoreController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(bottom: 5, right: 5),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kycProductBackgroundColor,
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              textComponent(Strings.totalInvestValue, 12, FontWeight.w600),
              Spacer(),
              RichText(
                  text: TextSpan(
                text: "₹15,000 \n",
                style: TextStyle(
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.normal,
                  color: primaryTextColor,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '₹5,000',
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.normal,
                      color: primaryTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: shadowColor,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Augmont (70%)",
                  style: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    color: primaryTextColor,
                    fontSize: 13,
                  )),
              Container(
                height: 20,
                width: 1,
                color: shadowColor,
              ),
              GestureDetector(
                onTap: () {
                  controller.goToMerchantPage();
                },
                child: Text("Other Merchant (70%)",
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.normal,
                      color: primaryTextColor,
                      fontSize: 13,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget profileComponets1(
      String count, String title, bool isShown, MoreController controller) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: EdgeInsets.only(bottom: 5, right: 5),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isShown)
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: shadowColor),
              ),
            textComponent(count, 18, FontWeight.w600),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: textComponent(title, 12, FontWeight.w600)),
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: kycProductBackgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 10,
                    ))
              ],
            )
          ],
        ),
      ),
      onTap: () {
        controller.goToPaymentPage();
      },
    );
  }

  Widget profileComponets2(String title) {
    return Container(
      decoration: BoxDecoration(
        color: primaryTextColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 11,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget textComponent(String title, double fontsize, FontWeight fontweight) {
    return Text(
      title,
      maxLines: 2,
      style: TextStyle(
        color: primaryTextColor,
        fontFamily: Strings.fontFamilyName,
        fontWeight: fontweight,
        fontSize: fontsize,
      ),
    );
  }

  Widget moreSettingView(BuildContext context, MoreController controller) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          moreSettingComponents(
              Strings.profileSetting, controller.profileList, controller),
          SizedBox(
            height: 8,
          ),
          moreSettingComponents(Strings.shop, controller.shopList, controller),
          SizedBox(
            height: 8,
          ),
          moreSettingComponents(
              Strings.exchange, controller.exchangeList, controller),
          SizedBox(
            height: 8,
          ),
          moreSettingComponents(
              Strings.settings, controller.settingList, controller),
          SizedBox(
            height: 8,
          ),
          moreSettingComponents("", controller.otherList, controller),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              controller.logoutDailog(context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: primaryTextColor, width: 1),
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textComponent(Strings.logout, 14, FontWeight.w600),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.logout,
                    size: 16,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget moreSettingComponents(
      String title, List<String> listDetails, MoreController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          textComponent(title, 13, FontWeight.w600),
          SizedBox(
            height: 5,
          ),
        ],
        ListView.builder(
          itemCount: listDetails.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.navtigatTo(listDetails[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kycProductBackgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (title.isNotEmpty) ...[
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: shadowColor),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                    textComponent(listDetails[index], 12, FontWeight.normal),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 11,
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }


}
