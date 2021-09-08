import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/controller/item_details_controller.dart';

class ItemDetailsPage extends StatefulWidget {
  ItemDetailsPage({Key? key}) : super(key: key);

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  final ItemDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is Detail Page"),
              Text("Items id = ${_controller.movieId}")
            ],
          ),
        ),
      ),
    );
  }
}
