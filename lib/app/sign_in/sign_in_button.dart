import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/common_widget/custonm_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
            borderRadius: 8.0,
            color: color,
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
              ),
            ));
}
