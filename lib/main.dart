import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'spin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('dictionary'),
      ),
      body: Dict(),
    ));
  }
}

class Dict extends StatefulWidget {
  @override
  _DictState createState() => _DictState();
}

class _DictState extends State<Dict> {
  String task = '';

  Future<String> call(String vocab) async {
    try {
      var url =
          'https://www.dictionaryapi.com/api/v3/references/thesaurus/json/$vocab?key=7927a10d-7959-4b5a-81e4-fc5ced848e9b';
      var response = await http.get(url);
      final decoded = json.decode(response.body);
      String meaning = decoded[0]['def'][0]['sseq'][0][0][1]['dt'][0][1];
      return meaning;
    } catch (e) {
      return 'Wrong';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        TextField(
          decoration: InputDecoration(fillColor: Colors.white, filled: true),
          onChanged: (value) {
            print(value);
            task = value;
          },
        ),
        SizedBox(
          height: 30,
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Spin(
                  mean: task,
                ),
              ),
            );
          },
          child: Text(
            'Show',
          ),
          color: Colors.blue,
        ),
      ],
    );
  }
}
