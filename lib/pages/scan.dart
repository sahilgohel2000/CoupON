import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class  Scan extends StatefulWidget{
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan>{

    String _scanBarcode = "";
    Future<void> scanBarcode() async {
      String barcodeScanRes;

      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);

      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: FlatButton(
            onPressed: scanBarcode,
            child: Text(
              "Scan",
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
            shape: StadiumBorder(),
          ),
        ),
      );
    //
    }
  }
