// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:twilio_flutter/twilio_flutter.dart';

Future sendTwilioSMS(
  String phoneuser,
  String messageSMS,
) async {
  TwilioFlutter twilioFlutter;
  twilioFlutter = TwilioFlutter(
      accountSid: 'AC224c44a0d074938bbea043c6346084b3',
      authToken: '92409274779cc171011a5d443a3f0e50',
      twilioNumber: '+18446171611');

  twilioFlutter.sendSMS(toNumber: phoneuser, messageBody: messageSMS);
}
