import 'package:chadenn/api/openfoodfacts_api.dart';
import 'package:flutter/material.dart';
import 'package:chadenn/scanner_screen/scanner.dart';

class ProductDetails extends StatelessWidget {
  final String productCode;

  ProductDetails({Key key, @required this.productCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              qrCameraKey.currentState.restart();
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: FutureBuilder<Product>(
          future: fetchProduct(productCode),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      snapshot.data.imageUrl == null
                          ? Text('Product Image Not Found\n')
                          : Image.network(snapshot.data.imageUrl),
                      Text('Product Status: ' + snapshot.data.statusVerbose),
                      Text('Prodcut Barcode#: ' + snapshot.data.code),
                      Text('Prodcut Brand: ' + snapshot.data.brand),
                      Text('Prodcut Name: ' + snapshot.data.productName),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
