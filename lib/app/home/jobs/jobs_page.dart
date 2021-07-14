import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/common_widget/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/app/common_widget/show_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/app/home/job_entries/job_entries_page.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/edit_job_page.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/job_list_tile.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/list_item_builder.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';
import 'package:time_tracker_flutter_course/services/Auth.dart';
import 'package:time_tracker_flutter_course/services/database.dart';

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
        actions: [
          IconButton(
              onPressed: () => EditJobPage.show(
                    context,
                    database: Provider.of<Database>(context, listen: false),
                  ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: _buildContents(context),
    );
  }

  Future<void> _createJob(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.setJob(Job(
        name: "name",
        ratePerHour: 10,
      ));
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(context, title: 'Operation failed', exception: e);
    }
  }

  Future<void> _Job(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.setJob(Job(
        name: "name",
        ratePerHour: 10,
      ));
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(context, title: 'Operation failed', exception: e);
    }
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
        stream: database.jobsStream(),
        builder: (context, snapshot) {
          return ListItemsBuilder<Job>(
              snapshot: snapshot,
              itemBuilder: (context, job) => Dismissible(
                    key: Key('job-${job.id}'),
                    background: Container(
                      color: Colors.red,
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) => _delete(context, job),
                    child: JobListTile(
                      job: job,
                      onTap: () => JobEntriesPage.show(context, job),
                    ),
                  ));
        });
  }

  Future<void> _delete(BuildContext context, Job job) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }
}
