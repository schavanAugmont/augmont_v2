import 'package:get/get.dart';

import '../Controllers/home_controller.dart';
import '../Controllers/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
      fenix: true,
    );
    // Get.lazyPut<WalletController>(
    //   () => WalletController(),
    //   fenix: true,
    // );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    // Get.lazyPut<MoreController>(
    //   () => MoreController(),
    //   fenix: true,
    // );
    // Get.lazyPut<MyProfileController>(
    //   () => MyProfileController(),
    //   fenix: true,
    // );
  }
}
