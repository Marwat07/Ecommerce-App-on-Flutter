import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/images/t_round_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// main image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius),
                child:
                Center(child: Image(image: AssetImage(TImages.pd))),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.pd1,

                  ),
                ),
              ),
            ),

            /// AppBar Icons
            const TAppBar(
              showBackArrow: true,
              actions:[TCircularIcon(icon: Iconsax.heart5,color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}
