import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_app/src/data/model/hive_model.dart';


class HiveLocalStorage{
  var userInfo = Hive.box('user_info');
  void hiveWrite(String userEmail, String userPassowrd){
    HiveModel hiveModel =  HiveModel(userEmail: userEmail, userPassowrd: userPassowrd);
    userInfo.put('user_email',hiveModel.userEmail);
    userInfo.put('user_password',hiveModel.userPassowrd);

  }

  List<dynamic> hiveRead(){
    String userEmail = userInfo.get('user_email');
    String userPassowrd = userInfo.get('user_password');
    print(userEmail);
    return [userEmail, userPassowrd];
  }


}