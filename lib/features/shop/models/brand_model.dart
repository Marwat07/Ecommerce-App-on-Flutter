
import 'package:flutter/material.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({required this.id, required this.image, required this.name, this.isFeatured, this.productsCount});

  /// Empty helper function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert model to Json
  toJson() {
    return {
      'Id' : id,
      'Name' : name,
      'Image' : image,
      'ProductCount' : productsCount,
      'IsFeatured' : isFeatured,
    };
  }

  /// Map Json oriented document snapshot form firebase to usermodel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }









  }