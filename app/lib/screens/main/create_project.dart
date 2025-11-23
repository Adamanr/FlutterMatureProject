import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/components/input.dart';
import 'package:ui_kit/components/input_select.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';
import 'dart:io';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});
  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;

  final _types = ['User1', 'User2', 'User3'];
  final _clubs = ['Users1@mail.com', 'Users2@mail.com', 'Users3@mail.com'];
  final _category = ['Важное', 'Скучное', 'Нужное'];

  String? _selectedType;
  String? _selectedClub;
  String? _selectedCategory;
  DateTime? _selectedDate;
  final controller = TextEditingController();

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _image = File(picked.path));
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) => Theme(data: ThemeData.light().copyWith(colorScheme: const ColorScheme.light(primary: AppColors.primary)), child: child!),
    );
    if (date != null) setState(() => _selectedDate = date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Создать проект', style: AppTextStyles.h2),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              AppSelect<String>(
                label: 'Тип',
                hint: 'Выберите тип',
                value: _selectedType,
                items: _types.map((t) => DropdownOption(value: t, title: t)).toList(),
                onChanged: (v) => setState(() => _selectedType = v),
              ),
              const SizedBox(height: 24),

              AppTextField(
                hint: 'Название проекта',
                label: 'Название проекта',
                controller: controller,
                prefixIcon: const Icon(Icons.folder_outlined),
              ),
              const SizedBox(height: 24),

              const SizedBox(height: 8),
              AppTextField(
                hint: _selectedDate == null ? '— — — —' : '${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                onTap: _selectDate,
                label: "Дата начала",
                //readOnly: true,
                prefixIcon: const Icon(Icons.calendar_today_outlined),
              ),
              const SizedBox(height: 24),

              AppTextField(
                hint: _selectedDate == null ? '— — — —' : '${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                onTap: _selectDate,
                label: "Дата окончания",
                prefixIcon: const Icon(Icons.calendar_today_outlined),
              ),
              const SizedBox(height: 24),

              const SizedBox(height: 8),
              AppSelect<String>(
                label: 'Кому',
                hint: 'Выберите кому',
                value: _selectedClub,
                items: _clubs.map((c) => DropdownOption(value: c, title: c)).toList(),
                onChanged: (v) => setState(() => _selectedClub = v),
              ),
              const SizedBox(height: 24),

              const SizedBox(height: 8),

              AppTextField(
                label: 'Источник описания',
                hint: 'example.com',
              ),

              const SizedBox(height: 32),

              AppSelect<String>(
                label: 'Категория',
                hint: 'Выберите категорию',
                value: _selectedCategory,
                items: _category.map((c) => DropdownOption(value: c, title: c)).toList(),
                onChanged: (v) => setState(() => _selectedCategory = v),
              ),
              const SizedBox(height: 24),

              Text('Фото проекта', style: AppTextStyles.bodyMedium),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border, style: BorderStyle.solid),
                  ),
                  child: _image == null
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo_outlined, size: 48, color: AppColors.textSecondary),
                      const SizedBox(height: 12),
                      Text('Добавить фото', style: AppTextStyles.body.copyWith(color: AppColors.textSecondary)),
                    ],
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Подтвердить',
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _selectedType != null && _selectedDate != null) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Проект создан!')),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}