import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key, required this.textFormField})
      : super(key: key);

  final TextFormField textFormField;

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
        ],
      ),
      child: textFormField,
    );
  }
}
