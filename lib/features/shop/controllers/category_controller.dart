import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/categories/category_repository.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();


  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();

  }

  /// Load Category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while lading categories
      isLoading.value = true;
      // Fetch Categories form data source (FireBase,API,etc)
      final categories = await _categoryRepository.getAllCategories();

      // Update the Categories
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Sorry', message: e.toString());
    } finally {
      // remove Loader
      isLoading.value = false;

    }
  }



  /// Load selected Category

  /// Get Category or Sub category product

}