import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/user_review_card.dart';

import '../../../../common/widgets/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

        /// Appbar
        appBar: const TAppBar(
            title: Text('Reviews & Ratings'), showBackArrow: true),

        /// Body
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Ratings and Reviews are verified and are form people who use the same type of device that you use."),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// overall Product Ratings
                const TOverallProductRating(),
                const TRatingBarIndicator(rating: 3.5),
                Text("12,633", style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: TSizes.spaceBtwSections),


                /// User Review list
                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),


              ],
            ),
          ),
        ));
  }
}



