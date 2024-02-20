import '../controllers/shop_emi_controller.dart';
import 'package:get/get.dart';

class ShopEMIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopEMIController>(() => ShopEMIController());
  }
}
