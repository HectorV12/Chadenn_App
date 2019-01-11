import 'package:chadenn/home_screen.dart';
import 'package:chadenn/model/code_model.dart';
import 'package:chadenn/product_details_screen/product_details_screen.dart';
import 'package:chadenn/scanner_screen/scanner.dart';
import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

bool fromHistory = false;

class HistoryScreen extends StatefulWidget {
  @override
  HistoryScreenState createState() {
    return new HistoryScreenState();
  }
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    ScopedModel.of<CodeModel>(context).getHistoryList();
    super.initState();
  }

  AppBar _buildBelowAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'History',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: chadenn_color,
        ),
      ),
    );
  }

  void _navPop(BuildContext context) {
    qrCameraKey.currentState.restart();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        notScanned ? Navigator.pop(context) : _navPop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          bottom: _buildBelowAppBar(),
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                notScanned ? Navigator.pop(context) : _navPop(context);
              }),
        ),
        body: ScopedModelDescendant<CodeModel>(
          builder: (context, child, model) {
            return model.listTwo.isEmpty || model.listTwo == null
                ? Center(
                    child: Text(
                    'Empty',
                    style: TextStyle(fontSize: 20.0),
                  ))
                : ListView.builder(
                    itemCount: model.listTwo.length,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 5.0,
                          margin: EdgeInsets.all(10.0),
                          child: ListTile(
                            title: Text(
                                'Product Name : ${model.listGetNames[index]}'),
                            onTap: () async {
                              var _route = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProductDetails(
                                      productCode: model.listTwo[index],
                                    ),
                              );
                              fromHistory = true;
                              await Navigator.of(context).push(_route);
                            },
                          ));
                    },
                  );
          },
        ),
      ),
    );
  }
}
