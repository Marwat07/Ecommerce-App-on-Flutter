import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/categories/firebase_storage_service.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

/// Repository for managing product data
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();


  /// firebase instance for database
  final _db = FirebaseFirestore.instance;


  /// Get Limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(1).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    }on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'something went wrong. Please try again';
    }
  }
  /// Upload dummy data
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      
      final storage = Get.put (TFirebaseStorageService());
      
      for (var product in products) {
        final thumbnail = await storage.getImageDataFromAssets(
            product.thumbnail);

        final url = await storage.uploadImageData('ProductCategories', thumbnail, product.thumbnail.toString());

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData(
                'ProductCategories', assetImage, image);

            imageUrl.add(url);
          }

          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        // upload variation image
        if (product.productTypes == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            final url = await storage.uploadImageData('ProductCategories', assetImage, variation.image);

            variation.image = url;
          }
        }
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }

      } on TFirebaseException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    }on SocketException catch (e) {
      throw e.message;
    }catch (e) {
      throw 'something went wrong. Please try again';
    }
      
    }

  }


