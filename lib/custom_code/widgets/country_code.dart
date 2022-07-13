// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';

class CountryCode extends StatefulWidget {
  const CountryCode({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _CountryCodeState createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CountryCodePicker(
        onChanged: (value) {
          setState(() {
            FFAppState().countryCode = value.toString();
          });
        },
        initialSelection: FFAppState().countryCode,
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
        showFlag: kIsWeb == false ? true : false,
      ),
    );
  }
}
