import 'package:flutter/material.dart';
import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';

class ExamPageScreen extends StatelessWidget {
  final bool isStudent = false;
  final bool isOpened = true;
  final bool hasAttempt = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          PageHeader(
            heading: "Exam",
            canPop: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        children: <Widget>[
                          SquareDot(),
                          Expanded(
                            child: Text(
                              'August 2020 class',
                              style: Style.smallHeading,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              'Opens',
                              style: Style.body3Light,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "10:00 am \nTuesday, \n5 November, 2020",
                              style: Style.body3Bold,
                            ),
                          ),
                          // SizedBox(width: 32),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              'Closes',
                              style: Style.body3Light,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "10:00 am \nTuesday, \n5 November, 2020",
                              style: Style.body3Bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isStudent && hasAttempt) AttemptDetailsCard(),
                    if (!isStudent && isOpened) SummaryOfAttempts(),
                    ExamDataCard(),
                    if (!isStudent) ExamInstructionsCard(),
                    if (isStudent && !hasAttempt)
                      ContinueButton(label: 'Start Attempt', onTap: null),
                    if (isStudent && hasAttempt)
                      ContinueButton(label: 'Review Attempt', onTap: null),
                    if (!isStudent)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SmallButton(
                            label: 'Questions',
                            onTap: () {},
                            icon: Icons.edit,
                          ),
                          SmallButton(
                            label: "Attempts",
                            onTap: () {},
                            icon: Icons.playlist_add_check,
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
