import 'dart:convert';

GenerateOtpModel generateOtpModelFromJson(String str) =>
    GenerateOtpModel.fromJson(json.decode(str));

String generateOtpModelToJson(GenerateOtpModel data) =>
    json.encode(data.toJson());

class GenerateOtpModel {
  GenerateOtpModel({
    required this.message,
    required this.referenceCode,
    required this.isCustomer,
  });

  String message;
  String referenceCode;
  bool isCustomer;

  factory GenerateOtpModel.fromJson(Map<String, dynamic> json) =>
      GenerateOtpModel(
        message: json["message"],
        referenceCode: json["referenceCode"],
        isCustomer: json["isCustomer"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "referenceCode": referenceCode,
        "isCustomer": isCustomer,
      };
}
