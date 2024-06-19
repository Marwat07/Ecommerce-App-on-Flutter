import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/t_round_image.dart';
import 'package:t_store/common/widgets/product_cards/rounded_container.dart';
import 'package:t_store/common/widgets/product_cards/shadows.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/controllers/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_string.dart';
import '../icons/t_circular_icon.dart';
import '../texts/product_price_text.dart';
import '../texts/t_brand_title_text_with_verifed_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key,});


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    /// container with side padding
    return GestureDetector(
      onTap: () => Get.to(() =>  const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.black : TColors.white,
        ),
        child: Column(
          children: [
            /// thumbnail ,tag ,wishlist
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// image
                  const TRoundedImage(imageUrl: TImages.pd, applyImageRadius: true),

                  /// sale tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                    ),
                  ),

                  /// Favourite icon heart
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// details
             const Padding(
              padding: EdgeInsets.only(left:  TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: 'Mac Book Air M2', smallSize: true),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(title: 'Apple'),

                  ],
                ),
              ),
            ),

            const Spacer(),
            /// price Row
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                        /// price show sale main
                      const Padding(padding: EdgeInsets.only(left:  TSizes.sm),
                        child:  TProductPriceText(price: '750'),
                      ),

                /// add to card button
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomLeft: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(child: Icon(Iconsax.add, color: TColors.white))),
                ),
              ]
            ),
              ],
            ),

        ),
      );

  }
}


