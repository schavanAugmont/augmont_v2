import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../Utils/utils.dart';
import 'app_exception.dart';

class ApiBaseHelper {
  //TEST Server URL's
  // final String _baseUrl = "https://goldcustomer.nimapinfotech.com/api/";
  // final String _emiBaseUrl = "https://emiapi.nimapinfotech.com/api/";
  // final String _webUrl = "https://goldcustomer.nimapinfotech.com/";
  // static bool LogEvent = false;

  //Gold EMI
  // final String _baseUrl = "https://goldminecustomer.augmont.com";
  // final String _emiBaseUrl = "https://merge.augmont.com/emi-goldmine/api/";
  // final String _webUrl = "https://goldminecustomer.augmont.com/";
  // static bool LogEvent = false;

  //UAT URL's
  // final String _emiBaseUrl = "https://emiapiuat.augmont.com/api/";
  // final String _baseUrl = "https://golduatcustomer.augmont.com";
  // final String _webUrl = "https://golduatcustomer.augmont.com/";
  // static bool LogEvent = false;

  // PRODUCTION URL's
  // final String _emiBaseUrl = "https://emi.augmont.com/api/";
  // final String _baseUrl = "https://www.augmont.com";
  // final String _webUrl = "https://www.augmont.com/";
  // static bool LogEvent = true;

  final String _emiBaseUrl =
      "https://92e2-2402-a00-162-3c4-149f-f0c3-20f6-3c60.ngrok-free.app/api/";
  final String _baseUrl = "http://c5c1-103-247-6-247.ngrok-free.app";
  final String _webUrl = "http://c5c1-103-247-6-247.ngrok-free.app/";
  static bool LogEvent = false;

  //
  // final String _sipUrl = "https://sipwvuat.augmont.com/api/";

  late SessionManager sessionManager;

  final int timeOutValue = 120;

  Future<dynamic> getApi(String url, {bool isEmi = false}) async {
    var responseJson;
    sessionManager = SessionManager();
    try {
      var login = await sessionManager.isLoggedIn();
      var token = "";
      if (login) {
        token = await sessionManager.getToken();
        print(token);
      }
      //PrintLogs.printData(isEmi ? _emiBaseUrl : _baseUrl + url);
      var baseUrl = isEmi ? _emiBaseUrl : _baseUrl;
      url = isEmi ? url : "/api/$url";

      Map<String, dynamic> jsonURL = {"url": isEmi ? baseUrl + url : url};
      var sign = Utils().encryptAPIData(json.encode(jsonURL));

      print(sign);
      final response = await http.get(Uri.parse(baseUrl + url), headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        if (login) "Authorization": "Bearer $token",
        "Cache-Control": "no-cache",
        "iscustomer": "true",
        "ismasking": "true",
        'isapp': 'true',
        if (login) "signature": sign,
      }).timeout(Duration(seconds: timeOutValue));
      responseJson = _returnResponse(response);
      print(response);
    } catch (e) {
      // PrintLogs.printData(e.toString());
      return Future.error(e);
      //throw FetchDataException(message: 'No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postApi(String url, String _body,
      {bool isEmi = false}) async {
    var responseJson;
    sessionManager = SessionManager();
    try {
      var login = await sessionManager.isLoggedIn();
      var token = "";
      if (login) {
        token = await sessionManager.getToken();
      }
      var baseUrl = isEmi ? _emiBaseUrl : _baseUrl;
      url = isEmi ? url : "/api/$url";

      var baseData;
      if (_body.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(_body);
        jsonData['url'] = isEmi ? baseUrl + url : url;
        String updatedJsonString = json.encode(jsonData);
        baseData = updatedJsonString;
        print("base_camp $updatedJsonString");
      }
      var sign = Utils().encryptAPIData(baseData);

      // PrintLogs.printData(Uri.parse(baseUrl + url).toString());
      // PrintLogs.printData(_body.toString());

      final response = await http
          .post(Uri.parse(baseUrl + url),
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                if (login) "Authorization": "Bearer $token",
                "iscustomer": "true",
                "ismasking": "true",
                'isapp': 'true',
                if (login) "signature": sign,
                //if (login) "ichi": baseData,
              },
              body: _body)
          .timeout(Duration(seconds: timeOutValue));
      // PrintLogs.printData(response.statusCode.toString());
      responseJson = _returnResponse(response);
    } catch (e) {
      PrintLogs.printData(e.toString());
      return Future.error(e);
      //throw FetchDataException(message: 'No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> putApi(String url, String _body, {bool isEmi = false}) async {
    var responseJson;
    sessionManager = SessionManager();
    try {
      var login = await sessionManager.isLoggedIn();
      var token = "";
      if (login) {
        token = await sessionManager.getToken();
      }
      var baseUrl = isEmi ? _emiBaseUrl : _baseUrl;
      url = isEmi ? url : "/api/$url";

      var baseData;
      if (_body.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(_body);
        jsonData['url'] = isEmi ? baseUrl + url : url;
        String updatedJsonString = json.encode(jsonData);
        baseData = updatedJsonString;
      } else {
        Map<String, dynamic> jsonURL = {"url": isEmi ? baseUrl + url : url};
        baseData = json.encode(jsonURL);
      }
      var sign = Utils().encryptAPIData(baseData);

      // PrintLogs.printData(Uri.parse(baseUrl + url).toString());

      final response = await http
          .put(Uri.parse(baseUrl + url),
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                if (login) "Authorization": "Bearer $token",
                "iscustomer": "true",
                "ismasking": "true",
                'isapp': 'true',
                if (login) "signature": sign,
              },
              body: _body)
          .timeout(Duration(seconds: timeOutValue));
      // PrintLogs.printData(response.statusCode.toString());
      responseJson = _returnResponse(response);
    } catch (e) {
      PrintLogs.printData(e.toString());
      return Future.error(e);
      //throw FetchDataException(message: 'No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    log(response.request!.url.toString());
    log(response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        //var responseJson = json.decode(response.body.toString());
        // PrintLogs.printData(response.body.toString());
        log(response.body);

        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnAuthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw InvalidInputException(message: response.body.toString());
      case 422:
        throw UnProcessableEntity(response.body.toString());
      case 421:
        throw ProcessingPaymentException(
          message: response.body.toString(),
        );
      case 500:
      default:
        throw FetchDataException(message: response.body.toString());
    }
  }

  Future<dynamic> deleteApi(String url, {bool isEmi = false}) async {
    var responseJson;
    sessionManager = SessionManager();
    try {
      var login = await sessionManager.isLoggedIn();
      var token = "";
      if (login) {
        token = await sessionManager.getToken();
      }

      var baseUrl = isEmi ? _emiBaseUrl : _baseUrl;
      url = isEmi ? url : "/api/$url";

      Map<String, dynamic> jsonURL = {"url": isEmi ? baseUrl + url : url};
      var sign = Utils().encryptAPIData(json.encode(jsonURL));

      // PrintLogs.printData(Uri.parse(baseUrl + url).toString());

      final response = await http.delete(Uri.parse(baseUrl + url), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        if (login) "Authorization": "Bearer $token",
        "iscustomer": "true",
        "ismasking": "true",
        'isapp': 'true',
        if (login) "signature": sign,
      }).timeout(Duration(seconds: timeOutValue));
      // PrintLogs.printData(response.statusCode.toString());
      responseJson = _returnResponse(response);
    } catch (e) {
      PrintLogs.printData(e.toString());
      return Future.error(e);
      //throw FetchDataException(message: 'No Internet connection');
    }
    return responseJson;
  }

// void navigateToWebView(String url) {
//   PrintLogs.printData(url);
//   Get.to(
//     () => WebViewScreen(
//       url: _webUrl + url,
//     ),
//     transition: Transition.rightToLeft,
//   );
// }

// //W1WE
//   void navigateToPDFView(String url) {
//     Get.to(
//       () => PdfViewerScreen(
//         url: _webUrl + url,
//         showDownloadButton: false,
//       ),
//       transition: Transition.rightToLeft,
//     );
//   }
//
//   void shareProductDetails(String value) {
//     try {
//       Share.share(
//           'Hey !\nCheckout this product. ${_webUrl}gold-emi/product/$value',
//           subject: 'Gold For All - Augmont');
//     } catch (e) {
//       PrintLogs.printException(e);
//     }
//   }
}
