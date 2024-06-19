import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/passsword_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_string.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/soical_button.dart';
import '../../../../utils/constants/text_strings.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

            /// logo title and sub title
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                  width: double.infinity,
                  height: 150,
                  image: AssetImage(
                      dark ? TImages.lightAppLogo : TImages.darkAppLogo)
              ),
              Text(
                  TTexts.loginTitle, style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: TSizes.sm),
              Text(TTexts.loginSubTitle, style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium),
            ],
          ),

          /// form
          const TLoginForm(),
          /// divider
          TFormDivider(dividerText:  TTexts.orSignInWith.capitalize!),
          const SizedBox(height: TSizes.spaceBtwItems),
              /// Footer
          const TSocialButtons(),
    ],
    ),
    ),
    ),
    );
    }
}



