import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;

    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    await Future.wait([
      Hive.openBox('cart_box'),
      Hive.openBox('projects_box'),
      Hive.openBox('purchased_products'),
    ]);

    _initialized = true;
  }
}