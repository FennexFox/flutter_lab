import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Mission02Adv());
}

String urlBuilder({
  required String baseUrl,
  required String serviceKey,
  String dataType = "JSON",
  String baseDate = "20241228",
  String baseTime = "0600",
  String pageNo = "1",
  String numOfRows = "1",
  Map<String, int> location = const {"nx": 50, "ny": 127},
}) {
  final String url = '''$baseUrl
              ?serviceKey=$serviceKey
              &dataType=$dataType
              &base_date=$baseDate
              &base_time=$baseTime
              &nx=${location["nx"].toString()}
              &ny=${location["ny"].toString()}
              &pageNo=$pageNo
              &numOfRows=$numOfRows''';

  return url.replaceAll(RegExp(r'\s'), '');
}

class Mission02Adv extends StatefulWidget {
  const Mission02Adv({super.key});

  @override
  Mission02AdvState createState() => Mission02AdvState();
}

class Mission02AdvState extends State<Mission02Adv> {
  String result = '';

  String baseUrl = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst';
  String serviceKey = 'e3y5bmW4gHrlZbbHtfTkACHTcZTeOX%2FXkwFkii7Czg8rPoHpV86Ur6vu8K8m516wzbdo9cSZ7XRAhj1c7We0xw%3D%3D';
  String baseDate = DateTime.now().toString().substring(0, 10).replaceAll('-', '');
  String baseTime = "${DateTime.now().toString().substring(11, 13)}00";

  onPressedGet() async {
    Map<String, String> headers = {
      "accept": "application/json",
    };
    String url = urlBuilder(baseUrl: baseUrl, serviceKey: serviceKey, baseDate: baseDate, baseTime: baseTime);

    http.Response response = await http.get(
        Uri.parse(url.replaceAll(RegExp(r'\s'), '')),
        headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        result = response.body;
      });
    } else {
      setState(() {result = "status: ${response.statusCode}, url: $url";});
      debugPrint('${response.statusCode}');
    }
  }

  onPressedClear() {
    setState(() {
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission02Adv'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('result: $result'),
              ElevatedButton(
                onPressed: onPressedGet,
                child: const Text('http GET'),
              ),
              ElevatedButton(
                onPressed: onPressedClear,
                child: const Text('Clear result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}