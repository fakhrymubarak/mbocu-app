import 'package:get/instance_manager.dart';
import 'package:mbocu_app/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
