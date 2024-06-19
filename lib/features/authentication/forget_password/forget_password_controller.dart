import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication_respository.dart';
import 'package:t_store/utils/constants/image_string.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../common/widgets/passsword_configuration/reset_password.dart';
import '../controllers.onboarding/signup/nerwork_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();


  /// variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing Your Request...', TImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {TFullScreenLoader.stopLoading();return;}

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();
      
      // show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Sorry', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing Your Request...', TImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {TFullScreenLoader.stopLoading();return;}


      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();

      // show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Sorry', message: e.toString());
    }
  }
}