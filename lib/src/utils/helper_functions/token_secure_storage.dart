import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HelperFunction{
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  ///CRUD procces with flutter_secure_storage, i use evrytime to deploy user tokens this package

  ///Create  or Write  DB
  void createUserTokenDB(String userToken)async {
    await secureStorage.write(key: 'Token', value: userToken);
  }

  ///Read or Fetch  DB
  Future<String> readUserTokenFromDB() async {
    String value = await secureStorage.read(key: 'Token') ?? '';
    return value;
  }

  ///Delete token from secure storage
  void deleteTokenFromSecureStorage(){
    secureStorage.delete(key: 'Token');
  }

}