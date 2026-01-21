import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/utils/task_model.dart';
import 'package:taski_app/widgets/app_button.dart';
import 'package:taski_app/widgets/app_text_field.dart';

class TaskBottomSheet extends StatefulWidget {
  final String actionLabel;
  final void Function(TaskModel task) onSubmit;

  const TaskBottomSheet({
    super.key,
    required this.onSubmit,
    this.actionLabel = 'Create',
  });

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty) return;

    widget.onSubmit(
      TaskModel(title: title, description: description, isCompleted: false),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppTextField(
              prefix: Amicons.vuesax_tick_square,
              hintText: 'What\'s in your mind?',
              controller: _titleController,
            ),
            const SizedBox(height: 15),
            AppTextField(
              prefix: Amicons.vuesax_edit_2,
              hintText: 'Add a note...',
              controller: _descriptionController,
              maxLine: 4,
            ),
            const SizedBox(height: 25),
            AppButton(
              label: widget.actionLabel,
              itemColor: AppColor.themeColor,
              backgroundColor: AppColor.themeColor.withValues(alpha: 0.1),
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
