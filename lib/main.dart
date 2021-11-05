import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  State createState() => new _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer? _timer;
  int _start = 10;

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              //
              _start = _start + 30;
            } else {
              _start = _start - 1;
            }
            if (_start < 30) {
              num = 1;
            }
            if (_start < 20) {
              num = 2;
            }
            if (_start < 10) {
              num = 3;
            }
          },
        ),
      );
    }
  }

  var num = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Cветофор")),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(50)),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/${num}.png',
                ),
                radius: 75,
              ),
              Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                onPressed: () {
                  startTimer();
                },
                child: Text("Начать"),
              ),
            ],
          ),
        ));
  }
}
