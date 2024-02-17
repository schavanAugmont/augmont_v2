import 'package:get/get.dart';

class ShopController extends GetxController with StateMixin<dynamic>{

  var currentCarouselIndex = 0.obs;
  var list = [1, 2, 3, 4];

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

  void onCarouselPageChange(int index){
    currentCarouselIndex(index);
  }

}