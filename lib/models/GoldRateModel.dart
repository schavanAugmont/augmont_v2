

import 'dart:convert';

GoldRateModel goldRateModelFromJson(String str) => GoldRateModel.fromJson(json.decode(str));

String goldRateModelToJson(GoldRateModel data) => json.encode(data.toJson());

class GoldRateModel {
  GoldRateModel({
    required this.message,
    required this.rate,
  });

  String message;
  Rate rate;

  factory GoldRateModel.fromJson(Map<String, dynamic> json) => GoldRateModel(
    message: json["message"],
    rate: Rate.fromJson(json["rate"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "rate": rate.toJson(),
  };
}

class Rate {
  Rate({
    required this.rates,
    required this.taxes,
    required this.blockId,
  });

  Rates rates;
  List<Tax> taxes;
  String blockId;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    rates: Rates.fromJson(json["rates"]),
    taxes: List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
    blockId: json["blockId"],
  );

  Map<String, dynamic> toJson() => {
    "rates": rates.toJson(),
    "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
    "blockId": blockId,
  };
}

class Rates {
  Rates({
    required this.gBuy,
    required this.gSell,
    required this.sBuy,
    required this.sSell,
    required this.gBuyGst,
    required this.sBuyGst,
  });

  String gBuy;
  String gSell;
  String sBuy;
  String sSell;
  String gBuyGst;
  String sBuyGst;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
    gBuy: json["gBuy"],
    gSell: json["gSell"],
    sBuy: json["sBuy"],
    sSell: json["sSell"],
    gBuyGst: json["gBuyGst"],
    sBuyGst: json["sBuyGst"],
  );

  Map<String, dynamic> toJson() => {
    "gBuy": gBuy,
    "gSell": gSell,
    "sBuy": sBuy,
    "sSell": sSell,
    "gBuyGst": gBuyGst,
    "sBuyGst": sBuyGst,
  };
}

class Tax {
  Tax({
    required this.type,
    required this.taxPerc,
  });

  String type;
  String taxPerc;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    type: json["type"],
    taxPerc: json["taxPerc"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "taxPerc": taxPerc,
  };
}
