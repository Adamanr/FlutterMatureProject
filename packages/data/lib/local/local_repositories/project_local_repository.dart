// packages/data/lib/local/local_repositories/project_local_repository.dart
import 'dart:io';
import 'package:domain/entities/project.dart';
import 'package:domain/repositories/i_project_repository.dart';
import 'package:data/local/storage_service.dart';
import 'package:hive/hive.dart';

class ProjectLocalRepository implements IProjectRepository {
  static const _boxName = 'projects_box';

  Box get _box => Hive.box(_boxName);

  @override
  Future<List<Project>> getProjects() async {
    return _box.values
        .map((e) => Project.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<Project> createProject({
    required String title,
    required String typeProject,
    required DateTime dateStart,
    DateTime? dateEnd,
    required String gender,
    required String category,
    required String descriptionSource,
    required File image,
  }) async {
    final imagePath = await StorageService.saveProjectImage(image);

    final project = Project(
      id: 'proj_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      dateStart: dateStart,
      dateEnd: dateEnd,
      gender: gender,
      category: category,
      descriptionSource: descriptionSource,
      imagePath: imagePath,
      userId: 'user_001',
    );

    await _box.put(project.id, project.toJson());
    return project;
  }
}