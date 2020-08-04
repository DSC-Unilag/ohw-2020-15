import 'package:ExaminationAppOHW20/controllers/authentication_controller.dart';
import 'package:ExaminationAppOHW20/views/authentication/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboarding.dart';
import '../../utilities/style.dart' as Style;

class SplashScreen extends StatelessWidget {
  onAppStart(BuildContext context) async {
    final auth = Provider.of<AuthController>(context);
    //await auth.saveUserEmailOnDevice();
    await auth.logoutFromDevice();
    final userEmail = await auth.checkDeviceForUser();
    Widget route;
    if (userEmail == false)
      route = OnboardingScreen();
    else
      route = LoginScreen();

    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (_) => route,
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
