
class FavoritesModel {
  FavoritesModel({
      this.status, 
      this.message, 
      });

  FavoritesModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  bool? status;
  String? message;

}