import 'package:ExaminationAppOHW20/views/attempt/end_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_widgets.dart';
import '../../utilities/style.dart' as Style;

class ReviewAttemptScreen extends StatelessWidget {
  saveAttempt(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => EndAttemptScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.themeGreenLight,
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          PageHeader(heading: "Review your attempt"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.help_outline,
                  color: Style.themeGreen,
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  '5',
                  style: Style.body2Bold,
                ),
                Text(
                  "/50",
                  style: Style.body2,
                ),
                Spacer(),
                Icon(
                  Icons.timer,
                  color: Style.themeGreen,
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  '20:04',
                  style: Style.body2,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: MediaQuery.of(context).size.height - 200,
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Internship Mobile Exam',
                        style: Style.heading2,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          return Placeholder(
                            fallbackHeight: 200,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 24),
        child: ContinueButton(
          label: 'Submit your attempt',
          onTap: () {
            saveAttempt(context);
          },
        ),
      ),
    );
  }
}
