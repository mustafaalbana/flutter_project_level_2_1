// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, unnecessary_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_level_2_1/counter.dart';
import 'package:flutter_project_level_2_1/widgets/todo_card.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [
    Task(title: "Publish video", status: true),
    Task(title: "Laugh louder", status: true),
    Task(title: "GEM", status: true),
    Task(title: "call mom", status: true),
  ];

  delete(int clickedTask) {
    setState(() {
      allTasks.remove(allTasks[clickedTask]);
    });
  }

  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  final myController = TextEditingController();

  int calculateCompletedTasks() {
    int completedTasks = 0;

    for (var item in allTasks) {
      if (item.status) {
        completedTasks++;
      }
    }

    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)),
                  child: Container(
                    padding: EdgeInsets.all(22),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                            controller: myController,
                            maxLength: 20,
                            decoration:
                                InputDecoration(hintText: "Add new Task")),
                        SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              addnewtask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(fontSize: 22),
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(Icons.delete_forever),
              iconSize: 37,
              color: Color.fromARGB(255, 255, 188, 214),
            )
          ],
          elevation: 0,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          title: Text(
            "TO DO APP",
            style: TextStyle(
                fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Counter(
                  allTodos: allTasks.length,
                  allCompleted: calculateCompletedTasks()),
              Container(
                margin: EdgeInsets.only(top: 22),
                height: 550,
                color: Color.fromARGB(255, 55, 63, 82),
                child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Todecard(
                          vartitle: allTasks[index].title,
                          doneORnot: allTasks[index].status,
                          changeStatus: changeStatus,
                          index: index,
                          delete: delete
                          );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
