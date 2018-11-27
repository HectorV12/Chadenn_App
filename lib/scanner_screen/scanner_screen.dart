import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.indigo,
            labelStyle: TextStyle(fontSize: 12.0),
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.flash_off,
                  color: Colors.indigo,
                ),
                text: 'Flash Off',
              ),
              Tab(
                icon: Icon(
                  Icons.menu,
                  color: Colors.indigo,
                ),
                text: 'Scanned Foods',
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  color: Colors.indigo,
                ),
                text: 'Manual Search',
              ),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Barcode Scanner',
            style: TextStyle(color: Colors.indigo),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flash_off),
            Center(
              child: Text(
                'Scanner',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}
