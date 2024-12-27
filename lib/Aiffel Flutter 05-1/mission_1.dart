import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'dart:convert';

String jsonPath = path.join(Directory.current.path, 'assets/text', 'mission_1.json');
File jsonString = File(jsonPath);
var fileContent = jsonString.readAsStringSync();

void main() {
  runApp(const JsonExcercise());
}

class JsonExcercise extends StatefulWidget {
  const JsonExcercise({super.key});

  @override
  State<StatefulWidget> createState() {
    return JsonExcerciseState();
  }
}

class JsonExcerciseState extends State<JsonExcercise> {
  late Map<String, dynamic> jsonMap;
  String resultKeys = '';
  String resultValues = '';

  @override
  void initState() {
    super.initState();
    jsonMap = jsonDecode(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission 04-1: Json Excercise'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(resultKeys),
              Text(resultValues),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultKeys = 'keys : ${jsonMap["user"]["address"].keys}';
                    resultValues = 'values : ${jsonMap["user"]["address"].values}';
                  });
                },
                child: const Text(
                  'Adress Keys and Values',
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