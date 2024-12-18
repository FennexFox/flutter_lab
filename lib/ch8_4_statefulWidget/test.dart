import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title: const Text('Stateful Test'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  bool enabled = false;
  String stateText = "disabled";

  void changeCheck() {
    setState(() {
      if (enabled) {
        stateText = "disabled";
      } else {
        stateText = "enabled";
      }
      enabled = !enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: (enabled
            ? const Icon(
                Icons.check_box,
                size: 20,
              )
            : const Icon(
                Icons.check_box_outline_blank,
                size: 20,
              )
            ),
            color: Colors.red,
            onPressed: changeCheck,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              stateText,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}