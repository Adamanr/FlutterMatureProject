import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static Future<String> get projectsDirectory async {
    final dir = await getApplicationDocumentsDirectory();
    final projectsDir = Directory('${dir.path}/projects');
    if (!await projectsDir.exists()) {
      await projectsDir.create(recursive: true);
    }
    return projectsDir.path;
  }

  static Future<String> get descriptionsDirectory async {
    final dir = await getApplicationDocumentsDirectory();
    final descDir = Directory('${dir.path}/descriptions');
    if (!await descDir.exists()) {
      await descDir.create(recursive: true);
    }
    return descDir.path;
  }

  static Future<String> saveProjectImage(File image) async {
    final dir = await projectsDirectory;
    final fileName = 'project_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedFile = await image.copy('$dir/$fileName');
    return savedFile.path;
  }
}