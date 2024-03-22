import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/logic/bloc/auth_bloc/sign_in_bloc.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_up_page.dart';
import 'package:task_app/src/utils//navigator.dart';
import 'package:task_app/src/utils/toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, state){
              if(state is ErrorState){
                return ShowToast().showToast(state.errror);
              }
            },
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state ){
                if(state is SignInInitial){
                  return buildSigIn(context,state);
                }
                if(state is LoadingState){
                  return state.loading ? Center(child: CircularProgressIndicator(color: Colors.white,),) : Container();
                }
                if(state is SignInStateSucces){
                  return buildSigIn(context, state);              }

                return buildSigIn(context, state);
              },
            ),
          )
        ),
      ),
    );
  }

  SingleChildScrollView buildSigIn(BuildContext ctx, state  ) {
    return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("TrendOL", style: TextStyle( fontSize: 46),),
              Container(margin: EdgeInsets.only(bottom: 5), color: Colors.black,width: 40,height: 0.7,),
              Text("${AppLocalizations.of(context)!.sign_in_}", style: TextStyle( fontSize: 20),),
              SizedBox(height: 40,),
              buildTextField(context, ' Enter your username ...', userNameTextController),
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
                    ctx.read<SignInBloc>().add(GetTokenEvent(context: context, userEmail: emailTextController.text, userPassword: passwordTextController.text, userName: userNameTextController.text));
                  }, child: Text('${AppLocalizations.of(context)!.sign_in_}', style: TextStyle(color: Colors.white),)),
            ),
              SizedBox(height: Responsive().height(context, 0.05),),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(TextSpan(text: '${AppLocalizations.of(context)!.go_sign_up} ',children: [TextSpan(text: '${AppLocalizations.of(context)!.sign_up_}', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue), recognizer: TapGestureRecognizer()..onTap = (){
                  pageNavigation().push(context, SignUpPage());
                })])),
              )
            ],
          ),
        );
  }
}
