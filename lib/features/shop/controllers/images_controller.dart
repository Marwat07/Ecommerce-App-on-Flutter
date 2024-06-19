// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:t_store/features/shop/models/product_model.dart';
//
// class ImagesController extends GetxController {
//   static ImagesController get instance => Get.find();
//
//   /// variable
//   RxString selectedProductImage = ''.obs;
//
//   /// Get All Image
//   List<String> getAllProductImage(ProductModel product) {}
//
//   // use set to add unique image only
//   Set<String> images = {};
//
//   // Load Thumbnail image
//   images.add(product.thumbnail);
//
//   // Assign Thumbnail as Selected Image
//   selectedProductImage.value = product.thumbnail;
//
//   if (product.images != null) {
//   images.addAll(product.images!);
//   }
//   // Get all image form the product
//   if (product.productVariations != null || product.productVariation!.isNotEmpty){
//   images.addAll(product.productVariation!.map((variation) => variation.image));
//   }
// }
//
//   /// Show Image popup
//   void showEnlargedImage(String image ) {}
//
// }
