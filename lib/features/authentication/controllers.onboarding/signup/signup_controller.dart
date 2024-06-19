import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication_respository.dart';
import 'package:t_store/data/repositories.authentication/user/user_repository.dart';
import 'package:t_store/features/authentication/controllers.onboarding/signup/user_model.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/popups/loaders.dart';
import 'nerwork_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.decorAnimation);


      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register User in the FireBase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Save Auth user data in the firebase FireStore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulation',message: 'Your account has been created! Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      // show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'oh Sorry!', message: e.toString());
    }
  }
}
