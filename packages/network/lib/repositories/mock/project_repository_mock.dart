import 'dart:io';
import 'package:domain/entities/project.dart';
import 'package:domain/repositories/i_project_repository.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;


class ProjectRepositoryMock implements IProjectRepository {
  static const _boxName = 'projects_box';

  Future<Box> _box() => Hive.isBoxOpen(_boxName)
      ? Future.value(Hive.box(_boxName))
      : Hive.openBox(_boxName);

  @override
  Future<List<Project>> getProjects() async {
    final box = await _box();
    return box.values.map((e) => Project.fromJson(e as Map<String, dynamic>)).toList();
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
    await Future.delayed(const Duration(milliseconds: 900));
    final dir = await getApplicationDocumentsDirectory();
    final fileName = 'project_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final project = Project(
      id: 'proj_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      dateStart: dateStart,
      dateEnd: dateEnd,
      gender: gender,
      category: category,
      descriptionSource: descriptionSource,
      imagePath: '${dir.path}/$fileName',
      userId: '2',
    );

    final box = await _box();
    await box.put(project.id, project.toJson());

    return project;
  }
}