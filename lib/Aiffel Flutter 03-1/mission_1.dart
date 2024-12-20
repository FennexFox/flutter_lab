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
        title: const Text('Mission 03-1: Navigation'),
        ),

      body: Center(
        child:
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("This is HomeScreen"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:
                  ElevatedButton(
                    child: const Text("Access DetailScreen"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail');
                    }
                  ),
              ),
            ]
          ),
      )
    );
  }
}

class DetailScreen extends StatelessWidget{
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Mission 03-1: Navigation'),
    ),

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is DetailScreen"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
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
