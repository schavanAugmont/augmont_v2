import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Network/api_client.dart';
import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../controllers/more_controller.dart';
import '../Home/Components/HeaderWalletView.dart';
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
            child: Column(
              children: [
                HeaderWalletView(
                  walletAmount: '',
                  onPressed: () {},
                  isLoggedIn: false,
                ),
                Expanded(
                  child: Scrollbar(
                      thickness: 5,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          MoreCellView(
                              title: Strings.trusteeCertificate,
                              iconImg: "assets/images/trustee_certificate.png",
                              onPressed: () async {
                                controller.fetchTrusteeCert();
                              },
                              isLast: false),
                          MoreCellView(
                            title: Strings.aboutUs,
                            iconImg: "assets/images/about_us.png",
                            onPressed: () async {
                              ApiClient().navigateToWebView(controller.aboutUsUrl);
                            },
                            isLast: false,
                          ),
                          MoreCellView(
                              title: Strings.leadingProvider,
                              iconImg: "assets/images/terms_conditions.png",
                              onPressed: () async {
                                ApiClient()
                                    .navigateToPDFView(controller.leadingProviderURL);
                              },
                              isLast: false),
                          MoreCellView(
                              title: Strings.grievancePolicy,
                              iconImg: "assets/images/terms_conditions.png",
                              onPressed: () async {
                                ApiClient()
                                    .navigateToPDFView(controller.gerpolicyURL);
                              },
                              isLast: false),
                          // MoreCellView(
                          //     title: Strings.goldPrice,
                          //     iconImg: "assets/images/news.png",
                          //     onPressed: () async {
                          //       FirebaseUtil.logEvent(
                          //           FlurryEventName.OPEN_GOLD_PRICE);
                          //       Get.to(
                          //         const GoldPrice(),
                          //         binding: GoldPriceBinding(),
                          //         transition: Transition.rightToLeft,
                          //       );
                          //     },
                          //     isLast: false),
                          MoreCellView(
                              title: Strings.contactUs,
                              iconImg: "assets/images/contact_us.png",
                              onPressed: () async {

                                ApiClient()
                                    .navigateToWebView(controller.contactUsUrl);
                              },
                              isLast: false),
                          MoreCellView(
                              title: Strings.termCondition,
                              iconImg: "assets/images/terms_conditions.png",
                              onPressed: () async {


                                ApiClient()
                                    .navigateToWebView(controller.termUrl);
                              },
                              isLast: false),
                          MoreCellView(
                              title: Strings.privacyPolicy,
                              iconImg: "assets/images/privacy.png",
                              onPressed: () async {

                                ApiClient()
                                    .navigateToWebView(controller.privacyPolicyUrl);
                              },
                              isLast: false),

                          MoreCellView(
                              title: Strings.disclaimer,
                              iconImg: "assets/images/disclaimer.png",
                              onPressed: () async {

                                ApiClient()
                                    .navigateToWebView(controller.disclaimerUrl);
                              },
                              isLast: false),


                          MoreCellView(
                              title: Strings.faqs,
                              iconImg: "assets/images/faqs.png",
                              onPressed: () async {

                                ApiClient()
                                    .navigateToWebView(controller.faqsUrl);
                              },
                              isLast: !controller.isLoggedIn.value),
                          if (controller.isLoggedIn.value)
                            MoreCellView(
                                title: Strings.logout,
                                iconImg: "assets/images/logout.png",
                                onPressed: () async {
                                  controller.showLogoutPopUp();
                                },
                                isLast: controller.isLoggedIn.value),
                        ]),
                      )),
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  child: Text(
                    controller.currentAppVersion.value,
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      color: grayColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),)
          ,
        )
        ,
      );
    });
  }
}
