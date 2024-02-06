import 'dart:convert';

ApiMessage apiMessageFromJson(String str) =>
    ApiMessage.fromJson(json.decode(str));

String apiMessageToJson(ApiMessage data) => json.encode(data.toJson());

class ApiMessage {
  ApiMessage({
    required this.message,
  });

  String message;

  factory ApiMessage.fromJson(Map<String, dynamic> json) => ApiMessage(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
