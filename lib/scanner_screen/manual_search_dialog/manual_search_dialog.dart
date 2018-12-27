import 'package:chadenn/product_details_screen/product_details_screen.dart';
import 'package:chadenn/scanner_screen/scanner.dart';
import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';

class ManualSearchDialog extends StatefulWidget {
  @override
  ManualSearchDialogState createState() {
    return new ManualSearchDialogState();
  }
}

class ManualSearchDialogState extends State<ManualSearchDialog> {
  final _code = TextEditingController();

  bool _validate = false;

  //Navigates to Product Details Screen
  _navigate() async {
    var route = MaterialPageRoute(
      builder: (BuildContext context) => ProductDetails(
            productCode: _code.text,
          ),
    );
    return await Navigator.of(context).push(route).then((_) {
      Navigator.pop(context);
      _code.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        hasScanned = false;
        qrCameraKey.currentState.restart();
        Navigator.pop(context);
      },
      child: SimpleDialog(
        title: Text(
          'Enter Barcode Number',
          style: TextStyle(fontSize: 19.0),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        children: <Widget>[
          SimpleDialogOption(
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Barcode#',
                errorText: _validate ? 'Please Enter A Valid Barcode' : null,
              ),
              controller: _code,
              textInputAction: TextInputAction.none,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  if (_code.text.isEmpty ||
                      _code.text.length < 12 ||
                      _code.text.length > 13 ||
                      _code.text.contains(' ')) {
                    return _validate = true;
                  }
                  _navigate();
                });
              },
              icon: Icon(Icons.search),
              label: Text('Search'),
              backgroundColor: chadenn_color,
            ),
          ),
        ],
      ),
    );
  }
}
