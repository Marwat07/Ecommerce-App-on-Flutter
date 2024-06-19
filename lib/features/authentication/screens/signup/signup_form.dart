import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers.onboarding/signup/terms_conditions_checkbox.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) => TValidator.validateEmptyText('first Name', value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('fast Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// username
          TextFormField(
            controller: controller.userName,
            validator: (value) => TValidator.validateEmptyText('User Name', value),

            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),


            decoration: const InputDecoration(
                labelText: TTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),

              ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Terms and Condition
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child:  const Text(TTexts.createAccount))),
        ],
      ),
    );
  }
}

