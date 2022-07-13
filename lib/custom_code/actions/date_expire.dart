// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<DateTime> dateExpire() async {
  DateTime now = DateTime.now();
  DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, now.day);

  return lastDayOfMonth;
}
