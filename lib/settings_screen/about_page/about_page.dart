import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  AppBar _buildBelowAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'About',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: chadenn_color,
        ),
      ),
    );
  }

  _launchWebsite() async {
    const url = 'https://Chadenn.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/company/chadenn/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchOpenFoodFacts() async {
    const url = 'https://en.wiki.openfoodfacts.org/Main_Page';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchTwitter() async {
    const url = 'https://twitter.com/chadenn_io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottom: _buildBelowAppBar(),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/chadenn_logo.png'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Our goal is to make the world a better place by leveraging GIS '
                      'and blockchain technologies to improve traceability within '
                      'the agtech and foodtech industries.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Links',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: chadenn_color,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/chadenn_icon.png'),
                    onPressed: _launchWebsite,
                    iconSize: 50.0,
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.blue,
                    ),
                    onPressed: _launchLinkedIn,
                    iconSize: 50.0,
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: _launchTwitter,
                    iconSize: 50.0,
                  ),
                ],
              ),
              //Credits
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Credits',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: chadenn_color,
                  ),
                ),
              ),
              IconButton(
                icon: Image.asset('assets/openfoodfacts-logo.png'),
                onPressed: _launchOpenFoodFacts,
                iconSize: 100.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
