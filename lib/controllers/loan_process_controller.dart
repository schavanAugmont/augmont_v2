import 'package:get/get.dart';

class LoanProcessController extends GetxController with StateMixin<dynamic>{
  var list = [
    (1, 'Personal & Address'),
    (2, "Service Type"),
    (3, "Location"),
    (4, "Summary"),
  ];

  var currentIndex = 1;

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
    // TODO: implement onClose
    super.onClose();
  }

}