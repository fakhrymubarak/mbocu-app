import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mbocu_app/controller/login_controller.dart';
import 'package:mbocu_app/themes/button_styles.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/views/widgets/text_field_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = Get.find();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: Text(
                'Log In',
                style: tsTitle,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _formLogin(),
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create your account? ',
                  style: tsRegular,
                ),
                InkWell(
                  onTap: () {
                    Get.close(1);
                    Get.toNamed('/register');
                  },
                  child: Text(
                    'Sign Up',
                    style: tsRegularBold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _formLogin() {
    final _loginKey = GlobalKey<FormState>();

    return Form(
      key: _loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldContainer(
            textFormField: TextFormField(
              controller: emailController,
              validator: (text) {
                if (!(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text)) &&
                    emailController.text.isNotEmpty) {
                  return "Email tidak sesuai!";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'E-mail',
                border: InputBorder.none,
                hintStyle: tsLarge,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldContainer(
            textFormField: TextFormField(
              controller: passwordController,
              validator: (text) {
                if (!(passwordController.text.length > 8) &&
                    passwordController.text.isNotEmpty) {
                  return "Password minimal 8 karakter";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
                hintStyle: tsLarge,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Forgot password?',
            textAlign: TextAlign.right,
            style: tsLarge,
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: buttonPrimaryLarge,
            onPressed: () {
              if (_loginKey.currentState!.validate()) {
                _controller.postLogin(
                    emailController.text, passwordController.text);
              }
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(70.w, 10.h, 70.w, 10.h),
              child: Text('Log In', style: tsHeading1White),
            ),
          ),
        ],
      ),
    );
  }
}
