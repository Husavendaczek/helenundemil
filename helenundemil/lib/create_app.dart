import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:helenundemil/wedding_app.dart';

abstract class CreateApp {
  const CreateApp._();

  static Future<void> call() async {
    WidgetsFlutterBinding.ensureInitialized();
    //await initializeIoC();

    final delegate = await LocalizationDelegate.create(
      fallbackLocale: 'de',
      supportedLocales: ['de', 'pl'],
    );

    runApp(LocalizedApp(delegate, WeddingApp()));
  }
}
