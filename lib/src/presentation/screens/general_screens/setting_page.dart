import 'package:flutter/material.dart';
import 'package:task_app/src/constants/theme_constans.dart';

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
        backgroundColor: Colors.blueGrey,
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
                  width: Responsive().width(context, 0.8),
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
                onTap: (){},
                splashColor: Colors.white,
                highlightColor: Colors.greenAccent,
                child:Ink(
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                  width: Responsive().width(context, 0.8),
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
