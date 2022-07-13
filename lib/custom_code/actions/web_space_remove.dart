// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<String> webSpaceRemove(String webUrl) async {
  var newS = webUrl.replaceAll(" ", "%20");
  return newS;
}
