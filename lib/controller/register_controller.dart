import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:mbocu_app/models/RegisterDTO.dart';
import 'package:mbocu_app/repositories/mbocu_db_api.dart';

class RegisterController extends GetxController {
  MbocuDbApi _mbocuDbApi = MbocuDbApi();
  Rx<RegisterDto> userRegisterValue = new RegisterDto().obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> postRegister(String name, String email, String pass,
      String passConfirm, String phoneNum) async{
    try {
      userRegisterValue.value = await _mbocuDbApi.postRegister(name, email, pass, passConfirm, phoneNum);
      userRegisterValue.refresh();
      if(userRegisterValue.value.status == null){
        userRegisterValue.value.status = "401";
        userRegisterValue.refresh();
      }
    } catch (e) {
      userRegisterValue.value.status = "401";
      userRegisterValue.refresh();
      printError(info: e.toString());
    }
  }
}