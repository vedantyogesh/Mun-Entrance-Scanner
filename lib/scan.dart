import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  final String eventOps;
  ScanScreen({this.eventOps});

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<ScanScreen> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  String barcode = "";

  @override
  initState() {
    print(widget.eventOps);
    super.initState();
  }

  _buildSnackBar(String val) {
    print('Working');
    final snackBar = SnackBar(
      content: Text(val),
      backgroundColor: Colors.teal,
      duration: Duration(seconds: 1),
    );
    _key.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text('QR Code Scanner'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(50),
                child: FloatingActionButton.extended(
                  label: Text('Scan'),
                  icon: Icon(Icons.camera),
                  onPressed: scan,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: RaisedButton(
              //       color: Colors.blue,
              //       textColor: Colors.white,
              //       splashColor: Colors.blueGrey,
              //       onPressed: _buildSnackBar,
              //       child: const Text('START CAMERA SCAN')),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              //   child: Text(
              //     barcode,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      print(barcode);
      print(widget.eventOps);
      //setState(() => this.barcode = barcode);
      var resp = await postreq(barcode, widget.eventOps);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown e: $e');
    }
  }

  Future<http.Response> postreq(String qrcode, String eventname) async {
    String url = 'https://munqr.herokuapp.com/verify-qr?qr=' +
        qrcode +
        '&eventName=' +
        eventname;
    print("1" + url);

    // Map<String, dynamic> Body = {'qr': qrcode, 'eventName': eventname};
    // http
    //     .post(
    //   Uri.encodeFull(url),
    //   headers: {"Content-Type": "application/json"},
    //   body: Body,
    // )
    print("in here");
    http.post(Uri.encodeFull(url)).then((http.Response resp) {
      print(resp.body);
      int data = jsonDecode(resp.body)["response"];
      if (data == 0)
        _buildSnackBar('Not Registerd');
      else if (data == 1)
        _buildSnackBar('Success');
      else if (data == 2) _buildSnackBar('Repeated');
      print(data);
      return data;
    });
  }
}
