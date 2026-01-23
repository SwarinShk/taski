import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/provider/task_provider.dart';
import 'package:taski_app/widgets/app_text_field.dart';
import 'package:taski_app/widgets/empty_state.dart';
import 'package:taski_app/widgets/task_expansion_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          SizedBox(height: 25),
          Expanded(
            child: Provider.of<TaskProvider>(context).tasks.isNotEmpty
                ? ListView.separated(
                    itemCount: Provider.of<TaskProvider>(context).tasks.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final task = Provider.of<TaskProvider>(
                        context,
                      ).tasks[index];

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
                : EmptyState(title: 'No result found.'),
          ),
        ],
      ),
    );
  }
}
