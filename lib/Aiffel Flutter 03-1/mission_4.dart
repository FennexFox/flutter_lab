import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mission 03-4: Navigator",
      home: Navigator(pages: [
        const MaterialPage(child: DetailScreen()),
        const MaterialPage(child: HomeScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
        ),
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home:
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
      )
    );
  }
}

class DetailScreen extends StatelessWidget{
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home:
      Scaffold(
        appBar: AppBar(
          title: const Text('Mission 01: Navigation'),
          ),

        body: Center(
          child:
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("This is DetailScreen"),
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
      )
    );
  }
}

class RoutePath {
  String? id;

  RoutePath.home() : id = null;
  RoutePath.detail(this.id);
}

// class RouteInformParser extends RouteInformationParser<RoutePath> (
  
// ) 