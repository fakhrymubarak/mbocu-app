import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mbocu_app/themes/button_styles.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/views/widgets/text_field_container_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            TextFieldContainer(
              textFormField: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none,
                  hintStyle: tsLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldContainer(
              textFormField: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  hintStyle: tsLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldContainer(
              textFormField: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  hintStyle: tsLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldContainer(
              textFormField: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Repeat Password',
                  border: InputBorder.none,
                  hintStyle: tsLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldContainer(
              textFormField: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: InputBorder.none,
                  hintStyle: tsLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: buttonPrimaryLarge,
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(50.w, 10.h, 50.w, 10.h),
                child: Text('Create Account', style: tsHeading1White),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
