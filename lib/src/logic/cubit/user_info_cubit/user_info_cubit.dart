import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_app/src/data/model/hive_model.dart';
import 'package:task_app/src/presentation/widgets/text_field_widget.dart';
import 'package:task_app/src/utils/helper_functions/hive_local_storage.dart';

import '../../../constants/theme_constans.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial());

  void userInfoUpdateMethod(TextEditingController userEmailController, TextEditingController userNameController,BuildContext context){


    showDialog(barrierDismissible: false, context: context, builder: (context){
      return AlertDialog(
        title: Text('Edit info', style: TextStyle(fontSize: 14, color: Colors.white),),
        backgroundColor: ThemeColorData().productCardColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(text: ' user email', controller: userEmailController),
            SizedBox(height: 10,),
            TextFieldWidget(text: ' user name', controller: userNameController),
          ],
        ),
        actions: [
          ElevatedButton(style: ButtonStyle(
            backgroundColor:MaterialStatePropertyAll(ThemeColorData().fontColor, ),
          ),onPressed: (){
            if(userEmailController.text.isNotEmpty && userNameController.text.isNotEmpty){
              HiveLocalStorage().hiveWrite(userEmailController.text,userNameController.text);

              emit(UpdateUserInfoState(userEmail: HiveLocalStorage().hiveRead()[0],userName: HiveLocalStorage().hiveRead()[1],));
              Navigator.pop(context);
              userNameController.clear();
              userEmailController.clear();
            }
          }, child: Text('apply', style: TextStyle(color: Colors.green),)),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:MaterialStatePropertyAll(ThemeColorData().fontColor, ),
              ),
              onPressed: (){
                Navigator.pop(context);
              }, child: Text('discard', style: TextStyle(color: Colors.red),)),
        ],
      );
    });
  }
}
