import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class HiveModel{
  @HiveField(0)
  String userEmail;
  @HiveField(1)
  String userPassowrd;

  HiveModel({required this.userEmail, required this.userPassowrd});

}