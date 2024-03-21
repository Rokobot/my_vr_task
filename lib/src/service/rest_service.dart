import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_app/src/constants/service_constants.dart';
import 'package:task_app/src/data/model/products_model.dart';
import 'package:task_app/src/data/model/user_model.dart';
import 'package:task_app/src/presentation/screens/general_screens/home_page.dart';
import 'package:task_app/src/utils/helper_functions/token_secure_storage.dart';
import 'package:task_app/src/utils/navigator.dart';

import '../utils/toast.dart';

class DioService {
  ///Dio init
  var dio = Dio();

  ///Get token with login (POST)
  void getTokenWithLogin(BuildContext context) async {
    try {
      var response = await dio.post('${DataConstans().baseUrl}/auth/login',
          data: {'username': 'mor_2314', 'password': '83r5^_'},
          options: Options(contentType: 'application/json'));
      if (response.statusCode == 200) {
        print(response.data['token']);

        ///Show with toast succes procces
        ShowToast().showToast('👌 response status message: ${response.statusMessage}');
        ///Add token to secure storage (Local Data)
        HelperFunction().createUserTokenDB(response.data['token']);
        print('Flutter Secure Storage -> ${HelperFunction().readUserTokenFromDB()}');
        pageNavigation().push(context, HomeScreen());
      } else {
        print('your response status code ${response.statusCode}');
      }
    } catch (e) {
      print('You have invalid procces -> ${e}');
    }
  }

  ///Add fake account with register and get OK message (POST)
  void getAccountWithRegister(
      String userName, String userEmail, String userPassword) async {
    try {
      var response = await dio.post('${DataConstans().baseUrl}/users',
          data: UserModel(
              userName: userName,
              userEmail: userEmail,
              userPassword: userPassword),
          options: Options(
            contentType: 'application/json',
          ));
      if (response.statusCode == 200) {
        print(response.statusMessage);

        ///That response will be OK because is fake api and i cant post new user like real db
      } else {
        print('your response status code ${response.statusCode}');
      }
    } catch (e) {
      print('You have invalid procces -> ${e}');
    }
  }

  ///Fetch Products
  Future<List<ProductsModel>> getAllProducts(int skip) async {
    List<ProductsModel> productsList = [];
    try {
      var response = await dio.get(
        '${DataConstans().baseUrl}/products',
        options: Options(contentType: 'application/json'),
        queryParameters: {'limit': DataConstans().limit, 'skip':skip}
      );
      if (response.statusCode == 200) {
        productsList = List<ProductsModel>.from(
          response.data.map((json) => ProductsModel.fromJson(json)),
        );
        return productsList;
      } else {
        print('your response status code ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('You have an invalid process -> $e');
      return [];
    }
  }

  ///Delete User
  Future<String?> deleteUser() async {
    try{
      var response = await dio.get('${DataConstans().baseUrl}/users/6', options: Options(
        contentType: 'application/json'
      ));
      return response.statusMessage;

    }catch(e){
      return e.toString();
    }
  }


}
