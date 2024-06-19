import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            TCircularImage(
                image: image,
                fit: BoxFit.fitWidth,
                padding: TSizes.sm * 1.4,
                isNetworkImage: isNetworkImage,
                backgroundColor: backgroundColor,
                overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),

            /// Text
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor))
          ],
        ),
      ),
    );
  }
}
