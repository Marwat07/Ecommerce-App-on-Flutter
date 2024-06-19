import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/authentication/screens/widgets/home_appbar.dart';
import 'package:t_store/features/authentication/screens/widgets/home_categories.dart';
import 'package:t_store/features/authentication/screens/widgets/promo_slider.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/image_string.dart';

import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/layouts/grid_layouts.dart';
import '../../../common/widgets/product_cards/product_card_vertical.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/sizes.dart';
import '../../shop/controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          /// Header ---
          const TPrimaryHeaderContainer(
            child: Column(children: [
              /// Appbar
              THomeAppBar(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// searchbar
              TSearchContainer(text: 'Search in Store'),
              SizedBox(height: TSizes.spaceBtwSections),

              /// categories
              Padding(
                padding: EdgeInsets.only(left: TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// heading
                    TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: Colors.white),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///  list categories
                    THomeCategories(),
                  ],
                ),
              ),
              SizedBox(height: TSizes.spaceBtwSections),
            ]),
          ),

          /// body banners
          Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// promo slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// heading
                  TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Popular Products
                      TGridLayout(itemCount: 2 ,itemBuilder: (_, index) => const TProductCardVertical())
    ],
                  ),
    ),
    ],
              ),
        ),

      );

  }
}
