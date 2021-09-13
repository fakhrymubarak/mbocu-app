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
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Log In',
              style: tsRegular,
            ),
            SizedBox(
              height: 30,
            ),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(hintText: 'E-mail'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            SizedBox(
              height: 10,
              width: 137,
              child: Text('Forgot Password?'),
            ),
            SizedBox(
              height: 46,
            ),
            Container(
              width: 258,
              height: 49,
              child: FlatButton(
                  onPressed: () {},
                  color: Color(0xffFFCA61),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text('Log In',
                      style:
                          TextStyle(color: Color(0xffFFFFFF), fontSize: 18))),
            ),
            SizedBox(
              height: 17,
              child: Row(
                children: [
                  Text('Create Your Account?'),
                  Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 53, right: 53),
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Color(0xffD4CCCC).withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xffFFCA61),
              blurRadius: 30,
              spreadRadius: 0,
            )
          ]),
      child: child,
    );
  }
}
