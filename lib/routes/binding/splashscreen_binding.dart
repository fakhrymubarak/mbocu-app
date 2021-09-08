import 'package:get/instance_manager.dart';
import 'package:mbocu_app/controller/splash_screen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashscreenController());
  }
}
