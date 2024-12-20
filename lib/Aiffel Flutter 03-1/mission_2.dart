import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Mission 03-2: Navigation'),
        ),

      body: const Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                    "This is HomeScreen. \n Write something below \n to acess DetailScreen.",
                    textAlign: TextAlign.center,),
              ),
              SizedBox(
                width: 250,
                child: TextfieldTest(),
              )
            ]
          ),
        ),
    );
  }
}

class DetailScreen extends StatelessWidget{
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
  String arg = ModalRoute.of(context)?.settings.arguments as String;
  return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Mission 03-2: Navigation'),
        ),

      body: Center(
        child:
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("This is DetailScreen."),
              Text('Your input was: $arg'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:
                  ElevatedButton(
                    child: const Text("Exit DetailScreen"),
                    onPressed: () {Navigator.pop(context);}
                  ),
              ),
            ]
          ),
      )
    );
  }
}

class TextfieldTest extends StatefulWidget {
  const TextfieldTest({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<TextfieldTest> {

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 15.0),
      controller: controller,
      decoration: const InputDecoration(
        labelText: '전달할 문자열',
        prefixIcon: Icon(Icons.text_format),
        border: OutlineInputBorder(),
        hintText: "arguments",
        helperText: "전달할 문자열을 입력하세요.",
      ),
      keyboardType: TextInputType.text,
      onSubmitted: (text) {Navigator.pushNamed(context, "/detail", arguments: text);}
    );
  }
}