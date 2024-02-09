import 'dart:convert';

CustomerDetailsModel customerDetailsModelFromJson(String str) =>
    CustomerDetailsModel.fromJson(json.decode(str));

String customerDetailsModelToJson(CustomerDetailsModel data) =>
    json.encode(data.toJson());

class CustomerDetailsModel {
  CustomerDetailsModel({
    required this.statusCode,
    required this.message,
    required this.result,
  });

  int statusCode;
  String message;
  Result result;

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      CustomerDetailsModel(
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
    required this.userName,
    required this.uniqueId,
    required this.customerMappedId,
    required this.mobileNumber,
    this.dateOfBirth,
    this.gender,
    this.userEmail,
    required this.userAddress,
    required this.userStateId,
    required this.userCityId,
    required this.userPincode,
    this.nomineeName,
    this.nomineeRelation,
    this.nomineeDateOfBirth,
    required this.kycStatus,
    required this.userState,
    required this.userCity,
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.stateId,
    required this.cityId,
  });

  String? userName;
  String? uniqueId;
  String? customerMappedId;
  String? mobileNumber;
  dynamic dateOfBirth;
  dynamic gender;
  dynamic userEmail;
  String? userAddress;
  String? userStateId;
  String? userCityId;
  String? userPincode;
  dynamic nomineeName;
  dynamic nomineeRelation;
  dynamic nomineeDateOfBirth;
  String? kycStatus;
  String? userState;
  String? userCity;
  DateTime? createdAt;
  String? firstName;
  String? lastName;
  StateId? stateId;
  CityId? cityId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json["userName"] ?? "",
        uniqueId: json["uniqueId"] ?? "",
        customerMappedId: json["customerMappedId"] ?? "",
        mobileNumber: json["mobileNumber"] ?? "",
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        userEmail: json["userEmail"] ?? "",
        userAddress: json["userAddress"] ?? "",
        userStateId: json["userStateId"] ?? "",
        userCityId: json["userCityId"] ?? "",
        userPincode: json["userPincode"] ?? "",
        nomineeName: json["nomineeName"] ?? "",
        nomineeRelation: json["nomineeRelation"] ?? "",
        nomineeDateOfBirth: json["nomineeDateOfBirth"] ?? "",
        kycStatus: json["kycStatus"] ?? "",
        userState: json["userState"] ?? "",
        userCity: json["userCity"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        stateId:
            json["stateId"] != null ? StateId.fromJson(json["stateId"]) : null,
        cityId: json["cityId"] != null ? CityId.fromJson(json["cityId"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "uniqueId": uniqueId,
        "customerMappedId": customerMappedId,
        "mobileNumber": mobileNumber,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "userEmail": userEmail,
        "userAddress": userAddress,
        "userStateId": userStateId,
        "userCityId": userCityId,
        "userPincode": userPincode,
        "nomineeName": nomineeName,
        "nomineeRelation": nomineeRelation,
        "nomineeDateOfBirth": nomineeDateOfBirth,
        "kycStatus": kycStatus,
        "userState": userState,
        "userCity": userCity,
        "createdAt": createdAt?.toIso8601String(),
        "firstName": firstName,
        "lastName": lastName,
        "stateId": stateId?.toJson(),
        "cityId": cityId?.toJson(),
      };
}

class CityId {
  CityId({
    required this.id,
    required this.name,
    required this.stateId,
    required this.slug,
    required this.isActive,
    required this.stateUniqueCode,
    required this.cityUniqueCode,
  });

  int id;
  String name;
  int stateId;
  String slug;
  bool isActive;
  String stateUniqueCode;
  String cityUniqueCode;

  factory CityId.fromJson(Map<String, dynamic> json) => CityId(
        id: json["id"],
        name: json["name"],
        stateId: json["stateId"],
        slug: json["slug"],
        isActive: json["isActive"],
        stateUniqueCode: json["stateUniqueCode"],
        cityUniqueCode: json["cityUniqueCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stateId": stateId,
        "slug": slug,
        "isActive": isActive,
        "stateUniqueCode": stateUniqueCode,
        "cityUniqueCode": cityUniqueCode,
      };
}

class StateId {
  StateId({
    required this.id,
    required this.name,
    required this.stateCode,
    required this.isActive,
    required this.stateUniqueCode,
    required this.stateNumberCode,
  });

  int id;
  String name;
  String stateCode;
  bool isActive;
  String stateUniqueCode;
  int stateNumberCode;

  factory StateId.fromJson(Map<String, dynamic> json) => StateId(
        id: json["id"],
        name: json["name"],
        stateCode: json["stateCode"],
        isActive: json["isActive"],
        stateUniqueCode: json["stateUniqueCode"],
        stateNumberCode: json["stateNumberCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stateCode": stateCode,
        "isActive": isActive,
        "stateUniqueCode": stateUniqueCode,
        "stateNumberCode": stateNumberCode,
      };
}
