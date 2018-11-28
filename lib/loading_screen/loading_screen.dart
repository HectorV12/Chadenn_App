import 'dart:async';

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 2000);
    return new Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
    Navigator.of(context).pushReplacementNamed('/UserManual');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Image.asset('assets/welcome_screen.png'),
      ),
    );
  }
}
