import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
//import 'package:barcode_scan/barcode_scan.dart';

class Scanner extends StatefulWidget {
  @override
  ScannerState createState() {
    return new ScannerState();
  }
}

class ScannerState extends State<Scanner> {
  String qr;
  //bool camState = false;

  @override
  initState() {
    super.initState();
  }

  _buildQrCamera() {
    return QrCamera(
      onError: (context, error) => Text(
            error.toString(),
            style: TextStyle(color: Colors.red),
          ),
      qrCodeCallback: (code) {
        //setState(() {
        qr = code;
        print(qr);
        //});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Align Barcode Inside Box',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildQrCamera();
  }
}
