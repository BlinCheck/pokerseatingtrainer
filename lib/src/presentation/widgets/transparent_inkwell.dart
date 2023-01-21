import 'package:flutter/material.dart';

class TransparentInkWell extends StatelessWidget {
  const TransparentInkWell({this.onTap, required this.child, super.key,});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: child,
    );
  }

}