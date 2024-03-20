import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pageNavigation{

  push(BuildContext context, Widget targetPage) {
    return Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return targetPage;
      },
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        // Geçiş animasyonunu burada özelleştirin
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ));
  }

}
