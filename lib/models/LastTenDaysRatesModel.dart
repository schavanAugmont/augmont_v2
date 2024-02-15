class LastTenDaysRatesModel {
  LastTenDaysRatesModel({
      int? id, 
      String? state, 
      String? city, 
      String? price, 
      int? purity, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _state = state;
    _city = city;
    _price = price;
    _purity = purity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  LastTenDaysRatesModel.fromJson(dynamic json) {
    _id = json['id'];
    _state = json['state'];
    _city = json['city'];
    _price = json['price'];
    _purity = json['purity'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  String? _state;
  String? _city;
  String? _price;
  int? _purity;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get state => _state;
  String? get city => _city;
  String? get price => _price;
  int? get purity => _purity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['state'] = _state;
    map['city'] = _city;
    map['price'] = _price;
    map['purity'] = _purity;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}