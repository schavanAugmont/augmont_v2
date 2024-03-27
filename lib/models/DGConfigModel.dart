class DGConfigModel {
  List<Data>? data;

  DGConfigModel({this.data});

  DGConfigModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? configSettingName;
  int? configSettingValue;
  ConfigDetails? configDetails;

  Data({this.configSettingName, this.configSettingValue, this.configDetails});

  Data.fromJson(Map<String, dynamic> json) {
    configSettingName = json['configSettingName'];
    configSettingValue = json['configSettingValue'];
    configDetails = json['configDetails'] != null
        ? new ConfigDetails.fromJson(json['configDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['configSettingName'] = this.configSettingName;
    data['configSettingValue'] = this.configSettingValue;
    if (this.configDetails != null) {
      data['configDetails'] = this.configDetails!.toJson();
    }
    return data;
  }
}

class ConfigDetails {
  List<TimeInterval>? daily;
  List<TimeInterval>? weekly;
  List<TimeInterval>? monthly;
  List<Grams>? grams;
  List<Amount>? amount;

  ConfigDetails(
      {this.daily, this.weekly, this.monthly, this.grams, this.amount});

  ConfigDetails.fromJson(Map<String, dynamic> json) {
    if (json['daily'] != null) {
      daily = <TimeInterval>[];
      json['daily'].forEach((v) {
        daily!.add(new TimeInterval.fromJson(v));
      });
    }
    if (json['weekly'] != null) {
      weekly = <TimeInterval>[];
      json['weekly'].forEach((v) {
        weekly!.add(new TimeInterval.fromJson(v));
      });
    }
    if (json['monthly'] != null) {
      monthly = <TimeInterval>[];
      json['monthly'].forEach((v) {
        monthly!.add(new TimeInterval.fromJson(v));
      });
    }
    if (json['grams'] != null) {
      grams = <Grams>[];
      json['grams'].forEach((v) {
        grams!.add(new Grams.fromJson(v));
      });
    }
    if (json['amount'] != null) {
      amount = <Amount>[];
      json['amount'].forEach((v) {
        amount!.add(new Amount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.daily != null) {
      data['daily'] = this.daily!.map((v) => v.toJson()).toList();
    }
    if (this.weekly != null) {
      data['weekly'] = this.weekly!.map((v) => v.toJson()).toList();
    }
    if (this.monthly != null) {
      data['monthly'] = this.monthly!.map((v) => v.toJson()).toList();
    }
    if (this.grams != null) {
      data['grams'] = this.grams!.map((v) => v.toJson()).toList();
    }
    if (this.amount != null) {
      data['amount'] = this.amount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeInterval {
  int? amount;
  bool? isPopular;

  TimeInterval({this.amount, this.isPopular});

  TimeInterval.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    isPopular = json['isPopular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['isPopular'] = this.isPopular;
    return data;
  }
}

class Grams {
  int? value;
  bool? isPopular;
  int? amount;

  Grams({this.value, this.isPopular, this.amount});

  Grams.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    isPopular = json['isPopular'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['isPopular'] = this.isPopular;
    data['amount'] = this.amount;
    return data;
  }
}

class Amount {
  int? value;
  bool? isPopular;

  Amount({this.value, this.isPopular});

  Amount.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    isPopular = json['isPopular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['isPopular'] = this.isPopular;
    return data;
  }
}
