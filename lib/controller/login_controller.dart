import 'package:get/get.dart' hide Response;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mbocu_app/models/LoginDTO.dart';
import 'package:mbocu_app/repositories/mbocu_db_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  MbocuDbApi _mbocuDbApi = MbocuDbApi();
  Rx<LoginDto> userLoginValue = new LoginDto().obs;

  @override
  void onInit() {
    _isLoginChecker();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> _isLoginChecker() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isLogin") == true && prefs.getString("accessToken") != null){
      Get.toNamed("/home");
    }
  }


  Future<void> postLogin(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      userLoginValue.value = await _mbocuDbApi.postLogin(email, password);
      userLoginValue.refresh();

      if (userLoginValue.value.data!.accessToken != null) {
        prefs.setString("accessToken", userLoginValue.value.data!.accessToken!);
        prefs.setBool("isLogin", true);
        Get.toNamed("/home");
      } else {
        prefs.setBool("isLogin", false);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }
}
