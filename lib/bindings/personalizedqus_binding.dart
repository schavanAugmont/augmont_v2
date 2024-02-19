import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:augmont_v2/controllers/forgotpin_controller.dart';
import 'package:augmont_v2/controllers/personalizeQuestion_controller.dart';
import 'package:get/get.dart';

import '../Controllers/intro_controller.dart';

class PersonalizedQuesBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalizeQuestionController>(
      () => PersonalizeQuestionController(),
      fenix: true,
    );
  }
}
