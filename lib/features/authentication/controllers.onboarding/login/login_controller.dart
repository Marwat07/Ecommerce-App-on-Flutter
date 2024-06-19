
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories.authentication/authentication_respository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/constants/image_string.dart';
import '../signup/nerwork_manager.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// Email and Password signIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // starting loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in', TImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user using email
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remover loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Sorry', message: e.toString());
    }
  }

  /// Google SignIn Auth
  Future<void> googleSignIn() async {
    try {
      // starting loading
      TFullScreenLoader.openLoadingDialog('Logging you in', TImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Auth
      final userCredentials  = await AuthenticationRepository.instance.signInWithGoogle();


      // save user Record
      await userController.saveUserRecord(userCredentials);

      // remove loading
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Sorry', message: e.toString());
    }
  }
}