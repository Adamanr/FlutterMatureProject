import 'package:app/screens/main/create_project.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/components/input.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});
  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<Project> projects = [
    Project(
      name: 'Мой первый проект',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isEmpty = projects.isEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Проекты', style: AppTextStyles.h2, textAlign: TextAlign.center),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const CreateProjectScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: isEmpty
          ? _EmptyProjectsWidget(onCreate: _createNewProject)
          : ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: projects.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, i) {
          final project = projects[i];
          return _ProjectCard(project: project);
        },
      ),
    );
  }

  void _createNewProject() {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Новый проект', style: AppTextStyles.h2),
              const SizedBox(height: 20),
              AppTextField(
                hint: 'Название проекта',
                controller: controller,
                prefixIcon: const Icon(Icons.folder_outlined),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Создать',
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      setState(() {
                        projects.add(Project(
                          name: controller.text.trim(),
                          createdAt: DateTime.now(),
                        ));
                      });
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Project {
  final String name;
  final DateTime createdAt;
  Project({required this.name, required this.createdAt});
}

class _EmptyProjectsWidget extends StatelessWidget {
  final VoidCallback onCreate;
  const _EmptyProjectsWidget({required this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.folder_open_outlined, size: 80, color: AppColors.disabled),
          const SizedBox(height: 24),
          Text('У вас пока нет проектов', style: AppTextStyles.h2.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 12),
          TextButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const CreateProjectScreen(),
                ),
              );
            },
            child: const Text('Создать первый проект', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  const _ProjectCard({required this.project});

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    if (diff == 0) return 'Сегодня';
    if (diff == 1) return 'Вчера';
    return 'Прошло $diff дн${diff % 10 == 1 && diff % 100 != 11 ? '' : 'ей'}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.name, style: AppTextStyles.h2.copyWith(fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  spacing: 100,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_formatDate(project.createdAt), style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary)),
                    AppButton(
                      text: 'Открыть',
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}