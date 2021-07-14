import 'package:flutter/cupertino.dart';

class Job {
  Job({
    @required this.id,
    @required this.name,
    @required this.ratePerHour,
  });

  factory Job.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final int ratePerHour = data['ratePerHour'];
    return Job(
      id: documentId,
      name: name,
      ratePerHour: ratePerHour,
    );
  }

  String name;
  int ratePerHour;
  String id;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
    };
  }
}
