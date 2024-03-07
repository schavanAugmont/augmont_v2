import 'package:augmont_v2/controllers/editprofile_controller.dart';
import 'package:augmont_v2/controllers/nominee_controller.dart';

import 'package:get/get.dart';

import '../controllers/wallet_controller.dart';

class MoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    Get.lazyPut<WalletController>(() => WalletController());
    Get.lazyPut<NomineeController>(() => NomineeController());
  }
}
