import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius = 2.0,
    this.height = 50,
    this.onPressed,
  });

  final Widget child;
  final height;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50 ,
        child: RaisedButton(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
    ),
    ),
    child: child,
    onPressed: onPressed,
    disabledColor: color,
    color: color,
    ),
    );
    ;
  }
}
