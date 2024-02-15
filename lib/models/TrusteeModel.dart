class TrusteeModel {
  TrusteeModel({
      Data? data,}){
    _data = data;
}

  TrusteeModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      int? id, 
      String? url, 
      String? filePath,}){
    _id = id;
    _url = url;
    _filePath = filePath;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _filePath = json['filePath'];
  }
  int? _id;
  String? _url;
  String? _filePath;

  int? get id => _id;
  String? get url => _url;
  String? get filePath => _filePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['filePath'] = _filePath;
    return map;
  }

}