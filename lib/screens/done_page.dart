import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/utils/tasks.dart';
import 'package:taski_app/widgets/empty_state.dart';
import 'package:taski_app/widgets/task_expansion_tile.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    final completedTasks = tasks.where((task) => task.isCompleted).toList();

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
                onPressed: completedTasks.isEmpty
                    ? null
                    : () {
                        setState(() {
                          tasks.removeWhere((task) => task.isCompleted);
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
            child: completedTasks.isNotEmpty
                ? ListView.separated(
                    itemCount: completedTasks.length,
                    separatorBuilder: (_, _) => SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final task = completedTasks[index];

                      return TaskExpansionTile(
                        task: task,
                        onToggleComplete: (val) {
                          setState(() {
                            task.isCompleted = val ?? false;
                          });
                        },
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              tasks.remove(task);
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
