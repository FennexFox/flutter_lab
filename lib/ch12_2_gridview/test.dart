import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<String> citys = ['서울시', '인천시', '부산시', '대구시', '대전시', '광주시', '울산시', '세종시'];

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: GridView.builder(
          itemCount: citys.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [Text(citys[index]), Image.asset('images/big.jpeg')],
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
      ),
    );
  }
}
