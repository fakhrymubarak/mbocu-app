import 'package:flutter/material.dart';
import 'package:mbocu_app/views/widgets/list_item_shimmer.dart';

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Profile Page"),
          ListItemsShimmer(),
        ],
      ),
    );
  }
}
