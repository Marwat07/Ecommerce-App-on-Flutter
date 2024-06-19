
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/product_cards/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets/chips/choice_chip.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        /// selected attribute pricing
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.white,
          child:  Column(
            children: [
            /// Title price and Stock Status
            Row(
              children: [
                const TSectionHeading(title: 'Variation', showActionButton: false),
                const SizedBox(width: TSizes.spaceBtwItems),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                Row(
                  children: [
                    const TProductTitleText(title: 'Price: ',smallSize: true),



                    /// Actual Price
                    Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),

                    /// Sale Price
                    const TProductPriceText(price: '20'),
                  ],
                ),

                /// Stock
                Row(
                  children: [

                    const TProductTitleText(title: 'Stock : ',smallSize: true),
                    Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          ],
          ),



              /// variation Description
              const TProductTitleText(title: 'This is the Description of the Product and it can go up max 4 line',
              smallSize: true,
                maxLines: 4,
              )
          ],
        ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Attributes
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors',showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
            TChoiceChip(text: 'Grey', selected: false,onSelected: (value){}),
            TChoiceChip(text: 'Black', selected: true,onSelected: (value){}),
            TChoiceChip(text: 'White', selected: false,onSelected: (value){}),
          ],
        )
      ],
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const TSectionHeading(title: 'Size',showActionButton: false),
    const SizedBox(height: TSizes.spaceBtwItems / 2),
    Wrap(
    spacing: 8,
    children: [
    TChoiceChip(text: '14 inch', selected: false,onSelected: (value){}),
    TChoiceChip(text: '15 inch', selected: true,onSelected: (value){}),
    TChoiceChip(text: '20 inch', selected: false,onSelected: (value){}),
      ],
     )
    ],
   )
      ],
    );
  }
}

