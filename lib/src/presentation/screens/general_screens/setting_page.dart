import 'package:flutter/material.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_in_page.dart';
import 'package:task_app/src/service/rest_service.dart';
import 'package:task_app/src/utils/helper_functions/hive_local_storage.dart';
import 'package:task_app/src/utils/helper_functions/token_secure_storage.dart';
import 'package:task_app/src/utils/toast.dart';

import '../../../utils/responsive.dart';




class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          foregroundColor: Colors.white,
          backgroundColor: ThemeColorData().productCardColor,
          title: Text('Settings', style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: ThemeColorData().productCardColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (){},
                splashColor: Colors.white,
                highlightColor: Colors.greenAccent,
                child:Ink(
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                  width: Responsive().width(context, 0.95),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Language', style: TextStyle(color: Colors.white),),
                        Spacer(),
                        Icon(Icons.settings, color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (){
                  DioService().deleteUser().then((value) {
                    if(value == 'OK'){
                      HelperFunction().deleteTokenFromSecureStorage();
                      ShowToast().showToast('👌 Acoount deleted succesfuly!');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
                    }else{
                      ShowToast().showToast('Try again!');
                    }
                  });

                },
                splashColor: Colors.white,
                highlightColor: Colors.greenAccent,
                child:Ink(
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                  width: Responsive().width(context, 0.95),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Delete account', style: TextStyle(color: Colors.white),),
                        Spacer(),
                        Icon(Icons.delete, color: Colors.red,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
