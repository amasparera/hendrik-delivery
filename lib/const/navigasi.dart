import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

toPage(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

Future<bool?> toPageCupertino(BuildContext context, Widget page) async {
  final value = await Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => page));

  return value;
}

closePage(BuildContext context) {
  Navigator.of(context).pop();
}

toRemovePage(BuildContext context, Widget page) {
  // Navigator.of(context)
  //     .pushReplacement(CupertinoPageRoute(builder: (context) => page));

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
}

double height(BuildContext context, double size) {
  return MediaQuery.of(context).size.height * size;
}

double width(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

Route toUpPage(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
