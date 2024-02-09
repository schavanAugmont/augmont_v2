class ScreenDataModel {
  String? message;
  List<ScreenData>? data;

  ScreenDataModel({this.message, this.data});

  ScreenDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ScreenData>[];
      json['data'].forEach((v) {
        data!.add(new ScreenData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScreenData {
  int? id;
  String? screen;
  String? image;
  String? title;
  String? description;
  Null? action;
  Null? actionTitle;
  String? order;
  String? url;

  ScreenData(
      {this.id,
        this.screen,
        this.image,
        this.title,
        this.description,
        this.action,
        this.actionTitle,
        this.order,
        this.url});

  ScreenData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    screen = json['screen'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    action = json['action'];
    actionTitle = json['actionTitle'];
    order = json['order'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['screen'] = this.screen;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['action'] = this.action;
    data['actionTitle'] = this.actionTitle;
    data['order'] = this.order;
    data['url'] = this.url;
    return data;
  }
}
