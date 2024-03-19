class FDPassbookDetailsModel {
  bool? isSuccess;
  Data? data;

  FDPassbookDetailsModel({this.isSuccess, this.data});

  FDPassbookDetailsModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? statusCode;
  String? message;
  Result? result;

  Data({this.statusCode, this.message, this.result});

  Data.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  FDData? data;

  Result({this.data});

  Result.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new FDData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FDData {
  String? investedGold;
  String? goldInterest;

  FDData({this.investedGold, this.goldInterest});

  FDData.fromJson(Map<String, dynamic> json) {
    investedGold = json['investedGold'];
    goldInterest = json['goldInterest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['investedGold'] = this.investedGold;
    data['goldInterest'] = this.goldInterest;
    return data;
  }
}
