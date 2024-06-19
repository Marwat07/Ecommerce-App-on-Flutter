import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brandcard.dart';
import 'package:t_store/features/shop/screens/sortable/sortable_products.dart';

import '../../../../utils/constants/sizes.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Apple')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              TSortableProducts(),

            ],
          ),
        ),
      ),
    );
  }
}
