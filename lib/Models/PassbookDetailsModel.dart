
import 'dart:convert';

PassbookDetailsModel passbookDetailsModelFromJson(String str) => PassbookDetailsModel.fromJson(json.decode(str));

String passbookDetailsModelToJson(PassbookDetailsModel data) => json.encode(data.toJson());

class PassbookDetailsModel {
  PassbookDetailsModel({
    required this.statusCode,
    required this.message,
    required this.result,
  });

  dynamic statusCode;
  String message;
  Result result;

  factory PassbookDetailsModel.fromJson(Map<String, dynamic> json) => PassbookDetailsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    required this.data,
  });

  Data data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.goldGrms,
    required this.silverGrms,
    required this.sellableGoldBalance,
    required this.sellableSilverBalance,
  });

  String goldGrms;
  String silverGrms;
  String sellableGoldBalance;
  String sellableSilverBalance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    goldGrms: json["goldGrms"],
    silverGrms: json["silverGrms"],
    sellableGoldBalance: json["sellableGoldBalance"].toString(),
    sellableSilverBalance: json["sellableSilverBalance"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "goldGrms": goldGrms,
    "silverGrms": silverGrms,
    "sellableGoldBalance": sellableGoldBalance,
    "sellableSilverBalance": sellableSilverBalance,
  };
}
