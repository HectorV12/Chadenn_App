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
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              hasScanned = false;
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
                          ? Text('Image Not Found\n')
                          : Image.network(snapshot.data.imageUrl),
                      snapshot.data.code == null
                          ? Text('Product Code Not Found\n')
                          : Text('Prodcut Barcode#: ' + snapshot.data.code),
                      snapshot.data.brand == null
                          ? Text('Product Brand Not Found\n')
                          : Text('Prodcut Brand: ' + snapshot.data.brand),
                      snapshot.data.productName == null
                          ? Text('Product Name Not Found\n')
                          : Text('Prodcut Name: ' + snapshot.data.productName),
                    ],
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                      child: Text(
                    'PRODUCT NOT FOUND\n\n OR\n\n TRY AGAIN',
                    textAlign: TextAlign.center,
                  ));
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
