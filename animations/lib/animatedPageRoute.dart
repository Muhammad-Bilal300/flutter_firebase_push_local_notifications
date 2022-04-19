import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimatedPageRoute extends PageRouteBuilder {
  final Widget widget;
  AnimatedPageRoute({required this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, secAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secAnimation) {
              return widget;
            });
}
