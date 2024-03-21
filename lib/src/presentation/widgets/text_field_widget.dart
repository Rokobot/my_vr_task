import 'package:flutter/material.dart';



class TextFieldWidget extends StatelessWidget {
  String text;
  TextEditingController controller;

  TextFieldWidget({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 ,
      child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white70),
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(100),
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: text,
              contentPadding: EdgeInsets.only(top: 5, left: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              )
          )
      ),
    );
  }
}
