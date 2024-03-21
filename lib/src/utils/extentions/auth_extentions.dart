import 'package:flutter/material.dart';


extension UserEmailControll on String {
  bool get isValidEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}

extension UserPasswordControll on String{
  bool get isValidPassword => this.length < 6 ? false : true;

}

extension UserNameControll on String{
  bool get isValidUserName => this.length < 4 ? false : true;
}