import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/src/constants/theme_constans.dart';



class ShowToast{
  showToast(String msg){
    Fluttertoast.showToast(msg: msg, backgroundColor: ThemeColorData().fontColor,timeInSecForIosWeb: 3);
  }
}