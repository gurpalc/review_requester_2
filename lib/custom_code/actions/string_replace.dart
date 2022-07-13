// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<String> stringReplace(
  String string,
  String businessName,
  String customerName,
  String reviewlink,
  String reviewlinkweb,
) async {
  var newS = string
      .replaceAll("[businessname]", businessName)
      .replaceAll("[customername]", customerName)
      .replaceAll("[reviewlink]", reviewlink)
      .replaceAll("[reviewrequesterweb]", reviewlinkweb);

  return newS;
}
