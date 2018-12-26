import 'package:chadenn/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:qr_mobile_vision/qr_mobile_vision.dart';

GlobalKey<QrCameraState> qrCameraKey = GlobalKey();
bool hasScanned = false;

class Scanner extends StatefulWidget {
  @override
  ScannerState createState() {
    return new ScannerState();
  }
}

class ScannerState extends State<Scanner> {
  @override
  initState() {
    super.initState();
  }

  _buildQrCamera() {
    return QrCamera(
      key: qrCameraKey,
      formats: [BarcodeFormats.UPC_A],
      onError: (context, error) => Text(
            error.toString(),
            style: TextStyle(color: Colors.red),
          ),
      qrCodeCallback: (code) {
        if (hasScanned) return;
        hasScanned = true;
        var route = MaterialPageRoute(
          builder: (BuildContext context) => ProductDetails(
                productCode: code,
              ),
        );
        Navigator.of(context).push(route);
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
      notStartedBuilder: (context) => CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildQrCamera();
  }
}
