import 'package:chadenn/history_screen/history_screen.dart';
import 'package:chadenn/loading_screen/loading_screen.dart';
import 'package:chadenn/model/code_model.dart';
import 'package:chadenn/scanner_screen/scanner_screen.dart';
import 'package:chadenn/settings_screen/settings_screen.dart';
import 'package:chadenn/home_screen.dart';
import 'package:chadenn/utils/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(ChadennApp());
}

class ChadennApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: chadenn_color,
          displayColor: chadenn_color,
        );

    return ScopedModel<CodeModel>(
      model: CodeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Proxima Nova',
          textTheme: newTextTheme,
          primaryColor: Colors.white,
          primaryIconTheme: IconThemeData(color: chadenn_color),
        ),
        title: 'Chadenn',
        routes: {
          '/': (BuildContext context) => LoadingScreen(),
          '/UserManual': (BuildContext context) => UserManual(),
          '/ScannerScreen': (BuildContext context) => ScannerScreen(),
          '/SettingsScreen': (BuildContext context) => SettingsScreen(),
          '/HistoryScreen': (BuildContext context) => HistoryScreen(),
        },
      ),
    );
  }
}
