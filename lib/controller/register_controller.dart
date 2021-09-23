import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mbocu_app/models/RegisterDTO.dart';
import 'package:mbocu_app/repositories/mbocu_db_api.dart';

class RegisterController extends GetxController {
  MbocuDbApi _mbocuDbApi = MbocuDbApi();
  Rx<RegisterDto> userRegisterValue = new RegisterDto().obs;

  @override
  void onReady() {
    super.onReady();
  }

}