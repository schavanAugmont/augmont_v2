class CusomerInfoQuestionModel {
  String? message;
  List<CusomerInfoQuestion>? cusomerInfoQuestion;

  CusomerInfoQuestionModel({this.message, this.cusomerInfoQuestion});

  CusomerInfoQuestionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['cusomerInfoQuestion'] != null) {
      cusomerInfoQuestion = <CusomerInfoQuestion>[];
      json['cusomerInfoQuestion'].forEach((v) {
        cusomerInfoQuestion!.add(new CusomerInfoQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.cusomerInfoQuestion != null) {
      data['cusomerInfoQuestion'] =
          this.cusomerInfoQuestion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CusomerInfoQuestion {
  int? id;
  String? question;
  List<String>? option;
  String? type;
  String? trigerPoint;

  CusomerInfoQuestion(
      {this.id, this.question, this.option, this.type, this.trigerPoint});

  CusomerInfoQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    if (json['option'] != null) {
      option = json['option'].cast<String>();
    }
    type = json['type'];
    trigerPoint = json['trigerPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.option != null) {
      data['option'] = this.option;
    }
    data['type'] = this.type;
    data['trigerPoint'] = this.trigerPoint;
    return data;
  }
}
