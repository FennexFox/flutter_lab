import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  onPressed() {
    print('icon button click....');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Test'),
            ),
            body: Column(
                children: [
                  GestureDetector(
                    child: Image.asset('images/icon/user.png'),
                    onTap: (){
                      print('image click...');
                    },
                    onVerticalDragStart: (DragStartDetails details){
                      print('vertical drag start...global position : ${details.globalPosition.dx}, ${details.globalPosition.dy}');
                      print('vertical drag start...local position : ${details.localPosition.dx}, ${details.localPosition.dy}');
                    },
                    onVerticalDragEnd: (DragEndDetails details){
                      print('vertical drag end...global position : ${details.globalPosition.dx}, ${details.globalPosition.dy}');
                      print('vertical drag end...local position : ${details.localPosition.dx}, ${details.localPosition.dy}');
                    }
                  ),
                  ElevatedButton(
                    onPressed: (){
                      print('ElevatedButton click....');
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.red)
                    ),
                    child: Text('Click Me'),
                  )
                ]
            )
        )
    );
  }
}
