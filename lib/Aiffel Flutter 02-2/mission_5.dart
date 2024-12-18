import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class Task {
  String taskName;
  int keyNumber = Random().nextInt(1000);
  bool? isChecked = false;
  String? stateLog;
  Task(this.taskName);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission 02-5: To-Do List'),
        ),
        body: ToDoExcercise()
      )
    );
  }
}

class ToDoExcercise extends StatefulWidget {
  const ToDoExcercise({super.key});

  @override
  ToDoState createState() => ToDoState();
}

class ToDoState extends State {
  List<Task> users = [
    Task('할일01'), Task('할일02'), Task('할일03'), Task('할일04'), Task('할일05'),
    Task('할일06'), Task('할일07'), Task('할일08'), Task('할일09'), Task('할일10'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: Checkbox(
            value: users[index].isChecked,
            onChanged: (bool? value){
              setState(() {
                users[index].isChecked = value;
                users[index].stateLog = 'task ${users[index].keyNumber} isChecked: $value';
                print(users[index].stateLog);
              });
            }
          ),
          title: Text(users[index].taskName),
          subtitle: Text(users[index].keyNumber.toString()),
          trailing: const Icon(Icons.more_vert),
          onTap: (){
            print(users[index].taskName);
          },
        );
      },
      separatorBuilder: (context, index){
        return const Divider(height: 2, color: Colors.black,);
      },
    );
  }
}