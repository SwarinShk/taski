import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/widgets/app_button.dart';
import 'package:taski_app/widgets/app_text_field.dart';

class TaskBottomSheet extends StatelessWidget {
  const TaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          crossAxisAlignment: .end,
          children: [
            AppTextField(
              prefix: Amicons.vuesax_tick_square,
              hintText: 'What\'s in your mind?',
              onChanged: (value) {},
            ),
            SizedBox(height: 15),
            AppTextField(
              prefix: Amicons.vuesax_edit_2,
              hintText: 'What\'s in your mind?',
              maxLine: 4,
              onChanged: (value) {},
            ),
            SizedBox(height: 25),
            AppButton(
              label: 'Create',
              itemColor: AppColor.themeColor,
              backgroundColor: AppColor.themeColor.withValues(alpha: 0.1),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
