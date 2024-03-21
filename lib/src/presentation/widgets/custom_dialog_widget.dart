import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_app/src/presentation/widgets/text_field_method.dart';
import 'package:task_app/src/utils/helper_functions/hive_local_storage.dart';

import '../../constants/theme_constans.dart';



class ShowCustomDialogWidget extends StatefulWidget {
  String userEmail;
  ShowCustomDialogWidget({super.key, required this.userEmail});

  @override
  State<ShowCustomDialogWidget> createState() => _ShowCustomDialogWidgetState();
}

class _ShowCustomDialogWidgetState extends State<ShowCustomDialogWidget> {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit info', style: TextStyle(fontSize: 14, color: Colors.white),),
      backgroundColor: ThemeColorData().productCardColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(' user email', userEmailController),
          SizedBox(height: 10,),
          _buildTextField(' username',userNameController),

        ],
      ),
      actions: [
        ElevatedButton(style: ButtonStyle(
          backgroundColor:MaterialStatePropertyAll(ThemeColorData().fontColor, ),
        ),onPressed: (){
          setState(() {
            var box = Hive.box('user_info');
            box.putAt(0, userEmailController.text);
            widget.userEmail = HiveLocalStorage().hiveRead()[0];
          });

        }, child: Text('apply', style: TextStyle(color: Colors.green),)),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor:MaterialStatePropertyAll(ThemeColorData().fontColor, ),
            ),
            onPressed: (){}, child: Text('discard', style: TextStyle(color: Colors.red),)),
      ],
    );
  }


  Widget _buildTextField(String text, TextEditingController controller){
    return Container(
      height: 50 ,
      child: TextField(
        controller: controller,
          style: TextStyle(color: Colors.white70),
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(100),
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white12),
              hintText: text,
              contentPadding: EdgeInsets.only(top: 5, left: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),
            )
          )
      ),
    );
  }
}
