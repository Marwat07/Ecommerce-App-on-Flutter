import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';

class TFullScreenLoader {

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) =>
          PopScope(
            canPop: false,
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child:  Column(
                children: [
                  const SizedBox(height: 250),
                  TAnimationLoaderWidget(text: text, animation: animation),

                ],
              ),
            ),
          ),
    );
  }

  /// stop the currently open leading dialog
  /// This method doesn't return anything
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}