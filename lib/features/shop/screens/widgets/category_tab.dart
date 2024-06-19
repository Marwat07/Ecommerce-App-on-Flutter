import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layouts.dart';
import 'package:t_store/common/widgets/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../common/widgets/brands/t_brand_show.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category,});

  final CategoryModel category;


  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [
        Padding(
         padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brands
            const TBrandShowcase(image: [TImages.p2,TImages.p3,TImages.p7]),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Product
            TSectionHeading(title: 'You might like',  onPressed: (){}),
            const SizedBox(height: TSizes.spaceBtwItems),

            TGridLayout(itemCount: 1, itemBuilder: (_, index) => const  TProductCardVertical()),
            const SizedBox(height: TSizes.spaceBtwSections),

    ],
        ),
      ),
    ]
    );
  }
}
