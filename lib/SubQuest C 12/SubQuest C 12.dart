import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.workspace_premium),
          title: const Center(
            child: Text('Subquest C 12'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    print('버튼이 눌렸습니다.');
                  },
                  child: const Text('Text')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    color: Colors.red,
                    width: 300,
                    height: 300,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 240,
                    height: 240,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 180,
                    height: 180,
                  ),
                  Container(
                    color: Colors.green,
                    width: 120,
                    height: 120,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 60,
                    height: 60,
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
