import 'dart:async';

import 'package:flutter/services.dart';

class FirebaseMlkitLanguage {
  static const MethodChannel _channel =
      const MethodChannel('firebase_mlkit_language');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
