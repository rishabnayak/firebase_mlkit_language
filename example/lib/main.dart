import 'package:flutter/material.dart';

import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    check();
  }

  check() async {
    // String test = "testing this function";

    // FirebaseLanguage.instance
    //     .languageIdentifier()
    //     .processText(test)
    //     .then((onValue) {
    //   print(onValue[0].languageCode);
    // });
    //
    // FirebaseLanguage.instance
    //     .modelManager()
    //     .downloadModel(SupportedLanguages.Greek)
    //     .then((onValue) {
    //   print(onValue);
    // });
    //
    // FirebaseLanguage.instance
    //     .languageTranslator(
    //         SupportedLanguages.English, SupportedLanguages.Danish)
    //     .processText(test)
    //     .then((onValue) {
    //   print(onValue);
    // });
    //
    // FirebaseLanguage.instance
    //     .modelManager()
    //     .deleteModel(SupportedLanguages.Telugu)
    //     .then((onValue) {
    //   print(onValue);
    // });

    FirebaseLanguage.instance
        .modelManager()
        .downloadModel(SupportedLanguages.Greek)
        .then((onValue) {
      print(onValue);
      FirebaseLanguage.instance.modelManager().viewModels().then((onValue) {
        print(onValue.runtimeType);
      });
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
      ),
    );
  }
}
