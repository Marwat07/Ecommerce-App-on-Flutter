import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_round_image.dart';
import 'package:t_store/common/widgets/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';

import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Watches'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Banner
                const TRoundedImage(width: double.infinity,imageUrl: TImages.watchSmart, applyImageRadius: true),
                const SizedBox(height: TSizes.spaceBtwSections),


                /// Sub Categories
                Column(
                  children: [
                    /// heading
                    TSectionHeading(title: 'Smart Watches', onPressed: (){}),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                          itemBuilder: (context, index) => const TProductCardHorizontal(),
                      ),
                    ),


                  ],
                )
              ],
            ),

        ),
      ),
      
    );
  }
}

