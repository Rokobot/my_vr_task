import 'package:flutter/material.dart';



class Responsive{

  width(BuildContext context, double width ){
    return MediaQuery.of(context).size.width * width;
  }

  height(BuildContext context, double height){
    return MediaQuery.of(context).size.height * height;
  }

}