import 'package:flutter/material.dart';
import '../../utilities/app_widgets.dart';
import '../../utilities/style.dart' as Style;

class EndAttemptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: AttemptDetailsCard(),
              ),

              AppNotification(
                heading: 'EXAM SUBMITTED',
                body:
                    "Your attempt has been submitted for grading. Please check the exam’s page later for your graded performance.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
