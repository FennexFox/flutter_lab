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
            title: const Text(
              'Mission 02-8: Bottom Sheet',
              style: TextStyle(
                fontSize: 15,
              )
            ),
          ),
          body: const DialogExcercise()
        )
      );
  }
}

class DialogExcercise extends StatefulWidget {
  const DialogExcercise({super.key});

  @override
  DialogState createState() => DialogState();
}

class DialogState extends State<DialogExcercise> {
  DateTime dateValue = DateTime.now();
  TimeOfDay timeValue = TimeOfDay.now();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _modalBottomSheet,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share),
                Text('공유하기'),
              ],
            )
          ),
        ],
      ),
    );
  }

  _modalBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.yellow,
        builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.facebook),
                  title: const Text('페이스북'),
                  onTap: () {
                    Navigator.of(context).pop();
                    print('페이스북');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('트위터'),
                  onTap: () {
                    Navigator.of(context).pop();
                    print('트위터');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('이메일'),
                  onTap: () {
                    Navigator.of(context).pop();
                    print('이메일');
                  },
                ),
              ],
            ),
          );
        });
  }

}
