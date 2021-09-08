import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.find();

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Home Page"),
          ElevatedButton(
            onPressed: () => Get.toNamed('/details/0'),
            child: Text('Move To Details'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          )
        ],
      ),
    );
  }
}
