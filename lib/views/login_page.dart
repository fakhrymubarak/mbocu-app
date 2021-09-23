import 'package:flutter/material.dart';
import 'package:mbocu_app/themes/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 76, right: 90, left: 117),
            child: Text(
              'Log In',
              style: textHeader,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const TextFieldContainer(
              child: TextField(
            decoration: InputDecoration(hintText: 'E-mail'),
          )),
          const SizedBox(
            height: 10,
          ),
          const TextFieldContainer(
              child: TextField(
            decoration: InputDecoration(hintText: 'Password'),
          )),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 137, right: 61),
            child: Text('Forgot password?'),
          ),
          SizedBox(
            height: 46,
            child: Container(
              alignment: const Alignment(10, 10),
              width: 258,
              height: 49,
              child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: const Text('Log In')),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 139, right: 37),
            child: Row(
              children: const <Widget>[
                Text('Create your account?'),
                Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.orange,
    primary: Colors.grey,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2))));

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
