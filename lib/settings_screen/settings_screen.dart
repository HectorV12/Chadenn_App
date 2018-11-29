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

  Widget _buildSettingsBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 52.0,
          ),
          Text(
            'Accounts',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.left,
          ),
          ListTile(
            title: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Change Profile',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.left,
          ),
          ListTile(
            title: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Change Profile',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
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
      body: _buildSettingsBody(),
    );
  }
}
