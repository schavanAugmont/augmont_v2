import 'package:get/get.dart';

import '../controllers/loan_process_controller.dart';

class LoanProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanProcessController>(() => LoanProcessController());
  }
}