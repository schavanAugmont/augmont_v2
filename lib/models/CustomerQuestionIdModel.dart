class CustomerQuestionIdModel {
  String? message;
  List<int>? customerQuestionId;

  CustomerQuestionIdModel({this.message, this.customerQuestionId});

  CustomerQuestionIdModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    customerQuestionId = json['customerQuestionId'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['customerQuestionId'] = this.customerQuestionId;
    return data;
  }
}
