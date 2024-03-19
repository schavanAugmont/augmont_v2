import 'package:augmont_v2/Screens/DigitalInvestment/digiinvestment_dashborad_screen.dart';
import 'package:augmont_v2/controllers/editnominee_controller.dart';
import 'package:augmont_v2/controllers/editprofile_controller.dart';
import 'package:augmont_v2/controllers/faq_controller.dart';
import 'package:augmont_v2/controllers/kycverification_controller.dart';
import 'package:augmont_v2/controllers/myagent_controller.dart';
import 'package:augmont_v2/controllers/nominee_controller.dart';
import 'package:augmont_v2/controllers/policies_controller.dart';
import 'package:augmont_v2/controllers/support_controller.dart';
import 'package:augmont_v2/controllers/wishlist_controller.dart';

import 'package:get/get.dart';

import '../controllers/digitalinvestment_controller.dart';
import '../controllers/myorders_controller.dart';
import '../controllers/wallets_controller.dart';

class MoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    Get.lazyPut<WalletsController>(() => WalletsController());
    Get.lazyPut<NomineeController>(() => NomineeController());
    Get.lazyPut<PoliciesController>(() => PoliciesController());
    Get.lazyPut<EditNomineeController>(() => EditNomineeController());
    Get.lazyPut<KYCVerifictionController>(() => KYCVerifictionController());
    Get.lazyPut<FAQController>(() => FAQController());
    Get.lazyPut<MyAgentController>(() => MyAgentController());
    Get.lazyPut<SupportController>(() => SupportController());
    Get.lazyPut<WishlistController>(() => WishlistController());
    Get.lazyPut<MyOrdersController>(() => MyOrdersController());
    Get.lazyPut<DigitalInvestmentController>(() => DigitalInvestmentController());

  }
}
