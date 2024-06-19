import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers.onboarding/signup/nerwork_manager.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
