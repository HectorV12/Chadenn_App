import 'package:chadenn/loading_screen/loading_screen.dart';
import 'package:chadenn/scanner_screen/scanner_screen.dart';
import 'package:chadenn/user_manual/user_manual.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChadennApp());

class ChadennApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chadenn',
      routes: {
        '/': (BuildContext context) => LoadingScreen(),
        '/UserManual': (BuildContext context) => UserManual(),
        '/ScannerScreen': (BuildContext context) => ScannerScreen(),
      },
    );
  }
}
