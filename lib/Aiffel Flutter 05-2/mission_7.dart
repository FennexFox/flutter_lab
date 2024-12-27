import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mission7(),
    );
  }
}

class Mission7 extends StatefulWidget {
  const Mission7({super.key});

  @override
  Mission7State createState() => Mission7State();
}

class Mission7State extends State<Mission7> {
  String result = "데이터 미입력";
  late String data1, data2, data3;
  Uint8List imageDecode = Uint8List(0);

  TextEditingController urlController = TextEditingController();

  Future<void> fetchData() async {
    try {
      final inputUrl = urlController.text;
      final response = await http.get(
        Uri.parse(inputUrl),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420', // used to bypass the ngrock free-acount warning page
        },
      );
      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        final List<dynamic> data = jsonResponse['result'];
        imageDecode = base64Decode(jsonResponse['image']);

        data1 = "1st likely: ${data[0][0]} for ${double.parse(data[0][1]).toStringAsFixed(2)}";
        data2 = "2nd likely: ${data[1][0]} for ${double.parse(data[1][1]).toStringAsFixed(2)}";
        data3 = "3rd likely: ${data[2][0]} for ${double.parse(data[2][1]).toStringAsFixed(2)}";

        setState(() {
          result = "$data1 \n $data2 \n $data3";
        });
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mission 08: HTTP Request"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: urlController,
              decoration: InputDecoration(labelText: "URL을 입력하세요"),
            ),
            ElevatedButton(
              onPressed: fetchData,
              child: Text("품종 예측 가져오기"),
            ),
            SizedBox(height: 20),
            Image.memory(imageDecode),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}