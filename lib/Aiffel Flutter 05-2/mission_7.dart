import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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
  String result = "품종 예측 대기중";
  final String apiUrl = "http://127.0.0.1:5000/mission/601";
  late String data1, data2, data3;
  Uint8List imageDecode = Uint8List(0);
  XFile? selectedImage;  // 추가: 선택된 이미지 저장용 변수

  String getAdjustedUrl(String inputUrl) {
    try {
      if (Platform.isAndroid) {
        return inputUrl
            .replaceAll('localhost', '10.0.2.2')
            .replaceAll('127.0.0.1', '10.0.2.2');
      }      
      return inputUrl;
    }
    catch (e) {
      return inputUrl;
    }
  }

  Future<void> fetchData() async {
    try {
      final inputUrl = getAdjustedUrl(apiUrl);
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
          result = "$data1 \n$data2 \n$data3";
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

  Future<void> postImage() async {
    if (selectedImage == null) {
      setState(() {
        result = "이미지를 선택해주세요";
      });
      return;
    }

    try {
      final bytes = await selectedImage!.readAsBytes();
      final base64Image = base64Encode(bytes);  // 단순화된 인코딩
      
      print("Sending image of size: ${bytes.length} bytes");  // 디버깅용
      
      final inputUrl = getAdjustedUrl(apiUrl);
      final response = await http.post(
        Uri.parse(inputUrl),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
        body: jsonEncode({
          'image': base64Image  // 'data' 래퍼 제거
        }),
      );

      print("Response status: ${response.statusCode}");  // 디버깅용
      print("Response body: ${response.body}");  // 디버깅용

      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        final List<dynamic> data = jsonResponse['result'];
        imageDecode = base64Decode(jsonResponse['image']);

        data1 = "1st likely: ${data[0][0]} for ${double.parse(data[0][1]).toStringAsFixed(2)}";
        data2 = "2nd likely: ${data[1][0]} for ${double.parse(data[1][1]).toStringAsFixed(2)}";
        data3 = "3rd likely: ${data[2][0]} for ${double.parse(data[2][1]).toStringAsFixed(2)}";

        setState(() {
          result = "$data1\n$data2\n$data3";
        });
      } else {
        setState(() {
          result = "Failed to post image. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  void onImageSelected(XFile? image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mission 08: HTTP Request"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "API URL: \n $apiUrl",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 256, height: 304,
              child: Center(
                child: ImagePickerWidget(onImageSelected: onImageSelected),
              ),
            ),
            ElevatedButton(
              onPressed: postImage,
              child: Text("이미지 전송하기"),
            ),
            // ElevatedButton(
            //   onPressed: fetchData,
            //   child: Text("품종 예측하기"),
            // ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  final Function(XFile?) onImageSelected;
  
  const ImagePickerWidget({
    super.key,
    required this.onImageSelected,
  });

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  late XFile? _image;

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
      widget.onImageSelected(pickedFile);  // 추가: 상위 컴포넌트에 선택된 이미지 전달
    });
  }

  Widget getImageWidget() {
    try {
      if (_image == null) {
        return Text("이미지를 선택해주세요.");
      } else {
        return Image.file(File(_image!.path));
      }
    } catch (e) {
      return Text("이미지를 선택해주세요.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        getImageWidget(),
        ElevatedButton(
          onPressed: pickImage,
          child: Text("이미지 선택하기"),
        ),
      ],
    );
  }
}