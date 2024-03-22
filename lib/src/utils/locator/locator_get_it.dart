import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/src/service/rest_service.dart';
import 'package:task_app/src/utils/helper_functions/hive_local_storage.dart';
import 'package:task_app/src/utils/helper_functions/token_secure_storage.dart';
final locator = GetIt.I;

void setupLocator(){
  ///Local Data Service
  locator.registerSingleton<HiveLocalStorage>(HiveLocalStorage());
  locator.registerSingleton<HelperFunction>(HelperFunction());

  ///Rest Service
  locator.registerSingleton<DioService>(DioService());

}