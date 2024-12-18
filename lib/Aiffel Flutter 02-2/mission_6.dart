import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class Product {
  String productName;
  int price = Random().nextInt(10000) + 10000;
  IconData icon = Icons.warehouse;
  Product(this.productName);
}

class MyApp extends StatelessWidget {
  final List<Product> goods = [Product('제품1'), Product('제품2'), Product('제품3'), Product('제품4'), Product('제품5'), Product('제품6')];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission 02-6: Grid View'),
        ),
        body: GridView.builder(
          itemCount: goods.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Icon(goods[index].icon),
                  // Image.asset('images/big.jpeg'),
                  Text(goods[index].productName),
                  Text('${goods[index].price}')],
              ),
            );
          },
          scrollDirection: Axis.vertical,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ),
    );
  }
}
