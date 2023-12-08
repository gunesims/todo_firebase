import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_firebase/core/api/firestore_api.dart';
import 'package:todo_firebase/core/entity/task_entity.dart';
import 'package:todo_firebase/locator.dart';
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
  late FirestoreApi api;
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _createTask() {
    final taskEntity = TaskEntity(
        id: uuid.v4(),
        title: controllerTitle.text,
        description: controllerDescription.text);
    api.post(taskEntity);
  }

  _initialize() {
    controllerTitle = TextEditingController();
    controllerDescription = TextEditingController();
    api = locator();
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
            _createTask();
            Navigator.pop(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.save_alt),
        ),
      ),
    );
  }
}
