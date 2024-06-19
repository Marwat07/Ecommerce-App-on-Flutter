import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/constants/image_string.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../authentication/controllers.onboarding/signup/nerwork_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when screen appers
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.decorAnimation);


      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }


      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update users names in firebase
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //removed Loader
      TFullScreenLoader.stopLoading();

      // Show Success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to Previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Sorry', message: e.toString());
    }
  }
}