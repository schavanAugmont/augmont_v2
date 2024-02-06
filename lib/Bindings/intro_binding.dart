import 'package:get/get.dart';

import '../Controllers/intro_controller.dart';

class IntroBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      () => IntroController(),
      fenix: true,
    );
  }
}
