import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/soical_button.dart';
import 'package:t_store/features/authentication/screens/signup/signup_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// social logo
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

