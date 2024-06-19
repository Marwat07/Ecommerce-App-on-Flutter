import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layouts.dart';
import 'package:t_store/common/widgets/products_cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/brands/brandcard.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/widgets/category_tab.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';
import '../all_brands/all_brands.dart';

class Store extends StatelessWidget {
  const Store({super.key,});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// search bar
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        /// featured Brands
                        TSectionHeading(
                            title: 'Features Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(showBorder: true);
                            }),
                      ],
                    ),
                  ),

                  /// tabs
                  bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
                  ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category,)).toList()
          ),
        ),
      ),
    );
  }
}
