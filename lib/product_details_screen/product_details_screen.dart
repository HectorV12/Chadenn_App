import 'package:chadenn/api/openfoodfacts_api.dart';
import 'package:flutter/material.dart';
import 'package:chadenn/scanner_screen/scanner.dart';

class ProductDetails extends StatelessWidget {
  final String productCode;

  ProductDetails({Key key, @required this.productCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        hasScanned = false;
        qrCameraKey.currentState.restart();
        Navigator.pop(context);
      },
      child: Scaffold(
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
        body: FutureBuilder<Product>(
          future: fetchProduct(productCode),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  /*
                  * Start of the details of the product
                  * TODO: Organize Code
                  * */
                  return ListView(
                    children: <Widget>[
                      AppBar(
                        automaticallyImplyLeading: false,
                        flexibleSpace: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Center(
                                    child: snapshot.data.imageUrl == null
                                        ? Text('Image Not Found\n')
                                        : Image.network(
                                            snapshot.data.imageUrl,
                                            width: 137.0,
                                            height: 137.0,
                                          ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        snapshot.data.brand == null
                                            ? Text('Product Brand Not Found\n')
                                            : Text(
                                                '${snapshot.data.brand}',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF284563),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                        snapshot.data.productName == null
                                            ? Text('Product Name Not Found\n')
                                            : Text(
                                                '${snapshot.data.productName}\n',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF284563),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                        Text(
                                          'Best Before:',
                                          style: TextStyle(
                                            color: Color(0xFF284563),
                                          ),
                                        ),
                                        Text(
                                          '(Date)',
                                          style: TextStyle(
                                            color: Color(0xFF91A6BB),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 32.0,
                                  top: 32.0,
                                  bottom: 32.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 24.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 24.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFE1E8EF),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 32.0,
                                  top: 32.0,
                                  bottom: 32.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 24.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 24.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFE1E8EF),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 32.0,
                                  top: 32.0,
                                  bottom: 32.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 24.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 24.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                      width: 120.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      color: Colors.grey,
                                      height: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFE1E8EF),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                  /*
                  * END of the details of the product
                  * */
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
