import 'package:chadenn/settings_screen/about_page/about_page.dart';
import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  AppBar _buildBelowAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Settings',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: chadenn_color,
        ),
      ),
    );
  }

  Widget _buildSettingsBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 52.0,
          ),
          ListTile(
            title: Text(
              'About',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              var _route = MaterialPageRoute(
                builder: (BuildContext context) => AboutPage(),
              );
              Navigator.of(context).push(_route);
            },
          ),
        ],
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
      backgroundColor: Colors.white,
      body: _buildSettingsBody(context),
    );
  }
}
