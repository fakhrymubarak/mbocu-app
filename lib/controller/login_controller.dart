import 'package:get/get.dart' hide Response;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mbocu_app/models/LoginDTO.dart';
import 'package:mbocu_app/repositories/mboccu_db_api.dart';

class LoginController extends GetxController {
  MboccuDbApi _mboccuDbApi = MboccuDbApi();
  Rx<LoginDto> userLoginValue = new LoginDto().obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> postLogin(String email, String password) async{
    try {
      userLoginValue.value = await _mboccuDbApi.postLogin(email, password);
      userLoginValue.refresh();
    } catch (e) {
      printError(info: e.toString());
    }
  }
}