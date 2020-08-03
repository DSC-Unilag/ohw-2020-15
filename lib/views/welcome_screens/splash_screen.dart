import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';
import '../../utilities/style.dart' as Style;

class SplashScreen extends StatelessWidget {
  onAppStart(BuildContext context) async {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (_) => OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    onAppStart(context);
    return Scaffold(
      backgroundColor: Style.themeBlueLight,
      body: Center(
        child: Icon(
          Style.OhwExamAppIcons.ohwExamAppIcon,
          color: Style.themeGreen,
          size: 72,
        ),
      ),
    );
  }
}
