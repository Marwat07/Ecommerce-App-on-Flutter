import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/product_cards/rounded_container.dart';
import 'package:t_store/common/widgets/success_screen/sucess_screen.dart';
import 'package:t_store/features/shop/screens/cart/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/billing_payment_section.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_string.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../cart/coupon_widget.dart';
import 'billing_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Reviews',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Items In cart
            const TCartItems(showAddRemoveButtons: false),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Coupon TextField
            const TCouponCode(),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Billing Section
            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.black : TColors.white,
              child: const Column(
                children: [

                  /// Pricing
                  TBillingAmountSections(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Divider
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Payment Method
                  TBillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Address
                  TBillingAddressSection(),
                ],
              ),
            )
          ],
        ),
      ),
    ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() =>  SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be Shipped soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
         ),
      ),

       child: const  Text('Checkout \$750.0')),

    )
    );
  }
}

