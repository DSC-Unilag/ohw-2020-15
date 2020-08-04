import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dashboard.dart';
import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';

class SuccesfulSignUpScreen extends StatelessWidget {
  _gotoDashboard(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (_) => Dashboard(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      _gotoDashboard(context);
    });
    return Scaffold(
      backgroundColor: Style.themeBlueLight,
      body: GestureDetector(
        onTap: () {
          _gotoDashboard(context);
        },
        child: Container(
          margin: const EdgeInsets.all(32),
          constraints: BoxConstraints.tightFor(
            height: (MediaQuery.of(context).size.height - kToolbarHeight - 40)
                .clamp(600.00, 900.00),
            width: MediaQuery.of(context).size.width.clamp(150.00, 400.00),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Style.OhwExamAppIcons.ohwExamAppIcon,
                  size: 72,
                  color: Style.themeGreen,
                ),
                Expanded(
                  child: Center(
                    child: AppNotification(
                        heading: 'ACCOUNT CREATED!',
                        body:
                            'Your account has been created. Find your institution and enroll in a class to take tests.'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
