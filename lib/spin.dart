import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'show.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Spin extends StatefulWidget {
  Spin({this.mean});
  final String mean;

  @override
  State<StatefulWidget> createState() {
    return _SpinState(means: mean);
  }
}

class _SpinState extends State<Spin> {
  _SpinState({this.means});
  final String means;

  @override
  void initState() {
    super.initState();
    print('heuu$means');
    get();
  }

  void get() async {
    try {
      var url =
          'https://www.dictionaryapi.com/api/v3/references/thesaurus/json/$means?key=7927a10d-7959-4b5a-81e4-fc5ced848e9b';
      var response = await http.get(url);
      final decoded = json.decode(response.body);
      String meaning = decoded[0]['def'][0]['sseq'][0][0][1]['dt'][0][1];
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Show(
          mean: meaning,
        );
      }));
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Show(
          mean: 'Wrong',
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
}
