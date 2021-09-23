import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/themes/colors.dart';

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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 76, right: 90, left: 117),
                child: Text('Sign Up', style: textHeader),
              ),
              const SizedBox(height: 20),
              const TextFieldContainer(
                  child:
                      TextField(decoration: InputDecoration(hintText: 'Name'))),
              const SizedBox(
                height: 20,
              ),
              const TextFieldContainer(
                  child: TextField(
                decoration: InputDecoration(hintText: 'Email'),
              )),
              const SizedBox(
                height: 20,
              ),
              const TextFieldContainer(
                  child: TextField(
                      decoration: InputDecoration(hintText: 'Password'))),
              const SizedBox(
                height: 20,
              ),
              const TextFieldContainer(
                  child: TextField(
                decoration: InputDecoration(hintText: 'Repeat Password'),
              )),
              const Padding(
                padding: EdgeInsets.only(top: 53, left: 20),
                child: Text('sign up with social account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {},
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                      color: Color(0x0fFFFFFF), fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 160, right: 37),
                child: Row(
                  children: const <Widget>[
                    Text('Already have account?'),
                    Text(
                      'Log In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: colorPrimary,
    primary: colorPrimary,
    //maximumSize: const Size(58, 0),
    minimumSize: const Size(258, 49),
    padding: const EdgeInsets.only(top: 107),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))));

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key, required TextField child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 53, right: 53),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
      width: 305,
      height: 44,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Color(0xffFFCA61), blurRadius: 4, offset: Offset(0, 4))
          ]),
    );
  }
}
