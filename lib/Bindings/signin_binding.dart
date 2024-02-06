import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:get/get.dart';

import '../Controllers/intro_controller.dart';

class SignInBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
      fenix: true,
    );
  }
}
