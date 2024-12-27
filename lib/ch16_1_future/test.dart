import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<int> sum() {
    return Future<int>(() {
      var sum = 0;
      for (int i = 0; i < 500000000; i++) {
        sum += i;
      }
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: FutureBuilder(
          future: sum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  '${snapshot.data}',
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              );
            }
            return const Center(
              child: Text(
                'waiting',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}
