import 'Product.dart';

class Favoritesdata {
  Favoritesdata({
      this.id, 
      this.product,});

  Favoritesdata.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? id;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}