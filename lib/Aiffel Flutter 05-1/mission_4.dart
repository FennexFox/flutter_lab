import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Stream<int> test() {
    Duration duration = const Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(duration, (count) => count);
    return stream;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission 04-4: Stream Excercise'),
        ),
        body: Center(
          child: StreamBuilder(
              stream: test(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      '${snapshot.data}',
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'initializing...',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  );
                }
              }
            ),
        ),
      ),
    );
  }
}
