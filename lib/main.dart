import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Chopes", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _chope = 0;
  String _infoText = "Desce mais um!";

  void _changeChope(int delta) {
    setState(() {
      _chope += delta;

      if (_chope < 0) {
        _infoText = "Alguém deve Chope pra você?!";
      } else if (_chope <= 10) {
        _infoText = "Desce mais um!";
      } else {
        _infoText = "Vamos com calma...";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/chope-caneca.jpeg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                "images/flutter.png",
              height: 50.0,
            ),
            Text("Chopes: $_chope",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changeChope(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changeChope(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0,
                    decoration: TextDecoration.none)),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _chope = 0;
                });
              },
              child: const Text('Zerar', style: TextStyle(fontSize: 20)),
            ),
          ],
        )
      ],
    );
  }
}
