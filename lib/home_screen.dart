import 'package:flutter/material.dart';
import './scan.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var eventOps = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MUN QR Code Scanner'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
            child: RaisedButton(
                color: Colors.teal,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  eventOps = 'a';
                  ScanScreen(
                    eventOps: eventOps,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanScreen()),
                  );
                },
                child: const Text('Option A')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
            child: RaisedButton(
                color: Colors.teal,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  eventOps = 'b';
                  ScanScreen(
                    eventOps: eventOps,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanScreen()),
                  );
                },
                child: const Text('Option B')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
            child: RaisedButton(
                color: Colors.teal,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  eventOps = 'c';
                  ScanScreen(
                    eventOps: eventOps,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanScreen()),
                  );
                },
                child: const Text('Option C')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
            child: RaisedButton(
                color: Colors.teal,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  eventOps = 'd';
                  ScanScreen(
                    eventOps: eventOps,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanScreen()),
                  );
                },
                child: const Text('Option D')),
          ),
        ],
      )),
    );
  }
}
