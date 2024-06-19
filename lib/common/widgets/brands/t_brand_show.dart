import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../product_cards/rounded_container.dart';
import 'brandcard.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.image,
  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [

          /// Brand with Product Count

          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          /// Brand Top 3 Product Images

          Row(children: image.map((image) => brandTopProductImageWidget(image, context)).toList())

        ],

      ),

    );
  }
}

Widget brandTopProductImageWidget(String image,context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      child:  Image(fit: BoxFit.contain,image: AssetImage(image)),
    ),
  );
}