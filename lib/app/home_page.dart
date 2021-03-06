import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/common_widget/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/Auth.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
    );
  }

  Future _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you srue to logout',
      defaultAtionText: 'Logout',
      cancelActionText: 'Cancel',
    );
    if (didRequestSignOut) {
      _signOut(context);
    }
  }
}
