import 'package:flutter/material.dart';
import 'package:todo_firebase/core/entity/task_entity.dart';

class TaskCardWidget extends StatelessWidget {
  final TaskEntity taskEntity;
  const TaskCardWidget({Key? key, required this.taskEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              blurRadius: 25,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(taskEntity.title),
            const Divider(),
            Text(taskEntity.description),
          ],
        ),
      ),
    );
  }
}
