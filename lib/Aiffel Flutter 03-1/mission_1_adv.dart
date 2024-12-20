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
        title: const Text('Mission 03-1_adv.: Navigation'),
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
      body: const Center(
        child: Text('This is the Recipe 1 screen.'),
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
      body: const Center(
        child: Text('This is the Recipe 2 screen.'),
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
      body: const Center(
        child: Text('This is the Recipe 3 screen.'),
      ),
    );
  }
}
