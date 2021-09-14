import 'package:flutter/material.dart';

class SplashscreenPage extends StatefulWidget {
  SplashscreenPage({Key? key}) : super(key: key);

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hello World!"),
            ],
          ),
        ),
      ),
    );
  }
}
