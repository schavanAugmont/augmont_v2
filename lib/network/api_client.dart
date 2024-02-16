import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../Utils/utils.dart';
import 'app_exception.dart';

enum ServerType { DigiGold, EMI }

class ApiClient {
  final String _emiBaseUrl = "https://92e2-2402-a00-162-3c4-149f-f0c3-20f6-3c60.ngrok-free.app/api/";
  final String _baseUrl = "https://6460-103-247-7-54.ngrok-free.app";
  static bool LogEvent = false;

  ///Use this default timeout
  Duration get _timeout => const Duration(seconds: 120);

  /// Headers
  Map<String, String> headers([String signature = '']) {
    Map<String, String> map = {};

    map["Accept"] = "application/json";
    map["Content-Type"] = "application/json";
    map['iscustomer'] = "true";
    map['ismasking'] = "true";
    map['isapp'] = "true";

    if (SessionManager.isLoggedIn()) {
      map[HttpHeaders.authorizationHeader] =
          "Bearer ${SessionManager.getToken()}";
      map["signature"] = signature;
    }

    return map;
  }

  ///Url Builder
  Uri _uri(ServerType type, String url) {
    switch (type) {
      case ServerType.DigiGold:
        return Uri.parse("$_baseUrl/api/$url");
      case ServerType.EMI:
        return Uri.parse("$_emiBaseUrl/api/$url");
    }
  }

  Future<dynamic> getApi(String url,
      {ServerType server = ServerType.DigiGold}) async {
    var responseJson;
    try {
      var baseUrl = _uri(server, url);

      Map<String, dynamic> jsonURL = {"url": baseUrl.toString()};

      var sign = Utils().encryptAPIData(json.encode(jsonURL));

      final response =
          await http.get(baseUrl, headers: headers(sign)).timeout(_timeout);

      responseJson = _returnResponse(response);
    } catch (e) {
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> postApi(String url, String _body,
      {ServerType server = ServerType.DigiGold}) async {
    var responseJson;

    try {
      var baseUrl = _uri(server, url);

      var baseData;
      if (_body.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(_body);
        jsonData['url'] = baseUrl.toString();
        String updatedJsonString = json.encode(jsonData);
        baseData = updatedJsonString;
      }

      var sign = Utils().encryptAPIData(baseData);

      final response = await http
          .post(baseUrl, headers: headers(sign), body: _body)
          .timeout(_timeout);

      responseJson = _returnResponse(response);
    } catch (e) {
      PrintLogs.printData(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> putApi(String url, String _body,
      {ServerType server = ServerType.DigiGold}) async {
    var responseJson;

    try {
      var baseUrl = _uri(server, url);

      var baseData;
      if (_body.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(_body);
        jsonData['url'] = baseUrl.toString();
        String updatedJsonString = json.encode(jsonData);
        baseData = updatedJsonString;
      }

      var sign = Utils().encryptAPIData(baseData);

      final response = await http
          .put(baseUrl, headers: headers(sign), body: _body)
          .timeout(_timeout);

      responseJson = _returnResponse(response);
    } catch (e) {
      PrintLogs.printData(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> deleteApi(String url, String _body,
      {ServerType server = ServerType.DigiGold}) async {
    var responseJson;

    try {
      var baseUrl = _uri(server, url);

      var baseData;
      if (_body.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(_body);
        jsonData['url'] = baseUrl.toString();
        String updatedJsonString = json.encode(jsonData);
        baseData = updatedJsonString;
      }

      var sign = Utils().encryptAPIData(baseData);

      final response = await http
          .delete(baseUrl, headers: headers(sign), body: _body)
          .timeout(_timeout);

      responseJson = _returnResponse(response);
    } catch (e) {
      PrintLogs.printData(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    if (kDebugMode) {
      log("Url => ${response.request?.url}");
      log("Status Code => ${response.statusCode}");
      log("Response => ${response.body}");
    }

    switch (response.statusCode) {
      case 200:
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

   navigateToWebView(String url) {
    PrintLogs.printData(url);
    // Get.to(
    //       () => WebViewScreen(
    //     url: _webUrl + url,
    //   ),
    //   transition: Transition.rightToLeft,
    // );
  }

//W1WE
   navigateToPDFView(String url) {
    // Get.to(
    //       () => PdfViewerScreen(
    //     url: _webUrl + url,
    //     showDownloadButton: false,
    //   ),
    //   transition: Transition.rightToLeft,
    // );
  }
}
