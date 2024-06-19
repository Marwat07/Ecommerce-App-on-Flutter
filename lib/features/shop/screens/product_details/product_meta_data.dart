import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/product_cards/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verifed_icon.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Price and sale price
        Row(
          children: [
            /// sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
              child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            /// price
            Text('\$999',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(price: '750',isLarge: true),
          ],
        ),

        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        /// title
        const TProductTitleText(title: 'Macbook Air M2'),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),


        /// stock status
        const Row(
          children: [
            TProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems),
          ],
        ),

        const SizedBox(width: TSizes.spaceBtwItems / 1.5),


        /// brand
        Row(
          children: [
            TCircularImage(image: TImages.laptop1,
            width: 32,
            height: 32,
            overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            const TBrandTitleWithVerifiedIcon(title: 'Apple', brandTextSize: TextSizes.medium),

          ],
        ),




      ],
    );
  }
}
