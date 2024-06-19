import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import 'orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),


        /// order
        child: TOrderListItems(),
      ),
    );
  }
}
