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
              title: const Text('Mission 02-3: Textfield'),
            ),
            body: TextfieldExcercise()
        )
    );
  }
}

class TextfieldExcercise extends StatefulWidget {
  const TextfieldExcercise({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<TextfieldExcercise> {

  final nameTextController = TextEditingController();
  final mailTextController = TextEditingController();

  void _printInputText(text) {
    print("_printValue(): $text");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    mailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
        ),
        TextField(
          style: const TextStyle(fontSize: 15.0),
          controller: nameTextController,
          decoration: const InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.account_box),
            border: OutlineInputBorder(),
            hintText: "사용자 이름",
            helperText: "이름을 입력하세요.",
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          onSubmitted: _printInputText,
        ),
        Container(
          height: 5,
        ),
        TextField(
          style: const TextStyle(fontSize: 15.0),
          controller: mailTextController,
          decoration: const InputDecoration(
            labelText: 'Usermail',
            prefixIcon: Icon(Icons.alternate_email),
            border: OutlineInputBorder(),
            hintText: "사용자 메일",
            helperText: "이메일 주소를 입력하세요.",
          ),
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.emailAddress,
          onSubmitted: _printInputText,
        ),
      ],
    );
  }
}