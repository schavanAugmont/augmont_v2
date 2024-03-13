import 'package:augmont_v2/widgets/payment_method_widget.dart';
import 'package:get/get.dart';

class BankWithdrawalController extends GetxController with StateMixin<dynamic>{

  var list = [
    ("Gold Vault",'All One-time investments'),
    ("Wedding Jewellery",'Monthly SIP'),
    ("Cricket",'Monthly SIP | Gold+'),
  ];

  var all = false.obs;

  RefundMode? refundMode;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}