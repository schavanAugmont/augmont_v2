import 'dart:convert';
import 'dart:developer';
import 'package:augmont_v2/Utils/print_logs.dart';
import 'package:augmont_v2/Utils/strings.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:intl/intl.dart';

class Utils {
  var panPattern = "(([A-Za-z]{5})([0-9]{4})([A-Za-z]))";

  var ifscPattern = "[A-Z]{4}0[A-Z0-9]{6}\$";

  ///https://www.rbi.org.in/scripts/PublicationReportDetails.aspx?ID=695#UAN
  var accNumberPattern = "[0-9]{9,18}";

  var emailPattern = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$";

  static String SECRET_KEY = "TSHZ2_AUGMONT_CY2RG";
  static String SECRET_IV = "4WI3R_AUGMONT_OVEEC";
  // static String SECRET_API =
  //     "3056301006072a8648ce3d020106052b8104000a0342000499c5f442c3264bcdfb093b0bc820e3f0f6546972856ebec2f8ccc03f49abdb47ffcfcaf4f37e0ec53050760e74014767e30a8a3e891f4db8c83fa27627898f15";

  static String SECRET_API =
      "D93tsOo4RF838h2rvzir8K1n1pkLGW6au2p6IfoUN84jk2F5B45pXfPJ8EjhV4KOs6j7180Myj1HPO6kmct5NtKd698Y2XUMr1WjIN4lTxT8GK59C9o4C57XQw9o432PwVl4f99DxJVZuWma8q831jLOodTAGZz8dBkM8ye2YHcP7r2T6vGjaGYZ07CHUHpEAznP4a9v";

  ///initialize the number format
  final NumberFormat _numberFormat = NumberFormat.currency(
      locale: 'en_IN', symbol: Strings.rupeesSymbol, decimalDigits: 2);

  bool validatePAN(String pan) {
    var reg = RegExp(panPattern);
    return reg.hasMatch(pan);
  }

  bool validateIFSC(String ifsc) {
    var reg = RegExp(ifscPattern);
    return reg.hasMatch(ifsc);
  }

  bool validateAccNum(String accNum) {
    var reg = RegExp(accNumberPattern);

    if (int.parse(accNum) == 0) {
      return false;
    }
    return reg.hasMatch(accNum);
  }

  bool validateEmail(String accNum) {
    var reg = RegExp(emailPattern);
    return reg.hasMatch(accNum);
  }

  String encryptData(String data) {
    var keyBytes = utf8.encode(SECRET_KEY);
    var key_hash = sha256.convert(keyBytes).toString().substring(0, 32);
    var ivBytes = utf8.encode(SECRET_IV);
    var iv_hash = sha256.convert(ivBytes).toString().substring(0, 16);
    final key = Key.fromUtf8(key_hash);
    final iv = IV.fromUtf8(iv_hash);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = encrypter.encrypt(data, iv: iv);
    PrintLogs.printData(encrypted.base64);

    return encrypted.base64;
  }

  String decryptData(String data) {
    var keyBytes = utf8.encode(SECRET_KEY);
    var key_hash = sha256.convert(keyBytes).toString().substring(0, 32);
    var ivBytes = utf8.encode(SECRET_IV);
    var iv_hash = sha256.convert(ivBytes).toString().substring(0, 16);
    final key = Key.fromUtf8(key_hash);
    final iv = IV.fromUtf8(iv_hash);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final decrypted = encrypter.decrypt64(data, iv: iv);

    PrintLogs.printData(decrypted);

    return decrypted;
  }

  String getTodaysDate() {
    var now = DateTime.now();
    var formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    String depositDate = formatter.format(now);
    return depositDate;
  }

  ///call this function to format the number

  String toCurrency(dynamic value) {
    try {
      return _numberFormat.format(double.parse(value.toString()));
    } catch (e) {
      PrintLogs.printException(e);
      return '$value';
    }
  }

  String encryptAPIData(String data) {
    Map<String, dynamic> jsonMap = jsonDecode(data);
    dynamic dynamicJsonObject = jsonMap;
    dynamic modifiedJsonObject = removeTrailingZeroes(dynamicJsonObject);

    final keyBytes = utf8.encode(SECRET_API);
    final plainBytes = utf8.encode(jsonEncode(modifiedJsonObject));
    final hmac = Hmac(sha256, keyBytes);

    final digest = hmac.convert(plainBytes);
    final encryptedBytes = digest.bytes;

    // Convert the encrypted bytes to a hex string
    final encryptedHex = encryptedBytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();



    print("base_camp $data");
    print("base_camp $encryptedHex");
    log("base_camp $data");
    return encryptedHex;
  }

  dynamic removeTrailingZeroes(dynamic jsonElement) {
    if (jsonElement is Map<String, dynamic>) {
      // For JSON objects
      Map<String, dynamic> modifiedObject = {};
      jsonElement.forEach((key, value) {
        print(key);
        modifiedObject[key] = removeTrailingZeroes(value);
      });
      return modifiedObject;
    } else if (jsonElement is List<dynamic>) {
      // For JSON arrays
      List<dynamic> modifiedArray = [];
      jsonElement.forEach((element) {
        modifiedArray.add(removeTrailingZeroes(element));
      });
      return modifiedArray;
    } else if (jsonElement is double) {
      // For numeric values
      print(jsonElement);
      return convertData(jsonElement);
    } else {
      // For other types
      return jsonElement;
    }
  }


  static dynamic convertData(dynamic value) {
    try {
      if (value % 1 == 0) {
        int myInt = value.toInt();
        return myInt;
      } else {
        return value;
      }
    } catch (e) {
      return value;
    }
  }


}
