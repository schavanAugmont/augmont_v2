
import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  StateModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
