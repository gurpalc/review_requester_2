// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> sameEmployee(String emplyoeeName) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot<Object> employee = await firestore
      .collection("Employee")
      .where("employee_email", isEqualTo: emplyoeeName)
      .get();

  return employee.size != 0 ? true : false;
}
