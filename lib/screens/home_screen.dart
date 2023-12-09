import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_firebase/core/cubits/task_cubit.dart';
import 'package:todo_firebase/core/utils/assets.dart';
import 'package:todo_firebase/widgets/input_widget.dart';
import 'package:todo_firebase/widgets/success_flush_bar.dart';
import 'package:todo_firebase/widgets/task_card_widget.dart';

import '../widgets/error_flash_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initialize() {
    BlocProvider.of<TaskCubit>(context).fetchTask();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Tasks"),
        ),
        body: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            if (state is TaskError) {
              ErrorFlushBar(state.message).show(context);
            }
            if (state is TaskSuccess) {
              SuccessFlushBar(state.message).show(context);
            }
          },
          builder: (context, state) {
            if (state is TaskLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }

            if (state is TaskLoaded) {
              final listOfTasks = state.listOfData;
              if (listOfTasks.isEmpty) {
                return Center(
                  child: Lottie.asset(Assets.tEmpty),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    InputWidget(
                      onTap: () {},
                      onChanged: (value) {},
                      labelText: "Search",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listOfTasks.length,
                        itemBuilder: (context, index) {
                          final entity = listOfTasks[index];
                          return Dismissible(
                            direction: DismissDirection.startToEnd,
                            resizeDuration: const Duration(milliseconds: 500),
                            key: UniqueKey(),
                            onDismissed: (value) {
                              BlocProvider.of<TaskCubit>(context)
                                  .deleteTask(entity.id);
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.red,
                              ),
                              padding: const EdgeInsets.only(left: 28.0),
                              alignment: AlignmentDirectional.centerStart,
                              child: const Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: TaskCardWidget(taskEntity: entity),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Text("No connection");
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_task');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
