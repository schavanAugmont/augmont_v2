
import 'package:meta/meta.dart';
import 'dart:convert';

PersonalDetailsModel personalDetailsModelFromJson(String str) => PersonalDetailsModel.fromJson(json.decode(str));

String personalDetailsModelToJson(PersonalDetailsModel data) => json.encode(data.toJson());

class PersonalDetailsModel {
  PersonalDetailsModel({
    required this.data,
  });

  Data data;

  factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) => PersonalDetailsModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.firstName,
    this.lastName,
    this.email,
    this.panCardNumber,
    required this.mobileNumber,
  });

  String firstName;
  dynamic lastName;
  dynamic email;
  dynamic panCardNumber;
  String mobileNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    panCardNumber: json["panCardNumber"],
    mobileNumber: json["mobileNumber"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "panCardNumber": panCardNumber,
    "mobileNumber": mobileNumber,
  };
}
