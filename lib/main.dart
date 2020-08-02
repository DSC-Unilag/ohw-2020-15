import 'package:flutter/material.dart';

import 'views/welcome_screens/splash_screen.dart';
import 'utilities/constants.dart' as Constant;
import 'utilities/style.dart' as Style;

void main() => runApp(ExamApp());

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      home: SplashScreen(),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Style.mainBackgroundColor,
      ),
    );
  }
}
