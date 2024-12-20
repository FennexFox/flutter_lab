import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Recipe {
  final String name;
  final IconData icon;

  Recipe(this.name) : icon = Icons.dining_sharp;

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/찰순대': (context) => const Recipe1(),
        '/토종순대': (context) => const Recipe2(),
        '/피순대': (cotnext) => const Recipe3(),
        '/장바구니': (context) => const Checkout(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final List<Recipe> recipes = [
    Recipe("찰순대"), Recipe("토종순대"), Recipe("피순대"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mission 03-2_adv.: Shopping'),
        ),
      body: GridView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Column(
                children: [
                  Icon(recipes[index].icon),
                  Text(recipes[index].name),
                ],
              )
            ),
            onTap: () {
              Navigator.pushNamed(context, '/${recipes[index].name}');
            },
          );
        },
        scrollDirection: Axis.vertical,
        gridDelegate: 
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      )
    );
  }
}

class Recipe1 extends StatelessWidget {
  const Recipe1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe 1'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('This is the Recipe 1 screen.'),
            ElevatedButton(
              onPressed: () {Navigator.pushNamed(context, "/장바구니", arguments: "찰순대");},
              child: const Text("담기"),
            )
          ]
        ),
      ),
    );
  }
}

class Recipe2 extends StatelessWidget {
  const Recipe2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe 2'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('This is the Recipe 2 screen.'),
            ElevatedButton(
              onPressed: () {Navigator.pushNamed(context, "/장바구니", arguments: "토종순대");},
              child: const Text("담기"),
            )
          ]
        ),
      ),
    );
  }
}

class Recipe3 extends StatelessWidget {
  const Recipe3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe 3'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('This is the Recipe 3 screen.'),
            ElevatedButton(
              onPressed: () {Navigator.pushNamed(context, "/장바구니", arguments: "피순대");},
              child: const Text("담기"),
            )
          ]
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    String arg = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg),
      ),
      body: Center(
        child: Text(arg),
      ),
    );
  }

}