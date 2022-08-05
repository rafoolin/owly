import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/app_padding.dart';
import '../../../task_management/domain/todo_task.dart';
import '../../../task_management/presentation/task_view.dart';

class TaskCard extends StatelessWidget {
  final TodoTask task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(TaskView.path.replaceFirst(':id', task.id));
      },
      child: SizedBox(
        height: 84.0,
        child: Card(
          color: task.completed ? Colors.green.shade100 : null,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                width: 20.0,
                height: double.infinity,
                decoration: BoxDecoration(color: task.categoryColor),
                child: task.completed
                    ? const Icon(FontAwesomeIcons.check, size: 10.0)
                    : null,
              ),
              Expanded(
                child: Padding(
                  padding: AppPadding.padding,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(task.title),
                          Text(DateFormat.Hm().format(task.dueDatetime)),
                        ],
                      ),
                      AppPadding.vertical(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (task.note != null)
                            Expanded(
                              child: Text(
                                task.note!.trim(),
                                style: const TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          if (task.subTasks.isNotEmpty) ...[
                            AppPadding.horizontal(),
                            Text(
                              task.todoOverAllStr,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ]
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
