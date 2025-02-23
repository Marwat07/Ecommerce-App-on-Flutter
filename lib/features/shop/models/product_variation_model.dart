
import 'package:t_store/utils/constants/enums.dart';

class ProductVariationModel {

  final String id;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;


  ProductVariationModel({
    required this.id,
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,


  });

  /// Create Empty Function for Clean Code
  static ProductVariationModel empty() => ProductVariationModel(id: '');

  /// Json Format
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description' : description,
      'Price' : price,
      'SalePrice' : salePrice,
      'Stock' : stock,

    };
  }

  /// Map Json Oriented Document snapshot form FireBase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data ['Id'] ?? '',
      price:  double.parse((data['Price'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      image: data['Image'] ?? '',
    );
  }

}