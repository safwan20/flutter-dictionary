import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'show.dart';

class Show extends StatelessWidget {
  Show({this.mean});
  final String mean;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            },
          ),
        ),
        body: Center(
          child: Text(
            mean,
            style: TextStyle(fontFamily: 'Railway', fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
