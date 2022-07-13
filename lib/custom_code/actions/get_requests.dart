// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> getRequests(
  int userRequests,
  int oldRequests,
) async {
  int a = userRequests - oldRequests;
  if (a.isNegative) {
    print("false");
    return false;
  } else {
    print("true");

    return true;
  }
}
