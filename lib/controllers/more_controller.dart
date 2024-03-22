import 'dart:convert';
import 'package:augmont_v2/Controllers/home_controller.dart';
import 'package:augmont_v2/Screens/More/ExchangeSetting/myLoan_screen.dart';
import 'package:augmont_v2/Screens/More/ExchangeSetting/soglisting_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/asstes_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/faq_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/insights_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/myagent_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/payment_setting_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/security_setting_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/support_screen.dart';
import 'package:augmont_v2/Screens/More/ProfileSetting/kyc_verification_screen.dart';
import 'package:augmont_v2/Screens/More/ProfileSetting/refferal_details_screen.dart';
import 'package:augmont_v2/Screens/More/ShopSetting/my_orders_screen.dart';
import 'package:augmont_v2/Screens/More/ShopSetting/wishlist_list_screen.dart';
import 'package:augmont_v2/Screens/More/edit_profile_screen.dart';
import 'package:augmont_v2/Screens/More/merchant_holding_screen.dart';
import 'package:augmont_v2/Screens/More/ProfileSetting/nominee_details_screen.dart';
import 'package:augmont_v2/Screens/More/pending_upcoming_payment_screen.dart';
import 'package:augmont_v2/Screens/More/OtherSettings/policies_screen.dart';
import 'package:augmont_v2/Screens/More/wallet_screen.dart';
import 'package:augmont_v2/bindings/more_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../Bindings/main_screen_binding.dart';
import '../Bindings/signin_binding.dart';
import '../Screens/Main/main_screen.dart';
import '../Screens/SignIn/signin_page1.dart';
import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';
import '../models/TrusteeModel.dart';
import '../network/ErrorHandling.dart';
import '../network/Providers/MoreProvider.dart';
import '../utils/dialog_helper.dart';
import '../widgets/text_component.dart';
import 'main_screen_controller.dart';

class MoreController extends GetxController with StateMixin<dynamic> {
  late SessionManager sessionManager;

  var isLoggedIn = false.obs;
  late ScrollController scrollController;
  var currentAppVersion = "".obs;

  List<String> profileList = [
    Strings.nomineeDetails,
    Strings.kycVerification,
    Strings.referalProgram
  ];
  List<String> shopList = [Strings.myorders, Strings.wishlist];
  List<String> exchangeList = [Strings.myLoans, Strings.sgGold];
  List<String> settingList = [Strings.securitySetting, Strings.financeSetting];
  List<String> otherList = [
    Strings.reports,
    Strings.insights,
    Strings.faqs,
    Strings.assetValue,
    Strings.getIntouch,
    Strings.myAgent,
    Strings.policies
  ];

  var aboutUsUrl = "about-us?webView=true";
  var privacyPolicyUrl = "privacy-policy?webView=true";
  var disclaimerUrl = "disclaimer?webView=true";
  var faqsUrl = "faq?webView=true";
  var contactUsUrl = "contact-us?webView=true";
  var termUrl = "terms-conditions?webView=true";
  var gerpolicyURL =
      "/assets/media/pdf/Augmont-Goldtech-Grievance-Document.pdf";
  var leadingProviderURL = "/assets/media/pdf/Augmont-GoldTech.pdf";

  @override
  void onInit() {
    scrollController = ScrollController();
    sessionManager = SessionManager();
    setVersion();
    checkLoginStatus();
    super.onInit();
  }

  void handleBackPress() {
    var controller = MainScreenController.to;
    if (controller.navigationQueue.length > 1) {
      var lastIndex;

      if (controller.navigationQueue.length >= 2) {
        int value = controller.navigationQueue.length - 2;

        lastIndex = controller.navigationQueue.elementAt(value);
      } else {
        int value = controller.navigationQueue.length - 1;
        lastIndex = controller.navigationQueue.elementAt(value);
      }

      controller.updateIndex(lastIndex);
    } else {
      controller.updateIndex(0);
    }
  }

  void showLogoutPopUp() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure?",
      titleStyle: TextStyle(
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.w700,
        color: primaryTextColor,
        fontSize: 20,
      ),
      middleTextStyle: TextStyle(
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        fontSize: 18,
      ),
      textConfirm: "Yes",
      confirmTextColor: primaryTextColor,
      buttonColor: primaryColor,
      barrierDismissible: false,
      onConfirm: () {
        SessionManager.clearAll();
        Get.back();

        Get.offAll(
          () => const SignInPage1(),
          binding: SignInBiding(),
          transition: Transition.rightToLeft,
        );
      },
      onWillPop: () async {
        return false;
      },
      textCancel: "No",
      cancelTextColor: primaryTextColor,
      onCancel: () {
        Get.back();
      },
    );
  }

  void checkLoginStatus() async {
    var bool = await SessionManager.isLoggedIn();
    isLoggedIn(bool);
    update();
  }

  void fetchTrusteeCert() async {
    DialogHelper.showLoading();
    MoreProvider().getTrusteeCert().then((value) {
      DialogHelper.dismissLoader();
      var jsonMap = jsonDecode(value);
      var details = TrusteeModel.fromJson(jsonMap);
      if (details.data!.url != null && details.data!.url!.isNotEmpty) {
        navigateToFullScreenPdf(details.data!.url!);
      } else {
        ErrorHandling.showToast("Trustee Certificate not available ");
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  void navigateToFullScreenPdf(String image) {
    // Get.to(
    //       () => PdfViewerScreen(
    //     url: image,
    //   ),
    //   transition: Transition.rightToLeft,
    // );
  }

  void setVersion() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) async {
      currentAppVersion("V" + packageInfo.version);
      update();
    });
  }

  void goToEditProfile(){
    Get.to(()=>EditProfileScreen(),binding: MoreBinding());
  }

  void goToWallet(){
    Get.to(()=>WalletScreen(),binding: MoreBinding());
  }

  void goToPaymentPage(){
    Get.to(()=>PendingUpcomingPaymentScreen(),binding: MoreBinding());
  }

  void goToMerchantPage(){
    Get.to(()=>MerchantHoldingScreen(),binding: MoreBinding());
  }

  void navtigatTo(String listDetail) {
    if(listDetail==Strings.nomineeDetails){
      Get.to(()=>NomineeDetailsScreen(),binding: MoreBinding());
    }
    if(listDetail==Strings.policies){
      Get.to(()=>PoliciesScreen(),binding: MoreBinding());
    }
    if(listDetail==Strings.kycVerification){
      Get.to(()=>KYCVerifictionScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.referalProgram){
      Get.to(()=>ReferralDetailScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.faqs){
      Get.to(()=>FAQScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.myLoans){
      Get.to(()=>MyLoanScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.sgGold){
      Get.to(()=>SOGListingScreen(),binding: MoreBinding());
    }
    if(listDetail==Strings.securitySetting){
      Get.to(()=>SecuritySettingScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.financeSetting){
      Get.to(()=>PaymentSettingScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.myagent){
      Get.to(()=>MyAgentScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.getIntouch){
      Get.to(()=>SupportScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.assetValue){
      Get.to(()=>AssetValueScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.wishlist){
      Get.to(()=>WishListScreen(),binding: MoreBinding());
    }


    if(listDetail==Strings.insights){
      Get.to(()=>InsightScreen(),binding: MoreBinding());
    }

    if(listDetail==Strings.myorders){
      Get.to(()=>MyOrdersScreen(),binding: MoreBinding());
    }
  }


  void logoutDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height * 0.35,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.logout,size: 50,),
                  SizedBox(
                    height: 10,
                  ),
                  textComponent('Are you sure?', 11, FontWeight.normal),
                  SizedBox(
                    height: 5,
                  ),
                  textComponent('Are you sure want to Log-out?', 13, FontWeight.w600),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [

                     Expanded(child:  Container(
                         child: OutlinedButton(
                           style: OutlinedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             side: const BorderSide(
                               width: 1.0,
                               color: primaryTextColor,
                             ),
                           ),
                           onPressed: () async {

                             Get.back();
                             SessionManager.clearAll();
                             SessionManager.setSelectedProduct(Strings.moduleOther);
                             SessionManager.setIsDashSelected(true);
                             update();
                             Get.offAll(() => SignInPage1(), binding: SignInBiding(), transition: Transition.rightToLeft,);

                           },
                           child: Text('Log-out',
                               style: TextStyle(
                                 color: primaryTextColor,
                                 fontFamily: Strings.fontFamilyName,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 14,
                               )),
                         )),),
                      SizedBox(width: 10,),
                      Expanded(child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40.0),
                            backgroundColor: primaryTextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          child: Text('Stay Logged In',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )))),
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

}
