import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories.authentication/banners/banners_repositiory.dart';
import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banner
  Future<void> fetchBanners() async {
    try {
      // Show loader while lading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Sorry', message: e.toString());
    } finally {
      // remove Loader
      isLoading.value = false;

    }
  }
}