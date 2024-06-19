import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_attributes.dart';

import 'brand_model.dart';

class ProductModel {

  String id;
  int stock;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productTypes;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;


  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productTypes,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  /// Create Empty function for clean  code
  static ProductModel empty() => ProductModel(id: '',title:  '', stock: 0, price: 0, thumbnail: '',productTypes: '');

  /// Jason Format
  toJson() {
    return {
      'Title' : title,
      'Stock' : stock,
      'Price' : price,
      'Images' : images ?? [],
      'Thumbnail' : thumbnail,
      'SalePrice' : salePrice,
      'IsFeatured' : isFeatured,
      'CategoryId' : categoryId,
      'Brand' : brand!.toJson(),
      'Description' : description,
      'ProductType' : productTypes,
      'ProductAttributes' : productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations' : productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  /// Map Json oriented document snapshot form firebase to Model
 factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productTypes: data['ProductTypes'] ?? '',
      brand:  BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
 }


  /// Map Json oriented document snapshot form firebase to Model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productTypes: data['ProductTypes'] ?? '',
      brand:  BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }













}