import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_in_page.dart';
import 'package:task_app/src/utils/navigator.dart';
import 'package:task_app/src/utils/responsive.dart';
import 'package:task_app/src/service/rest_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/text_field_method.dart';





class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  ///Catch text controller
  TextEditingController userTextController = TextEditingController();
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
                Text("TrendOL", style: TextStyle( fontSize: 46),),
                Container(margin: EdgeInsets.only(bottom: 5), color: Colors.black,width: 40,height: 0.7,),
                Text("${AppLocalizations.of(context)!.sign_up_}", style: TextStyle( fontSize: 20),),
                SizedBox(height: 40,),
                buildTextField(context, ' Enter your username ... ', userTextController),
                SizedBox(height: 15,),
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
                      DioService().getAccountWithRegister(userTextController.text, emailTextController.text, passwordTextController.text);
                      }, child: Text('${AppLocalizations.of(context)!.sign_up_}', style: TextStyle(color: Colors.white),)),
                ),
                SizedBox(height: Responsive().height(context, 0.05),),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text.rich(TextSpan(text: '${AppLocalizations.of(context)!.go_sign_in} ',children: [TextSpan(text: '${AppLocalizations.of(context)!.sign_in_}', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue), recognizer: TapGestureRecognizer()..onTap = (){
                    pageNavigation().push(context, SignInPage());
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
