import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_firebase/core/cubits/task_cubit.dart';
import 'package:todo_firebase/core/entity/task_entity.dart';
import 'package:todo_firebase/main.dart';
import 'package:todo_firebase/widgets/input_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController controllerTitle;
  late TextEditingController controllerDescription;

  @override
  void initState() {
    controllerTitle = TextEditingController();
    controllerDescription = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add task"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              InputWidget(
                labelText: "Title",
                controller: controllerTitle,
                onChanged: (value) {},
                onTap: () {},
              ),
              InputWidget(
                labelText: "Description",
                controller: controllerDescription,
                onChanged: (value) {},
                onTap: () {},
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<TaskCubit>(context).createTask(TaskEntity(
                id: uuid.v4(),
                title: controllerTitle.text,
                description: controllerDescription.text));
            Navigator.pop(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.save_alt),
        ),
      ),
    );
  }
}
