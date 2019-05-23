import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

void main() {
  const MethodChannel channel = MethodChannel('firebase_mlkit_language');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FirebaseMlkitLanguage.platformVersion, '42');
  });
}
