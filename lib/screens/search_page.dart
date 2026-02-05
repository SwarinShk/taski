import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/provider/task_provider.dart';
import 'package:taski_app/widgets/app_text_field.dart';
import 'package:taski_app/widgets/empty_state.dart';
import 'package:taski_app/widgets/task_expansion_tile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final filteredTasks = context.watch<TaskProvider>().filteredTasks;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 15),
          AppTextField(
            prefix: Amicons.vuesax_search_normal,
            hintText: 'Search tasks',
            focusedBorderColor: AppColor.themeColor,
            onChanged: (val) {
              context.read<TaskProvider>().search(val);
            },
          ),
          SizedBox(height: 25),
          Expanded(
            child: filteredTasks.isNotEmpty
                ? ListView.separated(
                    itemCount: filteredTasks.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final task = filteredTasks[index];

                      return TaskExpansionTile(
                        task: task,
                        onToggleComplete: (val) {
                          context.read<TaskProvider>().toggleTaskCompletion(
                            task.id,
                            task.isCompleted,
                          );
                        },
                      );
                    },
                  )
                : EmptyState(title: 'No result found.'),
          ),
        ],
      ),
    );
  }
}
