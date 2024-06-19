

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();


  /// variable
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }


  /// Get sub category
  /// upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {

      final storage = Get.put(TFirebaseStorageService());

      for(var category in categories) {

        final file = await storage.getImageDataFromAssets(category.image);

        final url = await storage.uploadImageData('Categories',file,category.name);

        category.image = url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    }on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }
}



