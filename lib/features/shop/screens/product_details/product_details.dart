
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/product_details_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key,  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return   Scaffold(
      bottomNavigationBar:  const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 Product Image Slider

            TProductImageSlider(),

            /// 2 Product Details
            Padding(
                padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating and Share button
                  
                  const TRatingAndShare(),
                  
                  /// Price, Title, Stock, Brand
                  
                  const TProductMetaData(),
                  /// Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  /// checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),


                  /// Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                      'When measured as a standard rectangular shape, the screens are 13.6 inches and 15.3 inches diagonally (actual viewable area is less). Testing conducted by Apple in May 2022 using preproduction 13-inch MacBook Air systems with Apple M2, 8-core CPU, 8-core GPU, 8GB of RAM, and 256GB SSD.',
                       trimLines: 2,
                       trimMode: TrimMode.Line,
                       trimCollapsedText: 'Show more',
                       trimExpandedText: 'Less',
                       moreStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                       lessStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews (199)', showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18),  onPressed: () => Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


