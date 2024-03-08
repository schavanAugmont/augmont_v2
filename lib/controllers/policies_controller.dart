import 'dart:convert';
import 'package:augmont_v2/Network/api_client.dart';
import 'package:get/get.dart';
import '../Utils/strings.dart';
import '../models/TrusteeModel.dart';
import '../network/ErrorHandling.dart';
import '../network/Providers/MoreProvider.dart';
import '../pdf/PdfViewerScreen.dart';
import '../utils/dialog_helper.dart';

class PoliciesController extends GetxController with StateMixin<dynamic> {
  List<String> policyList = [
    Strings.grievancePolicy,
    Strings.trusteeCertificate,
    Strings.termsConditions,
    Strings.privacyPolicy,
    Strings.disclaimer
  ];

  var trusteeCert="";
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

    super.onInit();
  }

  void fetchTrusteeCert() async {
    DialogHelper.showLoading();
    MoreProvider().getTrusteeCert().then((value) {
      DialogHelper.dismissLoader();
      var jsonMap = jsonDecode(value);
      var details = TrusteeModel.fromJson(jsonMap);
      if (details.data!.url != null && details.data!.url!.isNotEmpty) {
        //navigateToFullScreenPdf(details.data!.url!);
        trusteeCert=details.data!.url!;
      } else {
        ErrorHandling.showToast("Trustee Certificate not available ");
      }
    }, onError: (error) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(error);
    });
  }

  void navigateToFullScreenPdf(String route) {
    var image = "";
    if (route == Strings.grievancePolicy) {
      image = gerpolicyURL;
    }
    if (route == Strings.termsConditions) {
      image = termUrl;
    }
    if (route == Strings.privacyPolicy) {
      image = privacyPolicyUrl;
    }
    if (route == Strings.disclaimer) {
      image = disclaimerUrl;
    }

    ApiClient().navigateToPDFView(image,route);
  }

  void onBack() {
    Get.back();
  }
}
