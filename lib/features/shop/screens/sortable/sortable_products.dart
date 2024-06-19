import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/layouts/grid_layouts.dart';
import '../../../../common/widgets/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name','Higher Price', 'Lower Price', 'Newest','Popularity']
              .map((option) => DropdownMenuItem(value: option ,child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Product
        TGridLayout(
            itemCount: 4,
            itemBuilder: (_, index) =>  const TProductCardVertical(),
        ),
      ],

    );
  }
}
