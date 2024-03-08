import 'package:augmont_v2/controllers/editnominee_controller.dart';
import 'package:augmont_v2/controllers/editprofile_controller.dart';
import 'package:augmont_v2/controllers/faq_controller.dart';
import 'package:augmont_v2/controllers/kycverification_controller.dart';
import 'package:augmont_v2/controllers/nominee_controller.dart';
import 'package:augmont_v2/controllers/policies_controller.dart';

import 'package:get/get.dart';

import '../controllers/wallet_controller.dart';

class MoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    Get.lazyPut<WalletController>(() => WalletController());
    Get.lazyPut<NomineeController>(() => NomineeController());
    Get.lazyPut<PoliciesController>(() => PoliciesController());
    Get.lazyPut<EditNomineeController>(() => EditNomineeController());
    Get.lazyPut<KYCVerifictionController>(() => KYCVerifictionController());
    Get.lazyPut<FAQController>(() => FAQController());
  }
}
