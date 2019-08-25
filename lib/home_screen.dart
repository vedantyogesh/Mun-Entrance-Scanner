import 'package:flutter/material.dart';
import './scan.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildRaisedButton(String val, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
      child: RaisedButton(
          color: Colors.teal,
          textColor: Colors.white,
          splashColor: Colors.blueGrey,
          onPressed: () {
            eventOps = val;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScanScreen(eventOps: eventOps)),
            );
          },
          child: Text(value)),
    );
  }

  String eventOps = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MUN QR Code Scanner'),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          buildRaisedButton('registeration', 'Registration'),
          buildRaisedButton('b', 'Breakfast-1'),
          buildRaisedButton('c', 'Lunch-1'),
          buildRaisedButton('d', 'Hi-Tea-1'),
          buildRaisedButton('e', 'Gala dinner'),
          buildRaisedButton('f', 'Breakfast-2'),
          buildRaisedButton('g', 'Lunch-2'),
          buildRaisedButton('h', 'Hi-Tea-2'),
          buildRaisedButton('i', 'Ball entry')
        ],
      )),
    );
  }
}
