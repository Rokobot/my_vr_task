import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/logic/provider/provider_localization/provider_localization.dart';
import 'package:task_app/src/presentation/screens/auth_screens/sign_in_page.dart';
import 'package:task_app/src/service/rest_service.dart';
import 'package:task_app/src/utils/helper_functions/token_secure_storage.dart';
import 'package:task_app/src/utils/locator/locator_get_it.dart';
import 'package:task_app/src/utils/toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/responsive.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  DioService dioServiceLocator = locator<DioService>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          foregroundColor: Colors.white,
          backgroundColor: ThemeColorData().productCardColor,
          title: Text(
            '${AppLocalizations.of(context)!.settings}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: ThemeColorData().productCardColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Consumer<LanguageProvider>(
                builder: (context, langProvider, child) {
                  return Ink(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8)),
                    width: Responsive().width(context, 0.6),
                    height: Responsive().height(context, 0.06),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${AppLocalizations.of(context)!.language}', style: TextStyle(color: Colors.white),),
                          SizedBox(width: 5,),
                          Container(
                            child: DropdownButton<String>(
                              underline: Container(),
                              dropdownColor: Colors.grey,
                              value: langProvider.selectedLanguage,
                              onChanged: (newValue) {
                                langProvider.changeLanguage(newValue!);
                              },
                              items: langProvider.languages.map((language) {
                                return DropdownMenuItem<String>(
                                  value: language,
                                  child: Text(
                                    language,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  dioServiceLocator.deleteUser().then((value) {
                    if (value == 'OK') {
                      HelperFunction().deleteTokenFromSecureStorage();
                      ShowToast().showToast('👌 Acoount deleted succesfuly!');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    } else {
                      ShowToast().showToast('Try again!');
                    }
                  });
                },
                splashColor: Colors.white,
                highlightColor: Colors.greenAccent,
                child: Ink(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8)),
                  width: Responsive().width(context, 0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.delete_account}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        )
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
