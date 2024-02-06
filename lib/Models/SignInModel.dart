import 'dart:convert';

class SignInModel {
  String? message;
  String? token;
  bool? isQuizAvailable;
  int? customerId;
  String? productRequestId;
  dynamic prductRequestMsg;
  String? productStatus;

  SignInModel(
      {this.message,
        this.token,
        this.isQuizAvailable,
        this.customerId,
        this.productRequestId,
        this.prductRequestMsg,
        this.productStatus});

  SignInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    isQuizAvailable = json['isQuizAvailable'];
    customerId = json['customerId'];
    productRequestId = json['productRequestId'];
    prductRequestMsg = json['prductRequestMsg'];
    productStatus = json['productStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['isQuizAvailable'] = this.isQuizAvailable;
    data['customerId'] = this.customerId;
    data['productRequestId'] = this.productRequestId;
    data['prductRequestMsg'] = this.prductRequestMsg;
    data['productStatus'] = this.productStatus;
    return data;
  }
}

