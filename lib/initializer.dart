import 'package:film_catalog/core/config/environment.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      await _initEnvironment();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initEnvironment() async {
    await dotenv.load(fileName: Environment.fileName);
  }
}
