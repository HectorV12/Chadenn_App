import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';

class UserManualPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'SIMPLY\nTRY',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            color: chadenn_color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset('assets/page3.png'),
      ],
    );
  }
}
