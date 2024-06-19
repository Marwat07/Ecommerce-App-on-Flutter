import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/product_cards/rounded_container.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 15,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
      
                /// 1 Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.defaultSpace / 2),
      
                /// 2 Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontSizeDelta: 1),
                      ),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                /// 3 Icon
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
      
                      /// 1 Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.defaultSpace / 2),
      
                      /// 2 Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#23232]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      /// 1 Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.defaultSpace / 2),
      
                      /// 2 Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('02 Nov 2024', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
      
      
      
      
              ],
            ),
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
          ],
        ),
      
      ),
    );
  }
}
