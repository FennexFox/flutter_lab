import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class BucketList {
  static List<Product> bucektList = [];

  static void add(Product argument) {
    bucektList.add(argument);
  }

  static void clear() {
    bucektList = [];
  }

  static Map<String, int> show() { // 추가기능 구현하기
    Map<String, int> bucketListProcessed = {};

    for (Product product in bucektList) {
      bucketListProcessed.update(
        product.name, (value) => value + product.price,
        ifAbsent: () => product.price
      );
    }

    return bucketListProcessed;
  }
}

class Product {
  final String name;
  final IconData icon;
  final int price;

  Product(this.name, this.price) : icon = Icons.dining_sharp;
}

ElevatedButton buildTextButton(BuildContext context, String text, String route) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child: Text(text)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Home',
      routes: {
        '/Home': (context) => HomeScreen(),
        '/RecipePage': (context) => const RecipePage(),
        '/Cart': (context) => const Cart(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final List<Product> recipes = [
    Product("찰순대", 6000), Product("토종순대", 8000), Product("피순대", 7000),
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
              Navigator.pushNamed(context, '/RecipePage', arguments: recipes[index]);
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

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    Product arg = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg.name),
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is the Recipe screen of ${arg.name}'),
            ElevatedButton(
              onPressed: () {BucketList.add(arg);},
              child: const Text("장바구니 담기")),
            buildTextButton(context, "장바구니 가기", "/Cart"),
            buildTextButton(context, "홈으로 나가기", "/Home"),
          ]
        ),
      ),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("장바구니"),
      ),
      body: Center(
        child: Column(
          children: [
            for (var entry in BucketList.show().entries)
            Text("${entry.key}: ${entry.value}원"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  BucketList.clear();});
                },
              child: const Text("장바구니 비우기")
            ),
            buildTextButton(context, "홈으로 나가기", "/Home"),
          ],
        ),
      ),
    );
  }
}