import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mission 02-2: Layout Positining',
            style: TextStyle(
              fontSize: 15,
            )
          ),
        ),

        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 300, height: 200, color: Colors.blue,
                ),
                const Positioned(
                  right: 20, bottom:20,
                  child: Text(
                    "Hello, Flutter!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                )
              ]
            )
          ]
        ),
      ),
    );
  }
}