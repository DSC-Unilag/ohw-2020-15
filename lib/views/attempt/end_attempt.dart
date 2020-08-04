import 'package:ExaminationAppOHW20/views/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_widgets.dart';
import '../../utilities/style.dart' as Style;

class EndAttemptScreen extends StatelessWidget {
  returnToDashboard(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (_) => Dashboard()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tightFor(
            height: (MediaQuery.of(context).size.height - kToolbarHeight - 50)
                .clamp(200.0, 800.0),
            width: MediaQuery.of(context).size.width.clamp(150.0, 400.0),
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
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: SmallButton(
                    label: 'Finish',
                    onTap: () {
                      returnToDashboard(context);
                    },
                    icon: Icons.home),
              )
            ],
          ),
        ),
      ),
    );
  }
}
