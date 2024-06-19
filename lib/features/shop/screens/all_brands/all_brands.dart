import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brandcard.dart';
import 'package:t_store/common/widgets/layouts/grid_layouts.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';

import '../../../../utils/constants/sizes.dart';
import '../all_products/brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [

                /// heading
                const TSectionHeading(title: 'Brands', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Brands
                TGridLayout(itemCount: 10,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) => TBrandCard(
                      showBorder: true, onTap: () => Get.to(() => const BrandProduct()),

                    ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
