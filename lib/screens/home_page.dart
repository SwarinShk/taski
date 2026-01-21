import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
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
  final List<TaskItem> tasks = [
    TaskItem(
      title: 'Design sign up flow',
      description:
          'By the time a prospect arrives at your signup page, in most cases, they\'ve already By the time a prospect arrives at your signup page, in most cases.',
    ),
    TaskItem(
      title: 'Design use case page',
      description:
          'By the time a prospect arrives at your signup page, in most cases, they\'ve already By the time a prospect arrives at your signup page, in most cases.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
            'Create tasks to achieve more.',
            style: GoogleFonts.urbanist(
              color: AppColor.secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: EmptyState(
              title: 'You have no task listed',
              child: AppButton(
                icon: Amicons.vuesax_add,
                label: 'Create task',
                itemColor: AppColor.themeColor,
                backgroundColor: AppColor.themeColor.withValues(alpha: 0.1),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const TaskBottomSheet(),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (_, _) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final task = tasks[index];

                return TaskExpansionTile(
                  task: task,
                  onToggleComplete: (val) {
                    setState(() {
                      task.isCompleted = val ?? false;
                    });
                  },
                  onExpansionChanged: (expanded) {
                    setState(() {
                      task.isExpanded = expanded;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
