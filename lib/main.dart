import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/welcome_screens/splash_screen.dart';
import 'utilities/constants.dart' as Constant;
import 'utilities/style.dart' as Style;
import 'controllers/authentication_controller.dart';

void main() => runApp(ExamApp());

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthController(),
      child: MaterialApp(
        title: Constant.appName,
        home: SplashScreen(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Style.mainBackgroundColor,
          primaryColor: Style.themeGreen,
          accentColor: Style.themeGreenLight,
          secondaryHeaderColor: Style.themeGreen,
          splashColor: Style.themeGreenLight,
        ),
      ),
    );
  }
}
