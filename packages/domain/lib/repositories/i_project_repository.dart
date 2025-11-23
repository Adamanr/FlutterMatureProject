import 'dart:io';

import '../entities/project.dart';

abstract class IProjectRepository {
  Future<List<Project>> getProjects();
  Future<Project> createProject({
    required String title,
    required String typeProject,
    required DateTime dateStart,
    DateTime? dateEnd,
    required String gender,
    required String category,
    required String descriptionSource,
    required File image,
  });
}