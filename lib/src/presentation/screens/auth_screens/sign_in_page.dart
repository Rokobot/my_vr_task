import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_up_page.dart';
import 'package:task_app/src/utils//navigator.dart';
import 'package:task_app/src/service/rest_service.dart';
import 'package:task_app/src/utils/toast.dart';

import '../../../constants/theme_constans.dart';
import '../../../utils/responsive.dart';
import '../../widgets/text_field_method.dart';



class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  ///Catch text controller
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Sign In", style: TextStyle( fontSize: 46),),
                SizedBox(height: 40,),
                buildTextField(context, ' Enter your gmail ...', emailTextController),
                SizedBox(height: 15,),
                buildTextField(context, ' Enter your password ... ', passwordTextController),
                SizedBox(height: Responsive().height(context, 0.1),),
                Container(
                  width: Responsive().width(context, 0.8),
                  child: ElevatedButton(
                      style:  ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(ThemeColorData().fontColor),
                      ),
                      onPressed: (){
                        DioService().getTokenWithLogin(context);
                      }, child: Text('Sign in', style: TextStyle(color: Colors.white),)),
                ),
                SizedBox(height: Responsive().height(context, 0.05),),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text.rich(TextSpan(text: 'Don\'t have an account? ',children: [TextSpan(text: 'Sign up', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue), recognizer: TapGestureRecognizer()..onTap = (){
                    pageNavigation().push(context, SignUpPage());
                  })])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
