import 'package:chadenn/user_manual/user_manual_pages/user_manual_page1.dart';
import 'package:chadenn/user_manual/user_manual_pages/user_manual_page2.dart';
import 'package:chadenn/user_manual/user_manual_pages/user_manual_page3.dart';
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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.settings_overscan,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/ScannerScreen');
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.indigo,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: _buildBody(),
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
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CirclePageIndicator(
          dotColor: Colors.indigo.shade50,
          selectedDotColor: Colors.indigo,
          itemCount: 3,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}
