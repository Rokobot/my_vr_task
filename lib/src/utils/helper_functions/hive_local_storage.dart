import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_app/src/data/model/hive_model.dart';


class HiveLocalStorage{
  var userInfo = Hive.box('user_info');

  void hiveWrite(String userEmail, String userName){
    HiveModel hiveModel =  HiveModel(userEmail: userEmail, userName:userName );
    userInfo.put('user_email',hiveModel.userEmail);
    userInfo.put('user_name',hiveModel.userName);

  }

  List<dynamic> hiveRead(){
    String userEmail = userInfo.get('user_email');
    String userName = userInfo.get('user_name');
    print('user email: ${userEmail}');
    print('user name: ${userName}');
    print(userName);
    return [userEmail, userName];
  }





}