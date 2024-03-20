import 'package:task_app/src/data/model/rating_model.dart';

class ProductsModel {
  final int? productsId;
  final String? productsTitle;
  final double? productsPrice;
  final String? productsDescription;
  final String? productsCategory;
  final String? productsImage;
  final RatingModel? ratingModel;

  int? get _productsId => productsId;
  String? get _productsTitle => productsTitle;
  double? get _productsPrice => productsPrice;
  String? get _productsDescription => productsDescription;
  String? get _productsCategory => productsCategory;
  String? get _productsImage => productsImage;
  RatingModel? get _ratingModel => ratingModel;

  ProductsModel(
      {required this.productsId,
      required this.productsTitle,
      required this.productsPrice,
      required this.productsDescription,
        required this.productsCategory,
      required this.productsImage,
        required this.ratingModel
});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        productsId: json['id'],
        productsTitle: json['title'],
        productsPrice: json['price'].toDouble(),
        productsDescription: json['description'],
        productsCategory: json['category'],
        productsImage: json['image'],
      ratingModel: RatingModel.fromJson(json['rating'])
        );
  }
}
