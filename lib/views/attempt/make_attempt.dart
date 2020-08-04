import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'review_attempt.dart';
import '../../utilities/app_widgets.dart';
import '../../utilities/style.dart' as Style;

class MakeAttemptScreen extends StatelessWidget {
  _goToReviewAttempt(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => ReviewAttemptScreen(),
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
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Internship Mobile Exam',
                      style: Style.heading2,
                    ),
                    SizedBox(height: 40),
                    AttemptQuestionWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 32, 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: Style.themeBlack,
              ),
              alignment: Alignment.centerLeft,
              onPressed: () {},
            ),
            SmallButton(
              label: 'Next',
              onTap: () {
                _goToReviewAttempt(context);
              },
              icon: Icons.keyboard_backspace,
              reverseIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AttemptQuestionWidget extends StatelessWidget {
  final bool isMultiOption = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            constraints: BoxConstraints.tightFor(
              width: double.maxFinite,
            ),
            child: Text(
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
              style: Style.body1,
            ),
          ),
          Text(
            isMultiOption
                ? 'Select all options that apply'
                : 'Select only one (1) option',
            style: Style.body3Bold,
          ),
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  CustomCheckBox(initialValue: false),
                  Text(
                    "A.  Option $i",
                    style: Style.body2Bold,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
