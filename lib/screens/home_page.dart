import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/provider/task_provider.dart';
import 'package:taski_app/widgets/app_button.dart';
import 'package:taski_app/widgets/empty_state.dart';
import 'package:taski_app/widgets/task_bottom_sheet.dart';
import 'package:taski_app/widgets/task_expansion_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pendingTasks = Provider.of<TaskProvider>(
      context,
    ).tasks.where((task) => !task.isCompleted).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: 15),
          RichText(
            text: TextSpan(
              style: GoogleFonts.urbanist(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColor.black,
              ),
              children: [
                TextSpan(text: 'Welcome, '),
                TextSpan(
                  text: 'John',
                  style: GoogleFonts.urbanist(color: AppColor.themeColor),
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            pendingTasks.isNotEmpty
                ? 'You\'ve got ${pendingTasks.length} tasks to do.'
                : 'Create tasks to achieve more.',
            style: GoogleFonts.urbanist(
              color: AppColor.secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: pendingTasks.isNotEmpty
                ? ListView.separated(
                    itemCount: pendingTasks.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final task = pendingTasks[index];

                      return TaskExpansionTile(
                        task: task,
                        onToggleComplete: (val) {
                          Provider.of<TaskProvider>(
                            context,
                            listen: false,
                          ).completeTask(task);
                        },
                      );
                    },
                  )
                : EmptyState(
                    title: 'You have no task listed',
                    child: AppButton(
                      icon: Amicons.vuesax_add,
                      label: 'Create task',
                      itemColor: AppColor.themeColor,
                      backgroundColor: AppColor.themeColor.withValues(
                        alpha: 0.1,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => TaskBottomSheet(),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
