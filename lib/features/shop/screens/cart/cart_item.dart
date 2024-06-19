import 'package:flutter/material.dart';

import '../../../../common/widgets/images/t_round_image.dart';
import '../../../../common/widgets/texts/product_title_text.dart';
import '../../../../common/widgets/texts/t_brand_title_text_with_verifed_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// image
        TRoundedImage(
          imageUrl: TImages.pd,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title ,Price & Size

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Apple'),
              const Flexible(child: TProductTitleText(title: 'MacBook Air M2', maxLines: 1)),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Black ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '15 inch ', style: Theme.of(context).textTheme.bodyLarge),

                  ],
                ),
              ),
            ],
          ),
        ),



      ],
    );
  }
}
