import 'package:flutter/material.dart';

import '../../utils/responsive.dart';



Container buildTextField(BuildContext context, String hintText, TextEditingController textEditingController) {
  return Container(
    width: Responsive().width(context, 0.8),
    child: TextFormField(
      controller: textEditingController,
      cursorColor: Colors.black54,
      cursorRadius: const Radius.circular(100),
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ) ,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )
      ),
    ),
  );
}
