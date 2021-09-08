import 'package:get/instance_manager.dart';
import 'package:mbocu_app/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
