import 'package:flutter/material.dart';

import '../../../../common/widgets/texts/product_price_text.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_remove_button.dart';
import 'cart_item.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) =>  Column(
        children: [
          /// Cart item
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          /// Add Remove Button Row with total Price

          if(showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  SizedBox(width: 70),

                  /// Add Remove Button
                  TProductQualityWithAddRemoveButton(),
                ],
              ),

              /// Product total Price
              TProductPriceText(price: '750'),
            ],
          )
        ],
      ),
    );
  }
}
