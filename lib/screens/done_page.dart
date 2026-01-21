import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/widgets/empty_state.dart';
import 'package:taski_app/widgets/task_expansion_tile.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
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
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Completed Tasks',
                style: GoogleFonts.urbanist(
                  color: AppColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tasks.removeRange(0, tasks.length);
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Delete all',
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fireRed,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Expanded(
            child: tasks.isNotEmpty
                ? ListView.separated(
                    itemCount: tasks.length,
                    separatorBuilder: (_, _) => SizedBox(height: 15),
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
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete_rounded,
                            color: AppColor.fireRed,
                          ),
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      );
                    },
                  )
                : EmptyState(title: 'No completed task found'),
          ),
        ],
      ),
    );
  }
}
