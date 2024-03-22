import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/data/model/hive_model.dart';
import 'package:task_app/src/logic/bloc/auth_bloc/sign_in_bloc.dart';
import 'package:task_app/src/logic/cubit/category_cubit/category_cubit.dart';
import 'package:task_app/src/logic/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:task_app/src/logic/provider/provider_localization/provider_localization.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_in_page.dart';
import 'package:task_app/src/presentation/screens/general_screens/home_page.dart';
import 'package:task_app/src/utils/helper_functions/hive_local_storage.dart';
import 'package:task_app/src/utils/helper_functions/token_secure_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_app/src/utils/locator/locator_get_it.dart';
void main()  async {



  ///Init all procces in flutter like async
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory = await getApplicationDocumentsDirectory();

  ///Local Storage Hive init
  await Hive.initFlutter();
  await Hive.openBox('user_info');
  ///Locator setup
  setupLocator();


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
    return ChangeNotifierProvider(create: (context)=> LanguageProvider(),child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CategoryCubit()),
        BlocProvider(create: (context)=> SignInBloc()),
        BlocProvider(create: (context)=> UserInfoCubit()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, langProvider, child){
          return MaterialApp(
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

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],

            supportedLocales: [
              Locale('az'),
              Locale('en'),
              Locale('tr')
            ],

            locale: Locale(langProvider.selectedLanguage),


            home: Scaffold(
              body:  _userTokenStatus == '' ? const SignInPage() : const HomeScreen(),
            ),
          );
        },
      ),
    ),);
  }
}
