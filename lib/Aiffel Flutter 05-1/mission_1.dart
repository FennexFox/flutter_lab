import 'package:flutter/material.dart';
import 'package:flutter/services.dart'  show rootBundle;
import 'dart:convert';

void main() {
  runApp(const JsonExercise());
}

class JsonExercise extends StatefulWidget {
  const JsonExercise({super.key});

  @override
  State<StatefulWidget> createState() {
    return JsonExerciseState();
  }
}

class JsonExerciseState extends State<JsonExercise> {
  Map<String, dynamic>? jsonMap;
  String resultKeys = '';
  String resultValues = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission 05-1: Json Exercise'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(resultKeys),
              Text(resultValues),
              ElevatedButton(
                onPressed: () async {
                  final String response = await rootBundle.loadString('assets/Aiffel_05/mission_1.json');
                  final data = await json.decode(response) as Map<String, dynamic>;
                  setState(() {
                    jsonMap = data;
                    if (jsonMap == null) {
                      resultKeys = 'No data';
                      resultValues = 'No data';
                    } else {
                      resultKeys = 'keys : ${jsonMap!["user"]["address"].keys}';
                      resultValues = 'values : ${jsonMap!["user"]["address"].values}';
                    }
                  });
                },
                child: const Text(
                  'Address Keys and Values',
                  textAlign: TextAlign.center,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}