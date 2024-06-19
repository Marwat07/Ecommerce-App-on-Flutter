
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../data/repositories.authentication/product/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();


 final isLoading = false.obs;
 final productRepository = Get.put(ProductRepository());
 RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show loader while Loading Products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);

    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh sorry', message: e.toString());

    } finally {
      isLoading.value = false;

    }
  }

  /// Get the Product price or price
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variations exist
    if (product.productTypes == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      for (var variation in product.productVariations!) {


        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // update small and large price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice ) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest price are the same
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      }else {
        // otherwise
        return '$smallestPrice - \$$largestPrice';
      }
    }


  }

  /// calculate discount
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0 ) return null;
    if (originalPrice <= 0 ) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// check stock
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}

