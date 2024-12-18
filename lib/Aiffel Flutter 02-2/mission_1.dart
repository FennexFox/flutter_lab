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
          title: const Text('Mission 02-2: Calculator Layout'),
        ),

        body: Column(
          children: [
            Container(
              width: 80, height: 25, color: Colors.blueGrey,
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(margin: const EdgeInsets.only(right: 5), child: const Text('[7]'),),
                    Container(margin: const EdgeInsets.symmetric(horizontal: 5), child: const Text('[8]'),),
                    Container(margin: const EdgeInsets.only(left: 5), child: const Text('[9]'),),
                  ],
                )
            ),
            Container(
              width: 80, height: 30, color: Colors.blueGrey,
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(margin: const EdgeInsets.only(right: 5), child: const Text('[4]'),),
                    Container(margin: const EdgeInsets.symmetric(horizontal: 5), child: const Text('[5]'),),
                    Container(margin: const EdgeInsets.only(left: 5), child: const Text('[6]'),),
                  ],
                )
            ),
            Container(
              width: 80, height: 25, color: Colors.blueGrey,
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(margin: const EdgeInsets.only(right: 5), child: const Text('[1]'),),
                    Container(margin: const EdgeInsets.symmetric(horizontal: 5), child: const Text('[2]'),),
                    Container(margin: const EdgeInsets.only(left: 5), child: const Text('[3]'),),
                  ],
                )
            )
          ]
        ),
      )
    );
  }
}