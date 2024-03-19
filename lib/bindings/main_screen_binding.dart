import 'package:augmont_v2/controllers/shop_controller.dart';
import 'package:get/get.dart';

import '../Controllers/home_controller.dart';
import '../Controllers/main_screen_controller.dart';
import '../controllers/more_controller.dart';
import '../controllers/wallet_controller.dart';
import '../controllers/wallets_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController(), fenix: true);
    Get.lazyPut<WalletController>(
      () => WalletController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<MoreController>(() => MoreController(), fenix: true);
    Get.lazyPut<ShopController>(() => ShopController(), fenix: true);
    // Get.lazyPut<MyProfileController>(
    //   () => MyProfileController(),
    //   fenix: true,
    // );
  }
}
