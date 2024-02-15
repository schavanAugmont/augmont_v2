class SignInModel {
  String? message;
  String? token;
  CustomerDetails? customerDetails;

  SignInModel({this.message, this.token, this.customerDetails});

  SignInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    customerDetails = json['customerDetails'] != null
        ? new CustomerDetails.fromJson(json['customerDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.customerDetails != null) {
      data['customerDetails'] = this.customerDetails!.toJson();
    }
    return data;
  }
}

class CustomerDetails {
  bool? isPinAdded;
  bool? isBiometricEnable;
  String? deviceId;

  CustomerDetails({this.isPinAdded, this.isBiometricEnable, this.deviceId});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    isPinAdded = json['isPinAdded'];
    isBiometricEnable = json['isBiometricEnable'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPinAdded'] = this.isPinAdded;
    data['isBiometricEnable'] = this.isBiometricEnable;
    data['deviceId'] = this.deviceId;
    return data;
  }
}
