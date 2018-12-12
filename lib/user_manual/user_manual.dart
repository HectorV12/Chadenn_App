import 'package:chadenn/user_manual/user_manual_pages/user_manual_page1.dart';
import 'package:chadenn/user_manual/user_manual_pages/user_manual_page2.dart';
import 'package:chadenn/user_manual/user_manual_pages/user_manual_page3.dart';
import 'package:chadenn/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class UserManual extends StatefulWidget {
  @override
  UserManualState createState() {
    return new UserManualState();
  }
}

class UserManualState extends State<UserManual> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    _buildPageView() {
      return Container(
        height: MediaQuery.of(context).size.height / 1.2,
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            UserManualPage1(),
            UserManualPage2(),
            UserManualPage3(),
          ],
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          },
        ),
      );
    }

    _buildCircleIndicator() {
      return Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 40.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CirclePageIndicator(
            dotColor: chadenn_color.withOpacity(0.1),
            selectedDotColor: chadenn_color,
            itemCount: 3,
            currentPageNotifier: _currentPageNotifier,
            size: 10.0,
          ),
        ),
      );
    }

    _buildBody() {
      return Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _buildPageView(),
              _buildCircleIndicator(),
            ],
          ),
        ],
      );
    }

    _buildBottomNavBar() {
      return BottomAppBar(
        //elevation: 0.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0, left: 20.0, right: 20.0),
          child: Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: chadenn_color,
                    ),
                    onPressed: () {},
                  ),
                  Text('History'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: chadenn_color,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/SettingsScreen');
                    },
                  ),
                  Text('Settings'),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 80.0,
        height: 80.0,
        child: new RawMaterialButton(
          fillColor: chadenn_color,
          shape: new CircleBorder(),
          elevation: 10.0,
          //highlightElevation: 25.0,
          child: new Icon(
            CupertinoIcons.fullscreen,
            color: Colors.white,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/ScannerScreen');
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      body: _buildBody(),
    );
  }
}
