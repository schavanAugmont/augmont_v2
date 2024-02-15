class LiveRateModel {
  LiveRateModel({
      String? purity, 
      String? rate, 
      String? transactionType, 
      String? city, 
      String? state, 
      String? metalType,}){
    _purity = purity;
    _rate = rate;
    _transactionType = transactionType;
    _city = city;
    _state = state;
    _metalType = metalType;
}

  LiveRateModel.fromJson(dynamic json) {
    _purity = json['purity'];
    _rate = json['rate'];
    _transactionType = json['transactionType'];
    _city = json['city'];
    _state = json['state'];
    _metalType = json['metalType'];
  }
  String? _purity;
  String? _rate;
  String? _transactionType;
  String? _city;
  String? _state;
  String? _metalType;

  String? get purity => _purity;
  String? get rate => _rate;
  String? get transactionType => _transactionType;
  String? get city => _city;
  String? get state => _state;
  String? get metalType => _metalType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['purity'] = _purity;
    map['rate'] = _rate;
    map['transactionType'] = _transactionType;
    map['city'] = _city;
    map['state'] = _state;
    map['metalType'] = _metalType;
    return map;
  }

}