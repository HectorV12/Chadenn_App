import 'package:chadenn/api/openfoodfacts_api.dart';
import 'package:chadenn/history_screen/history_screen.dart';
import 'package:chadenn/model/code_model.dart';
import 'package:flutter/material.dart';
import 'package:chadenn/scanner_screen/scanner.dart';
import 'package:scoped_model/scoped_model.dart';

bool _scannedTwice = false;

class ProductDetails extends StatelessWidget {
  final String productCode;

  ProductDetails({Key key, @required this.productCode}) : super(key: key);

  void _navigate(BuildContext context) {
    hasScanned = false;
    qrCameraKey.currentState.restart();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        fromHistory ? Navigator.pop(context) : _navigate(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                fromHistory ? Navigator.pop(context) : _navigate(context);
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
                  _scannedTwice = false;

                  /*
                  * Start of the details of the product
                  * TODO: Organize Code
                  * */
                  return ScopedModelDescendant<CodeModel>(
                      builder: (context, child, model) {
                    model.addString(
                        snapshot.data.code, snapshot.data.productName);
                    return ListView(
                      children: <Widget>[
                        AppBar(
                          automaticallyImplyLeading: false,
                          flexibleSpace: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Center(
                                      child: snapshot.data.imageUrl == null
                                          ? Container(
                                              color: Colors.grey.shade200,
                                              child: Center(
                                                  child:
                                                      Text('Image Not Found')),
                                              width: 137.0,
                                              height: 137.0,
                                            )
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
                                              ? Text(
                                                  'Product Brand Not Found\n')
                                              : Text(
                                                  '${snapshot.data.brand}\n',
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                //replacement for smart labels
                                Container(
                                  margin: EdgeInsets.only(bottom: 5.0),
                                  height: 40.0,
                                  child: Center(
                                    child: Text(
                                      'Barcode# : ${snapshot.data.code}',
                                      style: TextStyle(
                                        color: Color(0xFF7393b4),
                                      ),
                                    ),
                                  ),
                                ),
//                              //Placeholder for any smart labels
//                              Padding(
//                                padding: const EdgeInsets.only(bottom: 5.0),
//                                child: Row(
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceEvenly,
//                                  children: <Widget>[
//                                    Container(
//                                      width: 40.0,
//                                      height: 40.0,
//                                    ),
//                                    Container(
//                                      width: 40.0,
//                                      height: 40.0,
//                                    ),
//                                    Container(
//                                      width: 40.0,
//                                      height: 40.0,
//                                    ),
//                                  ],
//                                ),
//                              ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 32.0,
                                  right: 16.0,
                                  left: 32.0,
                                ),
                                child: Icon(
                                  Icons.wb_sunny,
                                  color: Color(0xFFFF9AAA),
                                  size: 30.0,
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 32.0,
                                    bottom: 32.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'ORIGINS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        height: 40.0,
                                        child: Text(
                                          'Origin of Ingredients:',
                                          style: TextStyle(
                                            color: Color(0xFF122B47),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        height: 40,
                                        child: Text(
                                          snapshot.data.origins == null
                                              ? 'Data Not Found'
                                              : snapshot.data.origins,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFF7393b4),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        height: 40.0,
                                        child: Text(
                                          'Manufacturing Places:',
                                          style: TextStyle(
                                            color: Color(0xFF122B47),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        height: 40,
                                        child: Text(
                                          snapshot.data.origins == null
                                              ? 'Data Not Found'
                                              : snapshot
                                                  .data.manufacturingPlaces,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFF7393b4),
                                          ),
                                        ),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 32.0,
                                  right: 16.0,
                                  left: 32.0,
                                ),
                                child: Icon(
                                  Icons.accessibility_new,
                                  color: Color(0xFFB1EFBC),
                                  size: 30.0,
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 32.0,
                                    bottom: 32.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'HEALTH',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        height: 40.0,
                                        child: Text(
                                          'Nutrition Grade:   ',
                                          style: TextStyle(
                                              color: Color(0xFF122B47),
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.only(top: 5.0),
                                        //height: 40.0,
                                        child: snapshot.data.nutritionGrade ==
                                                'a'
                                            ? Image.network(
                                                'https://static.openfoodfacts.org/images/misc/nutriscore-a.png')
                                            : snapshot.data.nutritionGrade ==
                                                    'b'
                                                ? Image.network(
                                                    'https://static.openfoodfacts.org/images/misc/nutriscore-b.png')
                                                : snapshot.data
                                                            .nutritionGrade ==
                                                        'c'
                                                    ? Image.network(
                                                        'https://static.openfoodfacts.org/images/misc/nutriscore-c.png')
                                                    : snapshot.data
                                                                .nutritionGrade ==
                                                            'd'
                                                        ? Image.network(
                                                            'https://static.openfoodfacts.org/images/misc/nutriscore-d.png')
                                                        : snapshot.data
                                                                    .nutritionGrade ==
                                                                'e'
                                                            ? Image.network(
                                                                'https://static.openfoodfacts.org/images/misc/nutriscore-e.png')
                                                            : Text(
                                                                'Data Not Found',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Color(
                                                                      0xFF7393b4),
                                                                ),
                                                              ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 24.0),
                                        child: Text(
                                          snapshot.data.nutriments == null
                                              ? 'Macronutrients:\n\nData Not Found'
                                              : 'Macronutrients:\n',
                                          style: TextStyle(
                                            color: Color(0xFF122B47),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5.0),
                                        height: 24.0,
                                        child: Text(
                                          snapshot.data.nutriments[
                                                          'carbohydrates'] ==
                                                      null &&
                                                  snapshot.data.nutriments[
                                                          'carbohydrates_unit'] ==
                                                      null
                                              ? 'Carbs: 0g'
                                              : 'Carbs: ${snapshot.data.nutriments['carbohydrates']}g',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFF7393b4),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5.0),
                                        height: 24.0,
                                        child: Text(
                                          snapshot.data.nutriments['fat'] ==
                                                      null &&
                                                  snapshot.data.nutriments[
                                                          'fat_unit'] ==
                                                      null
                                              ? 'Fat: 0g'
                                              : 'Fat: ${snapshot.data.nutriments['fat']}g',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFF7393b4),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5.0),
                                        height: 24.0,
                                        child: Text(
                                          snapshot.data.nutriments[
                                                          'proteins'] ==
                                                      null &&
                                                  snapshot.data.nutriments[
                                                          'proteins_unit'] ==
                                                      null
                                              ? 'Protein: 0g'
                                              : 'Protein: ${snapshot.data.nutriments['proteins']}g',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFF7393b4),
                                          ),
                                        ),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 32.0,
                                  right: 16.0,
                                  left: 32.0,
                                ),
                                child: Icon(
                                  Icons.bubble_chart,
                                  color: Color(0xFFFFD540),
                                  size: 30.0,
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 32.0,
                                    bottom: 32.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'COMPOSITION',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        height: 24.0,
                                        child: Text(
                                          'Ingredients:',
                                          style: TextStyle(
                                            color: Color(0xFF122B47),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: snapshot.data.ingredients == null
                                            ? Text(
                                                'Data Not Found',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xFF7393b4),
                                                ),
                                              )
                                            : Text(
                                                snapshot.data.ingredients,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xFF7393b4),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 32.0, right: 32.0, left: 11.0),
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
                  });
                  /*
                  * END of the details of the product
                  * */
                } else if (snapshot.hasError && !_scannedTwice) {
                  print(snapshot.error);
                  _scannedTwice = true;
                  return Center(
                      child: Text(
                    'PRODUCT NOT FOUND\n\n OR\n\n TRY AGAIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ));
                } else if (snapshot.hasError && _scannedTwice) {
                  return Center(
                      child: Text(
                    'SORRY PRODUCT\nNOT FOUND',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ));
                } else
                  // By default, show a loading spinner
                  return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
