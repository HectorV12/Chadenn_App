import 'package:chadenn/scanner_screen/flash_button/flash_button.dart';
import 'package:chadenn/scanner_screen/manual_search_dialog/manual_search_dialog.dart';
import 'package:chadenn/scanner_screen/scanner.dart';
import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  PreferredSizeWidget _buildBelowAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(110.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlashButton(),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: 'History',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/HistoryScreen');
                    },
                    child: Icon(Icons.menu),
                    backgroundColor: chadenn_color,
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                  Text(
                    'History',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: 'Search',
                    onPressed: () {
                      qrCameraKey.currentState.stop();
                      showDialog(
                        context: context,
                        builder: (_) => ManualSearchDialog(),
                      );
                    },
                    child: Icon(Icons.search),
                    backgroundColor: chadenn_color,
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                  Text(
                    'Manual Search',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        bottom: _buildBelowAppBar(context),
        title: Text(
          'Barcode Scanner',
          style: TextStyle(
              color: chadenn_color,
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Scanner(),
    );
  }
}
