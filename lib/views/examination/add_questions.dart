import 'package:flutter/material.dart';
import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';

class AddQuestionsScreen extends StatelessWidget {
  final GlobalKey<CustomCheckBoxState> singleAnswerOption = GlobalKey();
  final GlobalKey<CustomCheckBoxState> multipleAnswerOption = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PageHeader(
            heading: "Add Questions",
            nextActionLabel: 'Finish',
            nextAction: () {},
            canPop: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                ),
                //   color: Colors.cyan,
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, right: 16),
                      child: Text(
                        'Biomedical Engineering Exam',
                        style: Style.heading1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'College of Linguistics',
                        style: Style.heading2,
                      ),
                    ),
                    Text(
                      '50 questions',
                      style: Style.smallHeading,
                    ),
                    SizedBox(height: 16),
                    OverheadLabelTextField(
                      label: 'Question 3',
                      canGrow: false,
                      minLines: 1,
                      maxLines: 16,
                    ),
                    Row(
                      children: <Widget>[
                        CustomCheckBox(
                          key: singleAnswerOption,
                          initialValue: true,
                          choice: 'Single Answer',
                          onChanged: (newVal) {
                            multipleAnswerOption.currentState.toggleValue();
                          },
                        ),
                        Spacer(),
                        CustomCheckBox(
                          key: multipleAnswerOption,
                          initialValue: false,
                          choice: 'Multiple Answers',
                          onChanged: (newVal) {
                            singleAnswerOption.currentState.toggleValue();
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 16),
                    ExamOptionInput('A'),
                    ExamOptionInput('B'),
                    ExamOptionInput('C'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RawMaterialButton(
                        onPressed: () {},
                        fillColor: Style.themeGreenLight,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        constraints:
                            BoxConstraints.tightFor(width: 108, height: 32),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Add Option',
                              style: Style.smallButtonTextStyle
                                  .copyWith(color: Style.textBlackColor),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.add,
                              color: Style.themeBlack,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32,
                        bottom: 16,
                      ),
                      child: Text('Solution', style: Style.fieldLabelTextStyle),
                    ),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: <Widget>[
                        ExamSolutionTile(
                          'A',
                          isAnswer: true,
                        ),
                        ExamSolutionTile(
                          'B',
                          isAnswer: false,
                        ),
                        ExamSolutionTile(
                          'C',
                          isAnswer: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    ContinueButton(
                      label: 'Next Question',
                      onTap: () {},
                    ),
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

class ExamOptionInput extends StatelessWidget {
  final String count;
  const ExamOptionInput(
    this.count, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('$count.', style: Style.body2),
        SizedBox(width: 16),
        Expanded(child: RegularLabelTextField()),
      ],
    );
  }
}
