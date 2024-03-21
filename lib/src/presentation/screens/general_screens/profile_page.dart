import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/data/model/hive_model.dart';
import 'package:task_app/src/presentation/screens/general_screens/setting_page.dart';
import 'package:task_app/src/presentation/widgets/custom_dialog_widget.dart';
import 'package:task_app/src/utils/helper_functions/hive_local_storage.dart';
import 'package:task_app/src/utils/helper_functions/token_secure_storage.dart';
import 'package:task_app/src/utils/navigator.dart';
import 'package:task_app/src/utils/responsive.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? userEmail = HiveLocalStorage().hiveRead()[0];
  String? userToken;



  //String userPassword = HiveLocalStorage().hiveRead()[1];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HelperFunction().readUserTokenFromDB().then((value){
  setState(() {
  userToken = value;
  });
  });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColorData().productCardColor,
        body: Center(
          child: Container(
            height: Responsive().height(context, 1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    SizedBox(height: Responsive().height(context, 0.28),),
                    Container(
                      height: Responsive().height(context, 0.2),
                      width: Responsive().width(context, 1),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                          image: DecorationImage(image: AssetImage('assets/images/shop.png'), fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      right: 6,
                      child: InkWell(
                        splashColor: Colors.white,
                        highlightColor: Colors.greenAccent,
                        onTap: (){
                          showDialog(context: context, builder: (context){
                            return ShowCustomDialogWidget(userEmail: userEmail!,);
                          });
                        },
                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.edit, color: Colors.white,),
                        )),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 1),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(image: AssetImage('assets/images/profile.jpg',), fit: BoxFit.cover)
                        ),
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(margin: EdgeInsets.all(10), child: Text.rich(TextSpan(text: 'go settings',style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue, decorationColor: Colors.blue), recognizer: TapGestureRecognizer()..onTap =(){pageNavigation().push(context, SettingPage());}
                  ), ),),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('username: ',style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      )),
                      Container(
                          width: Responsive().width(context, 0.6),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('token: ${userToken} ',style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis, ),
                      )),

                    ],
                  ),

                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('email: ${userEmail}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      )),
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(height: 10,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
