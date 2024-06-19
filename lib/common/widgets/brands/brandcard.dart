import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verifed_icon.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../images/t_circular_image.dart';
import '../product_cards/rounded_container.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: TImages.watch,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
              ),
            ),

            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /// text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                      title: 'Apple', brandTextSize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
