import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String result = '';

  onPressGet() async {
    Map<String, String> headers = {
      "accept": "application/json",
    };
    http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        result = response.body;
      });
    } else {
      debugPrint('error......');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission 04-2: http Excercise'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                textAlign: TextAlign.center,),
              ElevatedButton(
                onPressed: onPressGet,
                child: const Text('http GET'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
