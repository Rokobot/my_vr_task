import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/logic/cubit/category_cubit/category_cubit.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_in_page.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_up_page.dart';
import 'package:task_app/src/presentation/screens/general_screens/home_page.dart';
import 'package:task_app/src/utils/helper_functions/token_secure_storage.dart';

void main() {
  ///Init all procces in flutter like async
  WidgetsFlutterBinding.ensureInitialized();

  ///Make your app stable rotate
  Orientation.portrait;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _userTokenStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///Check user status over token
    HelperFunction().readUserTokenFromDB().then((value) {
      setState(() {
        _userTokenStatus = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CategoryCubit()),
      ],
      child: MaterialApp(
        ///Conf your app all theme over main.dart
        theme: ThemeData(
            fontFamily: 'casper regular',
            scaffoldBackgroundColor: ThemeColorData().scaffoldBackgrounColor,
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyText2: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.apply(color: ThemeColorData().fontColor),
                )),

        home: Scaffold(
          body:
              _userTokenStatus == '' ? const SignInPage() : const HomeScreen(),
        ),
      ),
    );
  }
}
