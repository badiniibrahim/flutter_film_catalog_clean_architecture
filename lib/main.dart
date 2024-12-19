import 'package:film_catalog/app.dart';
import 'package:film_catalog/initializer.dart';
import 'package:film_catalog/routes/app_pages.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Initializer.init();

  final String initialRoute = await Routes.INITIAL;
  runApp(App(
    initialRoute: initialRoute,
  ));
}
