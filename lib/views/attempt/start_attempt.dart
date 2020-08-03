import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'make_attempt.dart';
import '../../utilities/app_widgets.dart';
import '../../utilities/style.dart' as Style;

class StartAttemptScreen extends StatelessWidget {
  initializeAttempt(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => MakeAttemptScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.themeGreenLight,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Engineering Career Expo',
                  style: Style.heading2,
                ),
              ),
              Text(
                'Internship Mobile Exam',
                style: Style.heading1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SquareDot(),
                    Text(
                      'August 2020 class',
                      style: Style.smallHeading,
                    ),
                  ],
                ),
              ),
              Text(
                'John Doe',
                style: Style.body2,
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          size: 40,
                          color: Style.themeGreen,
                        ),
                        Text(
                          '45 minutes',
                          style: Style.body1,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.help_outline,
                          size: 40,
                          color: Style.themeGreen,
                        ),
                        Text(
                          '50 questions',
                          style: Style.body1,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ExamInstructionsCard(
                color: Style.themeWhite,
              ),
              SizedBox(height: 24),
              ContinueButton(
                label: 'Begin',
                onTap: () {
                  initializeAttempt(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
