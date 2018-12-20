import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottom: _buildBelowAppBar(),
      ),
      body: Center(child: Text('History')),
    );
  }
}
