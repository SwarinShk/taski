import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/utils/task_model.dart';

class TaskExpansionTile extends StatelessWidget {
  final TaskModel task;
  final Function(bool?) onToggleComplete;
  final Widget trailing;

  const TaskExpansionTile({
    super.key,
    required this.task,
    required this.onToggleComplete,
    this.trailing = const Icon(Amicons.vuesax_more, color: AppColor.hintColor),
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: PageStorageKey(task.title),
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      backgroundColor: AppColor.borderColor.withValues(alpha: 0.5),
      collapsedBackgroundColor: AppColor.borderColor.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: onToggleComplete,
        checkColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(width: 2, color: AppColor.hintColor),
      ),
      title: Text(
        task.title,
        style: GoogleFonts.urbanist(
          color: AppColor.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: trailing,
      tilePadding: const EdgeInsets.only(right: 10),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        Text(
          task.description,
          style: GoogleFonts.urbanist(
            fontSize: 14,
            color: AppColor.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
