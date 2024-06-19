import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/sucess_screen.dart';
import 'package:t_store/data/repositories.authentication/authentication_respository.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/constants/image_string.dart';

class VerifyEmailController extends GetxController {

  static VerifyEmailController get instance => Get.find();


  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


  /// Send Email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh Sorry!', message: e.toString());
    }
  }


  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
              () =>
              SuccessScreen(
                image: TImages.successfullyRegisterAnimation,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () =>
                    AuthenticationRepository.instance.screenRedirect(),
              ),
        );
      }
    }
    );
  }

  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
            () =>
            SuccessScreen(
              image: TImages.successfullyRegisterAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
      );
    }
  }
}