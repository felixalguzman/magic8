import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Magic8',
              style: TextStyle(fontSize: 32),
            ),
            centerTitle: true,
          ),
          body: Main()),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var numeroImagen = 1;

  @override
  void initState() {
    ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        cambiarImagen();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[900],
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        cambiarImagen();
                      });
                    },
                    child: Image.asset('images/ball$numeroImagen.png')))
          ],
        ),
      ),
    );
  }

  void cambiarImagen() {
    numeroImagen = Random().nextInt(5) + 1;
  }
}
