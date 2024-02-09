class PersonalInfoModel {
  PersonalInfoModel({
    String? message,
    UserData? data,
  }) {
    _message = message;
    _data = data;
  }

  PersonalInfoModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  String? _message;
  UserData? _data;

  String? get message => _message;

  UserData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class UserData {
  UserData({
    int? id,
    String? customerUniqueId,
    int? internalBranchId,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    dynamic email,
    String? kycStatus,
    String? panCardNumber,
    int? stageId,
    int? statusId,
    String? comment,
    int? stateId,
    int? cityId,
    int? pinCode,
    String? panType,
    String? panImage,
    dynamic form60Image,
    String? scrapKycStatus,
    String? digiKycStatus,
    String? emiKycStatus,
    String? customerAddress,
    dynamic gender,
    dynamic dateOfBirth,
    double? currentWalletBalance,
    double? walletFreeBalance,
    String? age,
    State? state,
    City? city,
    InternalBranch? internalBranch,
    KycApproval? kycApproval,
    String? panImg,
    String? gstNumber,
  }) {
    _id = id;
    _customerUniqueId = customerUniqueId;
    _internalBranchId = internalBranchId;
    _firstName = firstName;
    _lastName = lastName;
    _mobileNumber = mobileNumber;
    _email = email;
    _kycStatus = kycStatus;
    _panCardNumber = panCardNumber;
    _stageId = stageId;
    _statusId = statusId;
    _comment = comment;
    _stateId = stateId;
    _cityId = cityId;
    _pinCode = pinCode;
    _panType = panType;
    _panImage = panImage;
    _form60Image = form60Image;
    _scrapKycStatus = scrapKycStatus;
    _digiKycStatus = digiKycStatus;
    _emiKycStatus = emiKycStatus;
    _customerAddress = customerAddress;
    _gender = gender;
    _dateOfBirth = dateOfBirth;
    _currentWalletBalance = currentWalletBalance;
    _walletFreeBalance = walletFreeBalance;
    _age = age;
    _state = state;
    _city = city;
    _internalBranch = internalBranch;
    _kycApproval = kycApproval;
    _panImg = panImg;
    _gstNumber = gstNumber;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _customerUniqueId = json['customerUniqueId'] ?? "";
    _internalBranchId = json['internalBranchId'] ?? 0;
    _firstName = json['firstName'] ?? "";
    _lastName = json['lastName'] ?? "";
    _mobileNumber = json['mobileNumber'] ?? "";
    _email = json['email'] ?? "";
    _kycStatus = json['kycStatus'] ?? "";
    _panCardNumber = json['panCardNumber'] ?? "";
    _stageId = json['stageId'] ?? 0;
    _statusId = json['statusId'] ?? 0;
    _comment = json['comment'] ?? "";
    _stateId = json['stateId'] ?? 0;
    _cityId = json['cityId'] ?? 0;
    _pinCode = json['pinCode'] ?? 0;
    _panType = json['panType'] ?? "";
    _panImage = json['panImage'] ?? "";
    _form60Image = json['form60Image'];
    _scrapKycStatus = json['scrapKycStatus'] ?? "";
    _digiKycStatus = json['digiKycStatus'] ?? "";
    _emiKycStatus = json['emiKycStatus'] ?? "";
    _customerAddress = json['customerAddress'] ?? "";
    _gender = json['gender'];
    _dateOfBirth = json['dateOfBirth'];
    _currentWalletBalance = json['currentWalletBalance'].toDouble() ?? 0.0;
    _walletFreeBalance = json['walletFreeBalance'].toDouble() ?? 0.0;
    _age = json['age'] ?? "";
    _state = json['state'] != null ? State.fromJson(json['state']) : null;
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _internalBranch = json['internalBranch'] != null
        ? InternalBranch.fromJson(json['internalBranch'])
        : null;
    _kycApproval = json['kycApproval'] != null
        ? KycApproval.fromJson(json['kycApproval'])
        : null;
    _panImg = json['panImg'] ?? "";
    _gstNumber = json['gstNumber'] ?? "";
  }

  int? _id;
  String? _customerUniqueId;
  int? _internalBranchId;
  String? _firstName;
  String? _lastName;
  String? _mobileNumber;
  dynamic _email;
  String? _kycStatus;
  String? _panCardNumber;
  int? _stageId;
  int? _statusId;
  String? _comment;
  int? _stateId;
  int? _cityId;
  int? _pinCode;
  String? _panType;
  String? _panImage;
  dynamic _form60Image;
  String? _scrapKycStatus;
  String? _digiKycStatus;
  String? _emiKycStatus;
  String? _customerAddress;
  dynamic _gender;
  dynamic _dateOfBirth;
  double? _currentWalletBalance;
  double? _walletFreeBalance;
  String? _age;
  State? _state;
  City? _city;
  KycApproval? _kycApproval;
  InternalBranch? _internalBranch;
  String? _panImg;
  String? _gstNumber;

  int? get id => _id;

  String? get customerUniqueId => _customerUniqueId;

  int? get internalBranchId => _internalBranchId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get mobileNumber => _mobileNumber;

  dynamic get email => _email;

  String? get kycStatus => _kycStatus;

  String? get panCardNumber => _panCardNumber;

  int? get stageId => _stageId;

  int? get statusId => _statusId;

  String? get comment => _comment;

  int? get stateId => _stateId;

  int? get cityId => _cityId;

  int? get pinCode => _pinCode;

  String? get panType => _panType;

  String? get panImage => _panImage;

  dynamic get form60Image => _form60Image;

  String? get scrapKycStatus => _scrapKycStatus;

  String? get digiKycStatus => _digiKycStatus;

  String? get emiKycStatus => _emiKycStatus;

  String? get customerAddress => _customerAddress;

  String? get gstNumber => _gstNumber;

  dynamic get gender{
    if(_gender!=null && _gender.toString().isNotEmpty){
      final g = (_gender.toString().toLowerCase());
      if(g.startsWith('m')) return 'Male';
      if(g.startsWith('f')) return 'Female';
      if(g.startsWith('o')) return 'Other';
    }else{
      return '';
    }
  }

  dynamic get dateOfBirth => _dateOfBirth;

  double? get currentWalletBalance => _currentWalletBalance;

  double? get walletFreeBalance => _walletFreeBalance;

  String? get age => _age;

  State? get state => _state;

  City? get city => _city;

  InternalBranch? get internalBranch => _internalBranch;

  KycApproval? get kycApproval => _kycApproval;

  String? get panImg => _panImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['customerUniqueId'] = _customerUniqueId;
    map['internalBranchId'] = _internalBranchId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['mobileNumber'] = _mobileNumber;
    map['email'] = _email;
    map['kycStatus'] = _kycStatus;
    map['panCardNumber'] = _panCardNumber;
    map['stageId'] = _stageId;
    map['statusId'] = _statusId;
    map['comment'] = _comment;
    map['stateId'] = _stateId;
    map['cityId'] = _cityId;
    map['pinCode'] = _pinCode;
    map['panType'] = _panType;
    map['panImage'] = _panImage;
    map['form60Image'] = _form60Image;
    map['scrapKycStatus'] = _scrapKycStatus;
    map['digiKycStatus'] = _digiKycStatus;
    map['emiKycStatus'] = _emiKycStatus;
    map['customerAddress'] = _customerAddress;
    map['gender'] = _gender;
    map['dateOfBirth'] = _dateOfBirth;
    map['currentWalletBalance'] = _currentWalletBalance;
    map['walletFreeBalance'] = _walletFreeBalance;
    map['age'] = _age;
    if (_state != null) {
      map['state'] = _state?.toJson();
    }
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_internalBranch != null) {
      map['internalBranch'] = _internalBranch?.toJson();
    }
    if (_kycApproval != null) {
      map['kycApproval'] = _kycApproval?.toJson();
    }
    map['panImg'] = _panImg;
    return map;
  }
}

/// goldLoan : true
/// goldEmi : true
/// goldScrap : true
/// digiGold : false
/// kycStatus : "approved"
/// digiKycStatus : "waiting"
/// scrapKycStatus : "approved"
/// emiKycStatus : "approved"
///

class InternalBranch {
  String? name;
  String? internalBranchUniqueId;

  InternalBranch({this.name, this.internalBranchUniqueId});

  InternalBranch.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    internalBranchUniqueId = json['internalBranchUniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['internalBranchUniqueId'] = this.internalBranchUniqueId;
    return data;
  }
}

class KycApproval {
  KycApproval({
    bool? goldLoan,
    bool? goldEmi,
    bool? goldScrap,
    bool? digiGold,
    String? kycStatus,
    String? digiKycStatus,
    String? scrapKycStatus,
    String? emiKycStatus,
  }) {
    _goldLoan = goldLoan;
    _goldEmi = goldEmi;
    _goldScrap = goldScrap;
    _digiGold = digiGold;
    _kycStatus = kycStatus;
    _digiKycStatus = digiKycStatus;
    _scrapKycStatus = scrapKycStatus;
    _emiKycStatus = emiKycStatus;
  }

  KycApproval.fromJson(dynamic json) {
    _goldLoan = json['goldLoan'] ?? false;
    _goldEmi = json['goldEmi'] ?? false;
    _goldScrap = json['goldScrap'] ?? false;
    _digiGold = json['digiGold'] ?? false;
    _kycStatus = json['kycStatus'];
    _digiKycStatus = json['digiKycStatus'];
    _scrapKycStatus = json['scrapKycStatus'];
    _emiKycStatus = json['emiKycStatus'];
  }

  bool? _goldLoan;
  bool? _goldEmi;
  bool? _goldScrap;
  bool? _digiGold;
  String? _kycStatus;
  String? _digiKycStatus;
  String? _scrapKycStatus;
  String? _emiKycStatus;

  bool? get goldLoan => _goldLoan;

  bool? get goldEmi => _goldEmi;

  bool? get goldScrap => _goldScrap;

  bool? get digiGold => _digiGold;

  String? get kycStatus => _kycStatus;

  String? get digiKycStatus => _digiKycStatus;

  String? get scrapKycStatus => _scrapKycStatus;

  String? get emiKycStatus => _emiKycStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['goldLoan'] = _goldLoan;
    map['goldEmi'] = _goldEmi;
    map['goldScrap'] = _goldScrap;
    map['digiGold'] = _digiGold;
    map['kycStatus'] = _kycStatus;
    map['digiKycStatus'] = _digiKycStatus;
    map['scrapKycStatus'] = _scrapKycStatus;
    map['emiKycStatus'] = _emiKycStatus;
    return map;
  }
}

/// id : 5838
/// name : "Mumbai suburban"
/// stateId : 22
/// slug : "NULL"
/// isActive : true
/// stateUniqueCode : "ep9kJ7Px"
/// cityUniqueCode : "eN9bEP7D"

class City {
  City({
    int? id,
    String? name,
    int? stateId,
    String? slug,
    bool? isActive,
    String? stateUniqueCode,
    String? cityUniqueCode,
  }) {
    _id = id;
    _name = name;
    _stateId = stateId;
    _slug = slug;
    _isActive = isActive;
    _stateUniqueCode = stateUniqueCode;
    _cityUniqueCode = cityUniqueCode;
  }

  City.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _stateId = json['stateId'];
    _slug = json['slug'];
    _isActive = json['isActive'];
    _stateUniqueCode = json['stateUniqueCode'];
    _cityUniqueCode = json['cityUniqueCode'];
  }

  int? _id;
  String? _name;
  int? _stateId;
  String? _slug;
  bool? _isActive;
  String? _stateUniqueCode;
  String? _cityUniqueCode;

  int? get id => _id;

  String? get name => _name;

  int? get stateId => _stateId;

  String? get slug => _slug;

  bool? get isActive => _isActive;

  String? get stateUniqueCode => _stateUniqueCode;

  String? get cityUniqueCode => _cityUniqueCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['stateId'] = _stateId;
    map['slug'] = _slug;
    map['isActive'] = _isActive;
    map['stateUniqueCode'] = _stateUniqueCode;
    map['cityUniqueCode'] = _cityUniqueCode;
    return map;
  }
}

/// id : 22
/// name : "Maharashtra"
/// stateCode : "MAH"
/// isActive : true
/// stateUniqueCode : "ep9kJ7Px"
/// stateNumberCode : 27

class State {
  State({
    int? id,
    String? name,
    String? stateCode,
    bool? isActive,
    String? stateUniqueCode,
    int? stateNumberCode,
  }) {
    _id = id;
    _name = name;
    _stateCode = stateCode;
    _isActive = isActive;
    _stateUniqueCode = stateUniqueCode;
    _stateNumberCode = stateNumberCode;
  }

  State.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _stateCode = json['stateCode'];
    _isActive = json['isActive'];
    _stateUniqueCode = json['stateUniqueCode'];
    _stateNumberCode = json['stateNumberCode'];
  }

  int? _id;
  String? _name;
  String? _stateCode;
  bool? _isActive;
  String? _stateUniqueCode;
  int? _stateNumberCode;

  int? get id => _id;

  String? get name => _name;

  String? get stateCode => _stateCode;

  bool? get isActive => _isActive;

  String? get stateUniqueCode => _stateUniqueCode;

  int? get stateNumberCode => _stateNumberCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['stateCode'] = _stateCode;
    map['isActive'] = _isActive;
    map['stateUniqueCode'] = _stateUniqueCode;
    map['stateNumberCode'] = _stateNumberCode;
    return map;
  }
}
