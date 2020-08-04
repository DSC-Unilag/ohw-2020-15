import 'dart:math';

import 'package:ExaminationAppOHW20/utilities/loading_and_toasts.dart';
import 'package:ExaminationAppOHW20/views/attempt/end_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_widgets.dart';
import '../../utilities/style.dart' as Style;

class ReviewAttemptScreen extends StatelessWidget {
  _saveAttempt(BuildContext context) async {
    Indicator.showLoading(context);
    await Future.delayed(Duration(seconds: 4))
        .then((value) => Indicator.closeLoading(context));
    Indicator.showToast(context, 'Submitted');
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
                margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
                      child: ListView.separated(
                        itemBuilder: (_, index) {
                          return AttemptReviewQuestionWidget();
                        },
                        itemCount: 30,
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 16),
                            child: Divider(color: Style.themeBlack),
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
            _saveAttempt(context);
          },
        ),
      ),
    );
  }
}

class AttemptReviewQuestionWidget extends StatelessWidget {
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
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  if (i == Random().nextInt(3))
                    SquareDot()
                  else
                    SizedBox(width: 18),
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
