import 'dart:convert';

WalletBalanceModel walletBalanceModelFromJson(String str) =>
    WalletBalanceModel.fromJson(json.decode(str));

String walletBalanceModelToJson(WalletBalanceModel data) =>
    json.encode(data.toJson());

class WalletBalanceModel {
  WalletBalanceModel({
    required this.walletFreeBalance,
    required this.currentWalletBalance,
    required this.customerUniqueId,
  });

  String walletFreeBalance;
  String currentWalletBalance;
  String customerUniqueId;

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) =>
      WalletBalanceModel(
        walletFreeBalance: json["walletFreeBalance"] != null
            ? json["walletFreeBalance"].toString()
            : "0.0",
        currentWalletBalance: json["currentWalletBalance"] != null
            ? json["currentWalletBalance"].toString()
            : "0.0",
        customerUniqueId: json["customerUniqueId"] != null
            ? json["customerUniqueId"].toString()
            : "",
      );

  Map<String, dynamic> toJson() => {
        "walletFreeBalance": walletFreeBalance,
        "currentWalletBalance": currentWalletBalance,
        "customerUniqueId": customerUniqueId,
      };
}
