import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layouts.dart';
import 'package:t_store/common/widgets/product_cards/product_card_vertical.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/home.dart';
import '../../models/product_model.dart';

class FavourItemScreen extends StatelessWidget {
  const FavourItemScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: TGridLayout(
              itemCount: 2,
              itemBuilder: (_, index) => const TProductCardVertical(),
        ),
      ),
      ),
    );
  }
}
