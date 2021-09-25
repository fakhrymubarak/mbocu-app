import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mbocu_app/controller/register_controller.dart';
import 'package:mbocu_app/themes/button_styles.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/views/widgets/text_field_container_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _controller = Get.find();

  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passController = new TextEditingController();
  final confirmPassController = new TextEditingController();
  final phoneNumberController = new TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    phoneNumberController.dispose();
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
              child: Text('Sign Up', style: tsTitle),
            ),
            const SizedBox(height: 50),
            _formRegister(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have account? ',
                  style: tsRegular,
                ),
                InkWell(
                  onTap: () {
                    Get.close(1);
                    Get.toNamed('/login');
                  },
                  child: Text(
                    'Log In',
                    style: tsRegularBold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _formRegister() {
    final _registerKey = GlobalKey<FormState>();
    return Form(
      key: _registerKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldContainer(
            textFormField: TextFormField(
              controller: nameController,
              validator: (text) {
                if (!(nameController.text.length >= 3) &&
                    nameController.text.isNotEmpty) {
                  return "Nama minimal 3 karakter";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Nama',
                border: InputBorder.none,
                hintStyle: tsLarge,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFieldContainer(
            textFormField: TextFormField(
              controller: emailController,
              validator: (text) {
                if (!(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text)) &&
                    emailController.text.isNotEmpty) {
                  return "Format email salah";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Email',
                border: InputBorder.none,
                hintStyle: tsLarge,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFieldContainer(
            textFormField: TextFormField(
              controller: passController,
              validator: (text) {
                if (!(passController.text.length >= 8) &&
                    passController.text.isNotEmpty) {
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
          const SizedBox(height: 20),
          TextFieldContainer(
            textFormField: TextFormField(
              controller: confirmPassController,
              validator: (text) {
                if ((passController.text != confirmPassController.text)) {
                  return "Password tidak sama";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Konfirmasi Password',
                border: InputBorder.none,
                hintStyle: tsLarge,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFieldContainer(
            textFormField: TextFormField(
              controller: phoneNumberController,
              validator: (text) {
                if (!(phoneNumberController.text.length >= 10) &&
                    phoneNumberController.text.isNotEmpty) {
                  return "Format nomor telpon salah";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Nomor Telpon',
                border: InputBorder.none,
                hintStyle: tsLarge,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() =>
              _showErrorRegister(_controller.userRegisterValue.value.status)),
          ElevatedButton(
            style: buttonPrimaryLarge,
            onPressed: () {
              if (_registerKey.currentState!.validate()) {
                _controller.postRegister(
                    nameController.text,
                    emailController.text,
                    passController.text,
                    confirmPassController.text,
                    phoneNumberController.text);
              }
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(50.w, 10.h, 50.w, 10.h),
              child: Text('Create Account', style: tsHeading1White),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  _showErrorRegister(String? status) {
    if (status == '401') {
      return Column(
        children: [
          Text(
            'Email atau nomor telpon telah digunakan!',
            textAlign: TextAlign.right,
            style: tsLargeDanger,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    } else if (status == 'success') {
      Get.close(1);
      Get.toNamed('/login');
      return Column(
        children: [
          Text(
            'Registrasi Success! Redirect to Login . . .',
            textAlign: TextAlign.right,
            style: tsLargeSucess,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    }
    return SizedBox(height: 0);
  }
}
