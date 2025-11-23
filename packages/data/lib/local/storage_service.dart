import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static Future<String> get _projectsDir async {
    final dir = await getApplicationDocumentsDirectory();
    final projectsDir = Directory('${dir.path}/projects');
    if (!await projectsDir.exists()) await projectsDir.create(recursive: true);
    return projectsDir.path;
  }

  static Future<String> get _descriptionsDir async {
    final dir = await getApplicationDocumentsDirectory();
    final descDir = Directory('${dir.path}/descriptions');
    if (!await descDir.exists()) await descDir.create(recursive: true);
    return descDir.path;
  }

  static Future<String> saveProjectImage(File image) async {
    final dir = await _projectsDir;
    final fileName = 'proj_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final saved = await image.copy('$dir/$fileName');
    return saved.path;
  }

  static Future<String> saveDescriptionPdf(File pdf, String productId) async {
    final dir = await _descriptionsDir;
    final saved = await pdf.copy('$dir/$productId.pdf');
    return saved.path;
  }
}