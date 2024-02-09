class SignInModel {
  String? message;
  String? token;
  bool? isQuizAvailable;
  int? customerId;
  String? productRequestId;
  dynamic prductRequestMsg;
  String? productStatus;
  bool? isPinAdded;

  SignInModel(
      {this.message,
        this.token,
        this.isQuizAvailable,
        this.customerId,
        this.productRequestId,
        this.prductRequestMsg,
        this.productStatus,
      this.isPinAdded});

  SignInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    isQuizAvailable = json['isQuizAvailable'];
    customerId = json['customerId'];
    productRequestId = json['productRequestId'];
    prductRequestMsg = json['prductRequestMsg'];
    productStatus = json['productStatus'];
    isPinAdded=json['isPinAdded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['token'] = token;
    data['isQuizAvailable'] = isQuizAvailable;
    data['customerId'] = customerId;
    data['productRequestId'] = productRequestId;
    data['prductRequestMsg'] = prductRequestMsg;
    data['productStatus'] = productStatus;
    data['isPinAdded']=isPinAdded;
    return data;
  }
}

