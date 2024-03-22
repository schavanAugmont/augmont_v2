import 'dart:math';

import '../utils/print_logs.dart';

class RateCalculator {
  static Future<double> getAmountFromCalculation(
      String gram, double goldRate) async {
    try {
      return double.parse(gram) * goldRate;
    } catch (e) {
      PrintLogs.printException(e);
    }
    return 0.00;
  }

  static Future<double> getGramFromCalculation(
      String amount, double goldRate, String goldGstRate) async {
    try {
      var taxRate = goldRate + double.parse(goldGstRate);

      var amountDouble = double.parse(amount);

      var quan = amountDouble / taxRate;

      return quan;
    } catch (e) {
      PrintLogs.printException(e);
    }
    return 0.00;
  }
  static Future<double> getSellGramFromCalculation(
      String amount, double goldRate) async {
    try {

      var amountDouble = double.parse(amount);

      var quan = amountDouble / goldRate;

      return quan;
    } catch (e) {
      PrintLogs.printException(e);
    }
    return 0.00;
  }

  static double truncateToDecimalPlaces(double value, int fractionalDigits) {
    if (value != null) {
      if (!value.isInfinite || !value.isNaN) {
        return (value * pow(10, fractionalDigits)).truncate() /
            pow(10, fractionalDigits);
      } else {
        return value;
      }
      
      // double count = double.parse(value.toStringAsFixed(2));
      // return count;
      
    }
    return 0;
  }
}
