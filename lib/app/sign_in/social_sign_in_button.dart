import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/common_widget/custonm_raised_button.dart';


class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
            color: color,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: Image.asset(
                    assetName,
                  ),
                ),
              ],
            ));
}
