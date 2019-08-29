import 'package:flutter/material.dart';
import './scan.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildRaisedButton(String val, String value) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 2.0),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
          buildRaisedButton('breakfast-1', 'Breakfast-1'),
          buildRaisedButton('lunch-1', 'Lunch-1'),
          buildRaisedButton('hi-tea-1', 'Hi-Tea-1'),
          buildRaisedButton('gala-dinner', 'Gala dinner'),
          buildRaisedButton('breakfast-2', 'Breakfast-2'),
          buildRaisedButton('lunch-2', 'Lunch-2'),
          buildRaisedButton('hi-Tea-2', 'Hi-Tea-2'),
          buildRaisedButton('ball-entry', 'Ball entry')
        ],
      )),
    );
  }
}
