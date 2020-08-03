import 'package:flutter/material.dart';
import '../../utilities/app_widgets.dart';
import '../../utilities/style.dart' as Style;

class ReviewExamQuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox(
        child: Column(
          children: <Widget>[
            PageHeader(
              heading: "Exam Questions",
              canPop: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 600,
                    maxHeight: MediaQuery.of(context).size.height- 200,
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
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, index) {
                            return QuestionWidgetReview();
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
      ),
    );
  }
}
