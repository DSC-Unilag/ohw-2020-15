import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';
import '../dashboard.dart';

class SplashScreen extends StatelessWidget {
  onAppStart(BuildContext context) async {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (_) => Dashboard(),
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
        child: AppIcon(),
      ),
    );
  }
}
