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
              title: const Text('Test'),
            ),
            body: TestScreen()
        )
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {

  bool? isChecked = true;
  String? selectPlatform;
  double sliderValue = 5.0;
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Checkbox Test'),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? value){
                  setState(() {
                    isChecked = value;
                  });
                }
            ),
            Text('checkbox value is $isChecked')
          ],
        ),
        const Text('Radio Test'),
        Row(
          children: [
            Radio(
                value: "android",
                groupValue: selectPlatform,
                onChanged: (String? value){
                  setState(() {
                    selectPlatform = value;
                  });
                }
            ),
            const Text('android')
          ],
        ),
        Row(
          children: [
            Radio(
                value: "ios",
                groupValue: selectPlatform,
                onChanged: (String? value){
                  setState(() {
                    selectPlatform = value;
                  });
                }
            ),
            const Text('ios')
          ],
        ),
        Text('select platform is $selectPlatform'),
        const Text('Slider Test'),
        Slider(
            value: sliderValue,
            min: 0,
            max: 10,
            onChanged: (double value){
              setState(() {
                sliderValue = value;
              });
            }
        ),
        Text('slider value is $sliderValue'),
        const Text('Switch Test'),
        Switch(
            value: switchValue,
            onChanged: (bool value){
              setState(() {
                switchValue = value;
              });
            }
        ),
        Text('select value is $switchValue')
      ],
    );
  }
}