// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> sameManager(String managerName) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot<Object> manager = await firestore
      .collection("Manager")
      .where("manager_email", isEqualTo: managerName)
      .get();

  return manager.size != 0 ? true : false;
}
