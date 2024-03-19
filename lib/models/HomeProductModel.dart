class HomeProductModel {
  List<ProductData>? data;
  String? message;

  HomeProductModel({this.data, this.message});

  HomeProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProductData {
  int? id;
  String? subCategoryName;
  String? subCategoryImage;
  int? startingPrice;
  String? subCategoryImg;

  ProductData(
      {this.id,
        this.subCategoryName,
        this.subCategoryImage,
        this.startingPrice,
        this.subCategoryImg});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryName = json['subCategoryName'];
    subCategoryImage = json['subCategoryImage'];
    startingPrice = json['startingPrice'];
    subCategoryImg = json['subCategoryImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subCategoryName'] = this.subCategoryName;
    data['subCategoryImage'] = this.subCategoryImage;
    data['startingPrice'] = this.startingPrice;
    data['subCategoryImg'] = this.subCategoryImg;
    return data;
  }
}
