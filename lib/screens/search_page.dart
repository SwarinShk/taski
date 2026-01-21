import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/widgets/app_text_field.dart';
import 'package:taski_app/widgets/empty_state.dart';
import 'package:taski_app/widgets/task_expansion_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          AppTextField(
            prefix: Amicons.vuesax_search_normal,
            hintText: 'Search city',
            focusedBorderColor: AppColor.themeColor,
          ),
          Expanded(child: EmptyState(title: 'No result found.')),
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
