import 'package:ExaminationAppOHW20/views/examination/exam_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/style.dart' as Style;
import '../utilities/app_widgets.dart';
import 'examination/create_exam.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedTab = 1;
  List<BottomNavigationBarItem> navigationButtons = [
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
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => CreateExamScreen(),
              ),
            );
          },
          onLongPress: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => ExamPageScreen(),
              ),
            );
          },
          child: Text(
            'Create Exam. LongPress for exam screen',
          ),
        ),
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
          items: navigationButtons,
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
