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
  String barcode = "";

  @override
  initState() {
    print(widget.eventOps);
    super.initState();
  }

  Widget buildSnackBar() {
    return SnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR Code Scanner'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: scan,
                    child: const Text('START CAMERA SCAN')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  barcode,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barCode = await BarcodeScanner.scan();
      print(barCode);
      print(widget.eventOps);
      //setState(() => this.barcode = barcode);
      var resp = await postreq(barCode, widget.eventOps);
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

  Future<http.Response> postreq(String qrCode, String eventName) async {
    String url = 'https://munqr.herokuapp.com/verify-qr?qr=' +
        qrCode +
        '&eventName=' +
        eventName;
    print("1" + url);

    print("in here");
    http.post(Uri.encodeFull(url)).then((http.Response resp) {
      print(resp.body);
      int data = jsonDecode(resp.body)["response"];
      if (data == 0) {}
      print(data.runtimeType.toString());
      return data;
    });
  }
}
