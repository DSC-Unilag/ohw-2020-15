import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page_home.dart';
import 'page_profile.dart';
import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedTab = 1;
  List<Widget> pages = [
    Container(),
    HomePage(),
    ProfilePage(),
  ];
  List<BottomNavigationBarItem> _navigationButtons = [
    BottomNavigationBarItem(
      title: Container(),
      icon: Icon(
        Icons.search,
        color: Style.themeGreen,
      ),
    ),
    BottomNavigationBarItem(
      title: Container(),
      icon: Icon(
        Icons.home,
        color: Style.themeGreen,
      ),
    ),
    BottomNavigationBarItem(
      title: Container(),
      icon: Icon(
        Icons.person,
        color: Style.themeGreen,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        constraints: BoxConstraints.tightFor(
          height: MediaQuery.of(context).size.height - kToolbarHeight - 40,
          width: MediaQuery.of(context).size.width,
        ),
        child: pages[selectedTab],
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Style.themeWhite,
          iconSize: 20,
          // selectedItemColor: Style.themeBlue,
          // unselectedItemColor: Style.themeGrey,
          // showUnselectedLabels: true,
          // showSelectedLabels: true,
          // selectedLabelStyle: Style.bodyLabelText.copyWith(
          //   color: Style.themeBlue,
          // ),
          // unselectedLabelStyle: Style.bodyLabelText,
          items: _navigationButtons,
          currentIndex: selectedTab,
          onTap: (int pageIndex) async {
            setState(() {
              selectedTab = pageIndex;
            });
          },
        ),
      ),
    );
  }
}
