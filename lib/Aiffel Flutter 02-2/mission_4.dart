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
          title: const Text('Mission 02-4: Checkbox and Switch'),
        ),
        body: inputWidgetExcercise()
      )
    );
  }
}

class inputWidgetExcercise extends StatefulWidget {
  const inputWidgetExcercise({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<inputWidgetExcercise> {

  bool isDarkThemed = true;
  bool? isSubscribed = false;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Dark Mode theme'),
        Row(
          children: [
            Switch(
                value: isDarkThemed,
                onChanged: (bool value){
                  setState(() {
                    isDarkThemed = value;
                    text = 'Dark Mode Eneabled: $isDarkThemed';
                    print(text);
                  });
                }
            ),
            Text(text),
          ],
        ),
        Container(height: 5,),
        const Text('Notification Setting'),
        Row(
          children: [
            Checkbox(
              value: isSubscribed,
              onChanged: (bool? value){
                setState(() {
                  isSubscribed = value;
                  text = 'Notification Enabled: $isSubscribed';
                  print(text);
                });
              }
            ),
            Text('Notification Enabled: $isSubscribed')
          ],
        ),
      ],
    );
  }
}