import 'package:intl/intl.dart';

class Project {
  final String id;
  final String title;
  final DateTime dateStart;
  final DateTime? dateEnd;
  final String gender;
  final String descriptionSource;
  final String category;
  final String imagePath; // url
  final String userId;

  const Project({
    required this.id,
    required this.title,
    required this.dateStart,
    this.dateEnd,
    required this.gender,
    required this.descriptionSource,
    required this.category,
    required this.imagePath,
    required this.userId,
  });

  static Project fromJson(Map<String, dynamic> json) {
    final dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      dateStart: dateFormat.parseUTC(json['dateStart'] as String),
      dateEnd: json['dateEnd'] != null ? dateFormat.parseUTC(json['dateEnd'] as String) : null,
      gender: json['gender'] as String? ?? '',
      descriptionSource: json['description_source'] as String? ?? '',
      category: json['category'] as String? ?? '',
      imagePath: json['image'] as String? ?? '',
      userId: json['user_id'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'dateStart': DateFormat("yyyy-MM-dd HH:mm:ss").format(dateStart.toUtc()),
    if (dateEnd != null) 'dateEnd': DateFormat("yyyy-MM-dd HH:mm:ss").format(dateEnd!.toUtc()),
    'gender': gender,
    'description_source': descriptionSource,
    'category': category,
    'image': imagePath,
    'user_id': userId,
  };
}

class ProjectListResponse {
  final List<Project> items;
  final int totalItems;

  const ProjectListResponse({required this.items, required this.totalItems});

  static ProjectListResponse fromJson(Map<String, dynamic> json) => ProjectListResponse(
    items: (json['items'] as List).map((e) => Project.fromJson(e)).toList(),
    totalItems: json['totalItems'] as int,
  );
}