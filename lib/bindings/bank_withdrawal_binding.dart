import 'package:get/get.dart';

import '../controllers/bank_withdrawal_controller.dart';

class BankWithdrawalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankWithdrawalController>(() => BankWithdrawalController());
  }
}