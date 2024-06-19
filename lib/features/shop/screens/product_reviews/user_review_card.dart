import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/product_cards/rounded_container.dart';
import 'package:t_store/common/widgets/ratings/rating_indicator.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(backgroundImage: AssetImage(TImages.profile)),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Johny Deep', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text('03 Jan 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchase!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        /// Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child:  Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('VM Store', style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Jan 2024', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchase!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),


              ],
            ),
          ),

        ),
        const SizedBox(height: TSizes.spaceBtwSections),





      ],
    );
  }
}
