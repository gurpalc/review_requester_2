// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter_url_shortener/bitly.dart';
import 'package:flutter_url_shortener/bitly_model.dart';
import 'package:flutter/foundation.dart';

Future<String> shortUrl(String url) async {
  if (!kIsWeb) {
    FShort.instance.setup(token: '63f170379c70c4ca87e23cde7f95ea674561624f');
    try {
      BitlyModel ret = await FShort.instance.generateShortenURL(longUrl: url);
      print(ret.link.toString());
      return ret.link.toString();
    } catch (e) {
      return e.toString();
    }
  } else {
    print(url);
    return url;
  }
}
