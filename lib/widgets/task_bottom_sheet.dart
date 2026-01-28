import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/provider/task_provider.dart';
import 'package:taski_app/widgets/app_button.dart';
import 'package:taski_app/widgets/app_text_field.dart';

class TaskBottomSheet extends StatefulWidget {
  final String actionLabel;

  const TaskBottomSheet({super.key, this.actionLabel = 'Create'});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppTextField(
                prefix: Amicons.vuesax_tick_square,
                hintText: 'What\'s in your mind?',
                controller: _titleController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<TaskProvider>().createTask(
                      title: _titleController.text.trim(),
                      description: _descriptionController.text,
                    );
                    // Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
