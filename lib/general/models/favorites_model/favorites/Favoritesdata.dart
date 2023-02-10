import 'Product.dart';

class FavoritesData {
  FavoritesData({
      this.id, 
      this.product,});

  FavoritesData.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? id;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id!.toDouble();
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}