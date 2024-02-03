import 'package:flutter/foundation.dart';

class PrintLogs {
  static void printException(Object e) {
    if (kDebugMode) {
      print("**************************\n\n");
      print(e);
      print("**************************\n\n");
    }
  }

  static void printData(String str) {
    if (kDebugMode) {
      print("**************************");
      print(str);
      print("**************************\n\n");
    }
  }
}
